module.exports = function(ctx) {
	var fs = require('fs');
	var path = require('path');
	var et = require('elementtree');
	var xcode = require('xcode');

	var PLUGIN_ID = ctx.opts.plugin.id;
	var PLUGIN_NAME = ctx.opts.plugin.pluginInfo.name;

	// Get the projet name
	var config = path.join(ctx.opts.projectRoot, 'config.xml');
	var config_contents = fs.readFileSync(config, 'utf-8').toString();
	if (config_contents) {
		config_contents = config_contents.substring(config_contents.indexOf('<'));
	}
	var configXmlData = new et.ElementTree(et.XML(config_contents));
	var projectName = configXmlData.findtext('name');

	// Get the xcode project
	console.log('➕ Adding build phase to iOS platform')
	var projectPath = path.join(ctx.opts.projectRoot, '/platforms/ios/', projectName + '.xcodeproj/project.pbxproj');
	var proj = xcode.project(projectPath);
	proj.parseSync();
	proj.addBuildPhase([], 'PBXShellScriptBuildPhase', `[${PLUGIN_ID}] Run Script ${PLUGIN_NAME}`, proj.getFirstTarget().uuid, {
		shellPath: '/bin/sh',
		shellScript: `
# This script loops through the frameworks embedded in the application and
# removes unused architectures.
COUNTER=0
while [ $COUNTER -lt $\{SCRIPT_INPUT_FILE_COUNT\} ]; do
	INPUT_FILE_NAME="SCRIPT_INPUT_FILE_$COUNTER"
	FRAMEWORK=$\{!INPUT_FILE_NAME\}
	FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
	FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
	echo "🔎 Executable is $FRAMEWORK_EXECUTABLE_PATH"
	
	EXTRACTED_ARCHS=()
	for ARCH in $ARCHS
	do
		echo "📤 Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
		lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
		EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
	done
	
	echo "📥 Merging extracted architectures: $\{ARCHS\}"
	lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "$\{EXTRACTED_ARCHS[@]\}"
	rm "$\{EXTRACTED_ARCHS[@]\}"
	
	echo "↔️ Replacing original executable with thinned version"
	rm "$FRAMEWORK_EXECUTABLE_PATH"
	mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
	
	COUNTER=$(expr $COUNTER + 1)
done
			`,
		inputPaths: [
			`"$(TARGET_BUILD_DIR)/$(WRAPPER_NAME)/$(BUNDLE_FRAMEWORKS_FOLDER_PATH)/${PLUGIN_NAME}.framework"`
		]
	});
	fs.writeFileSync(projectPath, proj.writeSync());
};
