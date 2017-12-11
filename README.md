# CDVNavitiaSDK

Cordova plugin for using Navitia SDK iOS &amp; Android

## Installation

    cordova plugin add cordova-plugin-navitia-sdk

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
