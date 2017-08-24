# CDVNavitiaSDK

Cordova plugin for using Navitia SDK iOS &amp; Android

## Installation

### iOS

    cordova plugin add cordova-plugin-cocoapod-support
    cordova plugin add cordova-navitia-sdk

### Android

    cordova plugin add cordova-navitia-sdk

## Usage

### Example

    NavitiaSDK.init('my-token');
    NavitiaSDK.placesApi.placesRequestBuilder().withQ('gare').get(function(success) {
        alert(success.places);
    }, function(error) {
        alert("An error has occured");
    });
