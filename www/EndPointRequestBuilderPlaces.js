var exec = require('cordova/exec');

module.exports = function() {
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