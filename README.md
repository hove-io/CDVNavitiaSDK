# CDVNavitiaSDK

Cordova plugin for using Navitia SDK iOS &amp; Android

## Installation

Use this command to install the plugin

    cordova plugin add cordova-plugin-navitia-sdk --variable ARTIFACTORY_USERNAME=username --variable ARTIFACTORY_PASSWORD=password

You can also add the plugin directly in the config.xml file
```xml
<widget>
	<plugin name="cordova-plugin-navitia-sdk">
		<variable name="ARTIFACTORY_USERNAME" value="username" />
		<variable name="ARTIFACTORY_PASSWORD" value="password" />
	</plugin>
</widget>
```
or in the package.json file
```json
{
  "cordova": {
    "plugins": {
      "cordova-plugin-navitia-sdk": {
        "ARTIFACTORY_USERNAME": "username",
        "ARTIFACTORY_PASSWORD": "password"
      }
    }
  }
}
```

## Usage

### Example

    NavitiaSDK.init('my-token', function() {}, function(error) {
        console.log(error);
    });

    NavitiaSDK.places.placesRequestBuilder().withQ('gare').get(function(success) {
        alert(success.places);
    }, function(error) {
        alert("An error has occured");
    });
