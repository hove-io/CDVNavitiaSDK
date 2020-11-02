# CDVNavitiaSDK

Cordova plugin for using Navitia SDK iOS &amp; Android

## Requirements

This plugin uses native SDKs. Since those SDKs are private, you will need to get access credentials to our [artifactory](https://kisiodigital.jfrog.io). This plugin uses Cocoapods to manage dependencies for iOS, please install it first: https://cocoapods.org.

## Credentials configuration

Once you have credentials to access our [artifactory](https://kisiodigital.jfrog.io), one further step is required before installing the plugin. Please follow one of these steps to configure the credentials properly. 
The `<YOUR_ARTIFACTORY_USERNAME>` and `<YOUR_ARTIFACTORY_PASSWORD>` should be replaced with your username and password!

#### Using Config.xml preferences

In the Config.xml file of your project, add these lines:

```xml
<widget>
	.
	.
	<preference name="KISIO_ARTIFACTORY_USERNAME" value="<YOUR_ARTIFACTORY_USERNAME>" />
    	<preference name="KISIO_ARTIFACTORY_PASSWORD" value="<YOUR_ARTIFACTORY_PASSWORD>" />
</widget>
```

#### Using environment variables

Define two global environment variables as follows:
```
KISIO_ARTIFACTORY_USERNAME=<YOUR_ARTIFACTORY_USERNAME>
KISIO_ARTIFACTORT_PASSWORD=<YOUR_ARTIFACTORY_PASSWORD>
```

#### Using global properties files (MacOS users only)

##### iOS

In the Home directory, open `.netrc` file (if not found, create a new file) and add this line:
```
machine kisiodigital.jfrog.io login <YOUR_ARTIFACTORY_USERNAME> password <YOUR_ARTIFACTORY_PASSWORD>
``````

##### Android

In the `~/.gradle` directory, open `gradle.properties`file (if not found, create a new file) andd these lines:
```
kisio_artifactory_username=<YOUR_ARTIFACTORY_USERNAME>
kisio_artifactory_password=<YOUR_ARTIFACTORY_PASSWORD>
```

## Installation

Use this command to install the plugin `cordova plugin add cordova-plugin-navitia-sdk`

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
