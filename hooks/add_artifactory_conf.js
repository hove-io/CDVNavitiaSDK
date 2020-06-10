module.exports = function(ctx) {
	var fs = require('fs');
	var os = require('os');
	var package;
	try {
		package = require(ctx.opts.projectRoot + '/package.json');
	} catch (err) { }

	var PLUGIN_ID = ctx.opts.plugin.id;

	var _getPreferenceValue = function(key) {
		if (package && package.cordova && package.cordova.plugins && package.cordova.plugins[PLUGIN_ID] && package.cordova.plugins[PLUGIN_ID][key]) {
			return package.cordova.plugins[PLUGIN_ID][key];
		}

		var config = fs.readFileSync('config.xml').toString();
		var confValue = config.match(new RegExp(`"${PLUGIN_ID}"(.(?!<\/plugin>))*?<variable name="${key}" value="(.*?)".*?<\/plugin>`, 'is'));
		if (confValue && confValue[2]) {
			return confValue[2];
		} else {
			var defaultPreferences = ctx.opts.plugin.pluginInfo.getPreferences();
			return defaultPreferences[key] || null;
		}
	}

	if (ctx.opts.platforms.includes('android')) {
		// Android platform: add the authentification informations into the gradle.properties file in the project
		var gradlePropertiesPath = './platforms/android/gradle.properties';
		var gradleProperties = fs.readFileSync(gradlePropertiesPath);
		gradleProperties = gradleProperties.toString();
		if (gradleProperties) {
			gradleProperties = gradleProperties.toString();
			if (!gradleProperties.match('kisio_artifactory_url')) {
				gradleProperties += `\nkisio_artifactory_url=${_getPreferenceValue('ARTIFACTORY_URL')}`;
				gradleProperties += `\nkisio_artifactory_username=${_getPreferenceValue('ARTIFACTORY_USERNAME')}`;
				gradleProperties += `\nkisio_artifactory_password=${_getPreferenceValue('ARTIFACTORY_PASSWORD')}`;
				gradleProperties += `\nkisio_artifactory_android_repo_release=${_getPreferenceValue('ARTIFACTORY_ANDROID_REPO_RELEASE')}`;
				gradleProperties += `\nkisio_artifactory_android_repo_snapshot=${_getPreferenceValue('ARTIFACTORY_ANDROID_REPO_SNAPSHOT')}`;
				fs.writeFileSync(gradlePropertiesPath, gradleProperties, 'utf8');
			}
		} else {
			console.error('gradle.properties file not found to add the kisio plugins dependencies');
		}
	}

	if (ctx.opts.platforms.includes('ios')) {
		// IOS platform: add the authentification informations into the .netrc file (on the home directory)
		var netrcPath = os.homedir() + '/.netrc';
		var machine = _getPreferenceValue('ARTIFACTORY_URL').match(/^https?:\/\/([^:\/?#]*)/)[1];
		var netrcLine = `machine ${machine} login ${_getPreferenceValue('ARTIFACTORY_USERNAME')} password ${_getPreferenceValue('ARTIFACTORY_PASSWORD')}\n`;
		if (machine) {
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
