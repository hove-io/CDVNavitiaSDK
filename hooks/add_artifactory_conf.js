module.exports = function(ctx) {
	var fs = require('fs');
	var os = require('os');
	var path = require('path');
	var package;
	try {
		package = require(ctx.opts.projectRoot + '/package.json');
	} catch (err) {
		console.log(err);
	}

	var loadConfigXMLFile = function() {
		try {
			var fs = require('fs');
			var xml2js = require('xml2js');
			var fileData = fs.readFileSync("config.xml", 'ascii');
			var parser = new xml2js.Parser();
			var configFileJson = "";

			parser.parseString(fileData.substring(0, fileData.length), function (err, result) {
				configFileJson = result;
			});

			return configFileJson;
		} catch (ex) {
			console.log(ex)
		}
	}

	var getRequestedPreferenceFromConfig = function(preferencesList, requestedPreferenceName) {
		for (const preference of preferencesList) {
			if (preference["$"].name === requestedPreferenceName) {
				return preference["$"].value;
			}
		}

		return null
	}

	const PLUGIN_ID = ctx.opts.plugin.id;
	var configFileContent = loadConfigXMLFile();
	var projectPreferences = configFileContent.widget.preference

	var getRequestedPreference = function(key) {
		// Check in project preferences
		var keyConfigPreference = getRequestedPreferenceFromConfig(projectPreferences, key);
		if (keyConfigPreference) {
			return keyConfigPreference;
		}

		// Check in environment variables
		if (process.env[key]) {
			return process.env[key]
		}

		// Check in Package.json (project) file
		if (package && package.cordova && package.cordova.plugins && package.cordova.plugins[PLUGIN_ID] && package.cordova.plugins[PLUGIN_ID][key]) {
			return package.cordova.plugins[PLUGIN_ID][key];
		}

		// Check in Config.xml (project) file
		var config = fs.readFileSync('config.xml').toString();
		var confValue = config.match(new RegExp(`"${PLUGIN_ID}"(.(?!<\/plugin>))*?<variable name="${key}" value="(.*?)".*?<\/plugin>`, 'is'));
		if (confValue && confValue[2]) {
			return confValue[2];
		}

		// Check in plugin default preferences
		var defaultPreferences = ctx.opts.plugin.pluginInfo.getPreferences();
		if (defaultPreferences[key]) {
			return defaultPreferences[key]
		}
		
		throw key + " is not found. Please make sure to follow instructions in : https://github.com/CanalTP/CDVNavitiaSDK#requirements";
	}

	if (ctx.opts.cordova.platforms.includes('android')) {
		// Android platform: add the authentification informations into the gradle.properties file in the project
		console.log('➕ Adding authentication credentials to Android platform')

		// Check if a global gradle.properties exists with the artifactory credentials
		var globalGradleArtifactoryCredentials = []
		var globalGradlePropertiesPath = path.join(process.env.HOME, '.gradle', 'gradle.properties')
		var globalGradleProperties = fs.readFileSync(globalGradlePropertiesPath, 'utf-8')
		if (globalGradleProperties) {
			globalGradleProperties.split(/\r?\n/).forEach(function(line) {
				if (line.includes('kisio_artifactory_')) {
					globalGradleArtifactoryCredentials.push(line)
				}
			});
		}
		
		// Let's consider that the global config is valid by default
		// In case there is an issue with the config, we just change its value
		var globalConfigIsValid = true
		var checkedProperties = ['kisio_artifactory_url', 'kisio_artifactory_username', 'kisio_artifactory_password', 'kisio_artifactory_android_repo_release', 'kisio_artifactory_android_repo_snapshot']
		if (globalGradleArtifactoryCredentials.length >= checkedProperties.length) {
			checkedProperties.forEach(function(checkedProperty) {
				globalGradleArtifactoryCredentials.filter(property => property.includes(checkedProperty)).forEach(function(globalProperty) {
					if (globalProperty.split('=')[1].trim().length == 0) {
						globalConfigIsValid = false
					}
				});
			});
		} else {
			globalConfigIsValid = false
		}

		// If the global config is not set, request credentials
		if (!globalConfigIsValid) {
			var gradlePropertiesPath = './platforms/android/gradle.properties';
			var gradleProperties = fs.readFileSync(gradlePropertiesPath);		
			if (gradleProperties) {
				gradleProperties = gradleProperties.toString();
				if (!gradleProperties.match('kisio_artifactory_url')) {
					gradleProperties += `\nkisio_artifactory_url=${getRequestedPreference('KISIO_ARTIFACTORY_URL')}`;
					gradleProperties += `\nkisio_artifactory_username=${getRequestedPreference('KISIO_ARTIFACTORY_USERNAME')}`;
					gradleProperties += `\nkisio_artifactory_password=${getRequestedPreference('KISIO_ARTIFACTORY_PASSWORD')}`;
					gradleProperties += `\nkisio_artifactory_android_repo_release=${getRequestedPreference('KISIO_ARTIFACTORY_ANDROID_REPO_RELEASE')}`;
					gradleProperties += `\nkisio_artifactory_android_repo_snapshot=${getRequestedPreference('KISIO_ARTIFACTORY_ANDROID_REPO_SNAPSHOT')}`;

					fs.writeFileSync(gradlePropertiesPath, gradleProperties, 'utf8');
				}
			} else {
				console.error('gradle.properties file not found to add the kisio plugins dependencies');
			}
		}
	}

	if (ctx.opts.cordova.platforms.includes('ios')) {
		// IOS platform: add the authentification informations into the .netrc file (on the home directory)
		console.log('➕ Adding authentication credentials to iOS platform')
		var netrcPath = os.homedir() + '/.netrc';
		var machine = getRequestedPreference('KISIO_ARTIFACTORY_URL').match(/^https?:\/\/([^:\/?#]*)/)[1];
		if (machine) {
			var netrcLine = `machine ${machine} login ${getRequestedPreference('KISIO_ARTIFACTORY_USERNAME')} password ${getRequestedPreference('KISIO_ARTIFACTORY_PASSWORD')}\n`;
			var netrcContent = '';
			if (fs.existsSync(netrcPath)) {
				var netrcContent = fs.readFileSync(netrcPath).toString() || '';
				if (!netrcContent.match(new RegExp(`machine ${machine}`))) {
					netrcContent += `\n${netrcLine}`;
				} else {
					netrcContent = netrcContent.replace(new RegExp(`machine ${machine}[ \n]login (.*?)[ \n]password (.*?)(?=\n|$)`, 'ism'), netrcLine);
				}
			} else {
				netrcContent += netrcLine;
			}

			fs.writeFileSync(netrcPath, netrcContent, 'utf8');
		}
	}
};
