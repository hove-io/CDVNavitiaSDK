var exec = require('cordova/exec');

function EndPointRequestBuilderPlaces() {
    this.props = {};
};

EndPointRequestBuilderPlaces.prototype.withQ = function(q) {
    this.props.q = q;
    return this;
}

EndPointRequestBuilderPlaces.prototype.withCount = function(count) {
    this.props.count = count;
    return this;
}

EndPointRequestBuilderPlaces.prototype.get = function(successCallback, errorCallback) {
    exec(
        successCallback,
        errorCallback,
        'NavitiaSDK',
        'endpoint_places',
        [this.props]
    );
}

module.exports = {
    init: function(token) {
        exec(
            function(success) { },
            function(error) { },
            'NavitiaSDK',
            'init',
            [token]
        );
    },
    endpoints: {
        places: { newRequestBuilder: function() { return new EndPointRequestBuilderPlaces() }}
    }
};
