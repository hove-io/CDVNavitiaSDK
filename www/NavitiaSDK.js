var exec = require('cordova/exec');

var request_builders = {
    
    CoverageLonLatAddressesRequestBuilder: function () {
        this.CoverageLonLatAddressesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatAddresses', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoverageLonLatAddressesIdRequestBuilder: function () {
        this.CoverageLonLatAddressesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatAddressesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id
            }]);
        };
    },
    CoverageLonLatUriAddressesRequestBuilder: function () {
        this.CoverageLonLatUriAddressesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriAddresses', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri
            }]);
        };
    },
    CoverageLonLatUriAddressesIdRequestBuilder: function () {
        this.CoverageLonLatUriAddressesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriAddressesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageRegionAddressesRequestBuilder: function () {
        this.CoverageRegionAddressesRequestBuilder = function() {
            this.region = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionAddresses', [{
                region: this.region
            }]);
        };
    },
    CoverageRegionAddressesIdRequestBuilder: function () {
        this.CoverageRegionAddressesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionAddressesId', [{
                region: this.region,
                id: this.id
            }]);
        };
    },
    CoverageRegionUriAddressesRequestBuilder: function () {
        this.CoverageRegionUriAddressesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriAddresses', [{
                region: this.region,
                uri: this.uri
            }]);
        };
    },
    CoverageRegionUriAddressesIdRequestBuilder: function () {
        this.CoverageRegionUriAddressesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriAddressesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageLonLatCalendarsRequestBuilder: function () {
        this.CoverageLonLatCalendarsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCalendars', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageLonLatCalendarsIdRequestBuilder: function () {
        this.CoverageLonLatCalendarsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCalendarsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageLonLatUriCalendarsRequestBuilder: function () {
        this.CoverageLonLatUriCalendarsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCalendars', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageRegionCalendarsRequestBuilder: function () {
        this.CoverageRegionCalendarsRequestBuilder = function() {
            this.region = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCalendars', [{
                region: this.region,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageRegionCalendarsIdRequestBuilder: function () {
        this.CoverageRegionCalendarsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCalendarsId', [{
                region: this.region,
                id: this.id,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageRegionUriCalendarsRequestBuilder: function () {
        this.CoverageRegionUriCalendarsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.startDate = null;
            this.endDate = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withStartDate = function (startDate) {
            this.startDate = startDate;
            return this;
        };
        this.withEndDate = function (endDate) {
            this.endDate = endDate;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCalendars', [{
                region: this.region,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                startDate: this.startDate,
                endDate: this.endDate,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance
            }]);
        };
    },
    CoverageLonLatCommercialModesRequestBuilder: function () {
        this.CoverageLonLatCommercialModesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCommercialModes', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatCommercialModesIdRequestBuilder: function () {
        this.CoverageLonLatCommercialModesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCommercialModesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriCommercialModesRequestBuilder: function () {
        this.CoverageLonLatUriCommercialModesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCommercialModes', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriCommercialModesIdRequestBuilder: function () {
        this.CoverageLonLatUriCommercialModesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCommercialModesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionCommercialModesRequestBuilder: function () {
        this.CoverageRegionCommercialModesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCommercialModes', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionCommercialModesIdRequestBuilder: function () {
        this.CoverageRegionCommercialModesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCommercialModesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriCommercialModesRequestBuilder: function () {
        this.CoverageRegionUriCommercialModesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCommercialModes', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriCommercialModesIdRequestBuilder: function () {
        this.CoverageRegionUriCommercialModesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCommercialModesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatCompaniesRequestBuilder: function () {
        this.CoverageLonLatCompaniesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCompanies', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatCompaniesIdRequestBuilder: function () {
        this.CoverageLonLatCompaniesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCompaniesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriCompaniesRequestBuilder: function () {
        this.CoverageLonLatUriCompaniesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCompanies', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriCompaniesIdRequestBuilder: function () {
        this.CoverageLonLatUriCompaniesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCompaniesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionCompaniesRequestBuilder: function () {
        this.CoverageRegionCompaniesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCompanies', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionCompaniesIdRequestBuilder: function () {
        this.CoverageRegionCompaniesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCompaniesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriCompaniesRequestBuilder: function () {
        this.CoverageRegionUriCompaniesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCompanies', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriCompaniesIdRequestBuilder: function () {
        this.CoverageRegionUriCompaniesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCompaniesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatContributorsRequestBuilder: function () {
        this.CoverageLonLatContributorsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatContributors', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatContributorsIdRequestBuilder: function () {
        this.CoverageLonLatContributorsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatContributorsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriContributorsRequestBuilder: function () {
        this.CoverageLonLatUriContributorsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriContributors', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriContributorsIdRequestBuilder: function () {
        this.CoverageLonLatUriContributorsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriContributorsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionContributorsRequestBuilder: function () {
        this.CoverageRegionContributorsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionContributors', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionContributorsIdRequestBuilder: function () {
        this.CoverageRegionContributorsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionContributorsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriContributorsRequestBuilder: function () {
        this.CoverageRegionUriContributorsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriContributors', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriContributorsIdRequestBuilder: function () {
        this.CoverageRegionUriContributorsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriContributorsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoordLonLatRequestBuilder: function () {
        this.CoordLonLatRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordLonLat', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoordsLonLatRequestBuilder: function () {
        this.CoordsLonLatRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordsLonLat', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoverageRegionCoordLonLatAddressesRequestBuilder: function () {
        this.CoverageRegionCoordLonLatAddressesRequestBuilder = function() {
            this.lat = null;
            this.region = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoordLonLatAddresses', [{
                lat: this.lat,
                region: this.region,
                lon: this.lon
            }]);
        };
    },
    CoverageRegionCoordsLonLatAddressesRequestBuilder: function () {
        this.CoverageRegionCoordsLonLatAddressesRequestBuilder = function() {
            this.lat = null;
            this.region = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoordsLonLatAddresses', [{
                lat: this.lat,
                region: this.region,
                lon: this.lon
            }]);
        };
    },
    CoverageLonLatCoordRequestBuilder: function () {
        this.CoverageLonLatCoordRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCoord', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoverageLonLatCoordIdRequestBuilder: function () {
        this.CoverageLonLatCoordIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCoordId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id
            }]);
        };
    },
    CoverageLonLatCoordsRequestBuilder: function () {
        this.CoverageLonLatCoordsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCoords', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoverageLonLatCoordsIdRequestBuilder: function () {
        this.CoverageLonLatCoordsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatCoordsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id
            }]);
        };
    },
    CoverageLonLatUriCoordRequestBuilder: function () {
        this.CoverageLonLatUriCoordRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCoord', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri
            }]);
        };
    },
    CoverageLonLatUriCoordIdRequestBuilder: function () {
        this.CoverageLonLatUriCoordIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCoordId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageLonLatUriCoordsRequestBuilder: function () {
        this.CoverageLonLatUriCoordsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCoords', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri
            }]);
        };
    },
    CoverageLonLatUriCoordsIdRequestBuilder: function () {
        this.CoverageLonLatUriCoordsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriCoordsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageRegionCoordRequestBuilder: function () {
        this.CoverageRegionCoordRequestBuilder = function() {
            this.region = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoord', [{
                region: this.region
            }]);
        };
    },
    CoverageRegionCoordIdRequestBuilder: function () {
        this.CoverageRegionCoordIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoordId', [{
                region: this.region,
                id: this.id
            }]);
        };
    },
    CoverageRegionCoordsRequestBuilder: function () {
        this.CoverageRegionCoordsRequestBuilder = function() {
            this.region = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoords', [{
                region: this.region
            }]);
        };
    },
    CoverageRegionCoordsIdRequestBuilder: function () {
        this.CoverageRegionCoordsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionCoordsId', [{
                region: this.region,
                id: this.id
            }]);
        };
    },
    CoverageRegionUriCoordRequestBuilder: function () {
        this.CoverageRegionUriCoordRequestBuilder = function() {
            this.region = null;
            this.uri = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCoord', [{
                region: this.region,
                uri: this.uri
            }]);
        };
    },
    CoverageRegionUriCoordIdRequestBuilder: function () {
        this.CoverageRegionUriCoordIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCoordId', [{
                region: this.region,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageRegionUriCoordsRequestBuilder: function () {
        this.CoverageRegionUriCoordsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCoords', [{
                region: this.region,
                uri: this.uri
            }]);
        };
    },
    CoverageRegionUriCoordsIdRequestBuilder: function () {
        this.CoverageRegionUriCoordsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriCoordsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id
            }]);
        };
    },
    CoverageRequestBuilder: function () {
        this.CoverageRequestBuilder = function() {
            this.disableGeojson = null;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverage', [{
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageLonLatRequestBuilder: function () {
        this.CoverageLonLatRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.disableGeojson = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLat', [{
                lat: this.lat,
                lon: this.lon,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageRegionRequestBuilder: function () {
        this.CoverageRegionRequestBuilder = function() {
            this.region = null;
            this.disableGeojson = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegion', [{
                region: this.region,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageLonLatDatasetsRequestBuilder: function () {
        this.CoverageLonLatDatasetsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatDatasets', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatDatasetsIdRequestBuilder: function () {
        this.CoverageLonLatDatasetsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatDatasetsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriDatasetsRequestBuilder: function () {
        this.CoverageLonLatUriDatasetsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriDatasets', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriDatasetsIdRequestBuilder: function () {
        this.CoverageLonLatUriDatasetsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriDatasetsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionDatasetsRequestBuilder: function () {
        this.CoverageRegionDatasetsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionDatasets', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionDatasetsIdRequestBuilder: function () {
        this.CoverageRegionDatasetsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionDatasetsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriDatasetsRequestBuilder: function () {
        this.CoverageRegionUriDatasetsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriDatasets', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriDatasetsIdRequestBuilder: function () {
        this.CoverageRegionUriDatasetsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriDatasetsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatDisruptionsRequestBuilder: function () {
        this.CoverageLonLatDisruptionsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatDisruptions', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatDisruptionsIdRequestBuilder: function () {
        this.CoverageLonLatDisruptionsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatDisruptionsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriDisruptionsRequestBuilder: function () {
        this.CoverageLonLatUriDisruptionsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriDisruptions', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriDisruptionsIdRequestBuilder: function () {
        this.CoverageLonLatUriDisruptionsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriDisruptionsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionDisruptionsRequestBuilder: function () {
        this.CoverageRegionDisruptionsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionDisruptions', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionDisruptionsIdRequestBuilder: function () {
        this.CoverageRegionDisruptionsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionDisruptionsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriDisruptionsRequestBuilder: function () {
        this.CoverageRegionUriDisruptionsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriDisruptions', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriDisruptionsIdRequestBuilder: function () {
        this.CoverageRegionUriDisruptionsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriDisruptionsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoordLonLatEquipmentReportsRequestBuilder: function () {
        this.CoordLonLatEquipmentReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordLonLatEquipmentReports', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoordsLonLatEquipmentReportsRequestBuilder: function () {
        this.CoordsLonLatEquipmentReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordsLonLatEquipmentReports', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoverageLonLatEquipmentReportsRequestBuilder: function () {
        this.CoverageLonLatEquipmentReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatEquipmentReports', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoverageLonLatUriEquipmentReportsRequestBuilder: function () {
        this.CoverageLonLatUriEquipmentReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriEquipmentReports', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoverageRegionEquipmentReportsRequestBuilder: function () {
        this.CoverageRegionEquipmentReportsRequestBuilder = function() {
            this.region = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionEquipmentReports', [{
                region: this.region,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoverageRegionUriEquipmentReportsRequestBuilder: function () {
        this.CoverageRegionUriEquipmentReportsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.filter = null;
            this.startPage = null;
            this.forbiddenUris = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriEquipmentReports', [{
                region: this.region,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                filter: this.filter,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris
            }]);
        };
    },
    CoverageLonLatGeoStatusRequestBuilder: function () {
        this.CoverageLonLatGeoStatusRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatGeoStatus', [{
                lat: this.lat,
                lon: this.lon
            }]);
        };
    },
    CoverageRegionGeoStatusRequestBuilder: function () {
        this.CoverageRegionGeoStatusRequestBuilder = function() {
            this.region = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionGeoStatus', [{
                region: this.region
            }]);
        };
    },
    CoverageLonLatIsochronesRequestBuilder: function () {
        this.CoverageLonLatIsochronesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.minDuration = null;
            this.boundaryDuration = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withMinDuration = function (minDuration) {
            this.minDuration = minDuration;
            return this;
        };
        this.withBoundaryDuration = function (boundaryDuration) {
            this.boundaryDuration = boundaryDuration;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatIsochrones', [{
                lat: this.lat,
                lon: this.lon,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                minDuration: this.minDuration,
                boundaryDuration: this.boundaryDuration
            }]);
        };
    },
    CoverageRegionIsochronesRequestBuilder: function () {
        this.CoverageRegionIsochronesRequestBuilder = function() {
            this.region = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.minDuration = null;
            this.boundaryDuration = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withMinDuration = function (minDuration) {
            this.minDuration = minDuration;
            return this;
        };
        this.withBoundaryDuration = function (boundaryDuration) {
            this.boundaryDuration = boundaryDuration;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionIsochrones', [{
                region: this.region,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                minDuration: this.minDuration,
                boundaryDuration: this.boundaryDuration
            }]);
        };
    },
    CoverageLonLatHeatMapsRequestBuilder: function () {
        this.CoverageLonLatHeatMapsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.resolution = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withResolution = function (resolution) {
            this.resolution = resolution;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatHeatMaps', [{
                lat: this.lat,
                lon: this.lon,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                resolution: this.resolution
            }]);
        };
    },
    CoverageRegionHeatMapsRequestBuilder: function () {
        this.CoverageRegionHeatMapsRequestBuilder = function() {
            this.region = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.resolution = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withResolution = function (resolution) {
            this.resolution = resolution;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionHeatMaps', [{
                region: this.region,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                resolution: this.resolution
            }]);
        };
    },
    CoverageLonLatJourneyPatternPointsRequestBuilder: function () {
        this.CoverageLonLatJourneyPatternPointsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatJourneyPatternPoints', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatJourneyPatternPointsIdRequestBuilder: function () {
        this.CoverageLonLatJourneyPatternPointsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatJourneyPatternPointsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriJourneyPatternPointsRequestBuilder: function () {
        this.CoverageLonLatUriJourneyPatternPointsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriJourneyPatternPoints', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriJourneyPatternPointsIdRequestBuilder: function () {
        this.CoverageLonLatUriJourneyPatternPointsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriJourneyPatternPointsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionJourneyPatternPointsRequestBuilder: function () {
        this.CoverageRegionJourneyPatternPointsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionJourneyPatternPoints', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionJourneyPatternPointsIdRequestBuilder: function () {
        this.CoverageRegionJourneyPatternPointsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionJourneyPatternPointsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriJourneyPatternPointsRequestBuilder: function () {
        this.CoverageRegionUriJourneyPatternPointsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriJourneyPatternPoints', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriJourneyPatternPointsIdRequestBuilder: function () {
        this.CoverageRegionUriJourneyPatternPointsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriJourneyPatternPointsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatJourneyPatternsRequestBuilder: function () {
        this.CoverageLonLatJourneyPatternsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatJourneyPatterns', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatJourneyPatternsIdRequestBuilder: function () {
        this.CoverageLonLatJourneyPatternsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatJourneyPatternsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriJourneyPatternsRequestBuilder: function () {
        this.CoverageLonLatUriJourneyPatternsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriJourneyPatterns', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriJourneyPatternsIdRequestBuilder: function () {
        this.CoverageLonLatUriJourneyPatternsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriJourneyPatternsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionJourneyPatternsRequestBuilder: function () {
        this.CoverageRegionJourneyPatternsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionJourneyPatterns', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionJourneyPatternsIdRequestBuilder: function () {
        this.CoverageRegionJourneyPatternsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionJourneyPatternsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriJourneyPatternsRequestBuilder: function () {
        this.CoverageRegionUriJourneyPatternsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriJourneyPatterns', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriJourneyPatternsIdRequestBuilder: function () {
        this.CoverageRegionUriJourneyPatternsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriJourneyPatternsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatJourneysRequestBuilder: function () {
        this.CoverageLonLatJourneysRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.timeframeDuration = null;
            this.equipmentDetails = null;
            this.maxTaxiDirectPathDuration = null;
            this.maxWalkingDirectPathDuration = null;
            this.maxCarNoParkDirectPathDuration = null;
            this.maxCarDirectPathDuration = null;
            this.maxRidesharingDirectPathDuration = null;
            this.maxBssDirectPathDuration = null;
            this.maxBikeDirectPathDuration = null;
            this.depth = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withIsJourneySchedules = function (isJourneySchedules) {
            this.isJourneySchedules = isJourneySchedules;
            return this;
        };
        this.withMinNbJourneys = function (minNbJourneys) {
            this.minNbJourneys = minNbJourneys;
            return this;
        };
        this.withMaxNbJourneys = function (maxNbJourneys) {
            this.maxNbJourneys = maxNbJourneys;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withTimeframeDuration = function (timeframeDuration) {
            this.timeframeDuration = timeframeDuration;
            return this;
        };
        this.withEquipmentDetails = function (equipmentDetails) {
            this.equipmentDetails = equipmentDetails;
            return this;
        };
        this.withMaxTaxiDirectPathDuration = function (maxTaxiDirectPathDuration) {
            this.maxTaxiDirectPathDuration = maxTaxiDirectPathDuration;
            return this;
        };
        this.withMaxWalkingDirectPathDuration = function (maxWalkingDirectPathDuration) {
            this.maxWalkingDirectPathDuration = maxWalkingDirectPathDuration;
            return this;
        };
        this.withMaxCarNoParkDirectPathDuration = function (maxCarNoParkDirectPathDuration) {
            this.maxCarNoParkDirectPathDuration = maxCarNoParkDirectPathDuration;
            return this;
        };
        this.withMaxCarDirectPathDuration = function (maxCarDirectPathDuration) {
            this.maxCarDirectPathDuration = maxCarDirectPathDuration;
            return this;
        };
        this.withMaxRidesharingDirectPathDuration = function (maxRidesharingDirectPathDuration) {
            this.maxRidesharingDirectPathDuration = maxRidesharingDirectPathDuration;
            return this;
        };
        this.withMaxBssDirectPathDuration = function (maxBssDirectPathDuration) {
            this.maxBssDirectPathDuration = maxBssDirectPathDuration;
            return this;
        };
        this.withMaxBikeDirectPathDuration = function (maxBikeDirectPathDuration) {
            this.maxBikeDirectPathDuration = maxBikeDirectPathDuration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatJourneys', [{
                lat: this.lat,
                lon: this.lon,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                timeframeDuration: this.timeframeDuration,
                equipmentDetails: this.equipmentDetails,
                maxTaxiDirectPathDuration: this.maxTaxiDirectPathDuration,
                maxWalkingDirectPathDuration: this.maxWalkingDirectPathDuration,
                maxCarNoParkDirectPathDuration: this.maxCarNoParkDirectPathDuration,
                maxCarDirectPathDuration: this.maxCarDirectPathDuration,
                maxRidesharingDirectPathDuration: this.maxRidesharingDirectPathDuration,
                maxBssDirectPathDuration: this.maxBssDirectPathDuration,
                maxBikeDirectPathDuration: this.maxBikeDirectPathDuration,
                depth: this.depth
            }]);
        };
    },
    CoverageRegionJourneysRequestBuilder: function () {
        this.CoverageRegionJourneysRequestBuilder = function() {
            this.region = null;
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.timeframeDuration = null;
            this.equipmentDetails = null;
            this.maxTaxiDirectPathDuration = null;
            this.maxWalkingDirectPathDuration = null;
            this.maxCarNoParkDirectPathDuration = null;
            this.maxCarDirectPathDuration = null;
            this.maxRidesharingDirectPathDuration = null;
            this.maxBssDirectPathDuration = null;
            this.maxBikeDirectPathDuration = null;
            this.depth = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withIsJourneySchedules = function (isJourneySchedules) {
            this.isJourneySchedules = isJourneySchedules;
            return this;
        };
        this.withMinNbJourneys = function (minNbJourneys) {
            this.minNbJourneys = minNbJourneys;
            return this;
        };
        this.withMaxNbJourneys = function (maxNbJourneys) {
            this.maxNbJourneys = maxNbJourneys;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withTimeframeDuration = function (timeframeDuration) {
            this.timeframeDuration = timeframeDuration;
            return this;
        };
        this.withEquipmentDetails = function (equipmentDetails) {
            this.equipmentDetails = equipmentDetails;
            return this;
        };
        this.withMaxTaxiDirectPathDuration = function (maxTaxiDirectPathDuration) {
            this.maxTaxiDirectPathDuration = maxTaxiDirectPathDuration;
            return this;
        };
        this.withMaxWalkingDirectPathDuration = function (maxWalkingDirectPathDuration) {
            this.maxWalkingDirectPathDuration = maxWalkingDirectPathDuration;
            return this;
        };
        this.withMaxCarNoParkDirectPathDuration = function (maxCarNoParkDirectPathDuration) {
            this.maxCarNoParkDirectPathDuration = maxCarNoParkDirectPathDuration;
            return this;
        };
        this.withMaxCarDirectPathDuration = function (maxCarDirectPathDuration) {
            this.maxCarDirectPathDuration = maxCarDirectPathDuration;
            return this;
        };
        this.withMaxRidesharingDirectPathDuration = function (maxRidesharingDirectPathDuration) {
            this.maxRidesharingDirectPathDuration = maxRidesharingDirectPathDuration;
            return this;
        };
        this.withMaxBssDirectPathDuration = function (maxBssDirectPathDuration) {
            this.maxBssDirectPathDuration = maxBssDirectPathDuration;
            return this;
        };
        this.withMaxBikeDirectPathDuration = function (maxBikeDirectPathDuration) {
            this.maxBikeDirectPathDuration = maxBikeDirectPathDuration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionJourneys', [{
                region: this.region,
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                timeframeDuration: this.timeframeDuration,
                equipmentDetails: this.equipmentDetails,
                maxTaxiDirectPathDuration: this.maxTaxiDirectPathDuration,
                maxWalkingDirectPathDuration: this.maxWalkingDirectPathDuration,
                maxCarNoParkDirectPathDuration: this.maxCarNoParkDirectPathDuration,
                maxCarDirectPathDuration: this.maxCarDirectPathDuration,
                maxRidesharingDirectPathDuration: this.maxRidesharingDirectPathDuration,
                maxBssDirectPathDuration: this.maxBssDirectPathDuration,
                maxBikeDirectPathDuration: this.maxBikeDirectPathDuration,
                depth: this.depth
            }]);
        };
    },
    JourneysRequestBuilder: function () {
        this.JourneysRequestBuilder = function() {
            this.from = null;
            this.to = null;
            this.datetime = null;
            this.datetimeRepresents = null;
            this.maxNbTransfers = null;
            this.minNbTransfers = null;
            this.firstSectionMode = null;
            this.lastSectionMode = null;
            this.maxDurationToPt = null;
            this.maxWalkingDurationToPt = null;
            this.maxBikeDurationToPt = null;
            this.maxBssDurationToPt = null;
            this.maxCarDurationToPt = null;
            this.maxRidesharingDurationToPt = null;
            this.maxCarNoParkDurationToPt = null;
            this.maxTaxiDurationToPt = null;
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.ridesharingSpeed = null;
            this.carNoParkSpeed = null;
            this.taxiSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.freeRadiusFrom = null;
            this.freeRadiusTo = null;
            this.directPathMode = null;
            this.partnerServices = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.timeframeDuration = null;
            this.equipmentDetails = null;
            this.maxTaxiDirectPathDuration = null;
            this.maxWalkingDirectPathDuration = null;
            this.maxCarNoParkDirectPathDuration = null;
            this.maxCarDirectPathDuration = null;
            this.maxRidesharingDirectPathDuration = null;
            this.maxBssDirectPathDuration = null;
            this.maxBikeDirectPathDuration = null;
            this.depth = null;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withTo = function (to) {
            this.to = to;
            return this;
        };
        this.withDatetime = function (datetime) {
            this.datetime = datetime;
            return this;
        };
        this.withDatetimeRepresents = function (datetimeRepresents) {
            this.datetimeRepresents = datetimeRepresents;
            return this;
        };
        this.withMaxNbTransfers = function (maxNbTransfers) {
            this.maxNbTransfers = maxNbTransfers;
            return this;
        };
        this.withMinNbTransfers = function (minNbTransfers) {
            this.minNbTransfers = minNbTransfers;
            return this;
        };
        this.withFirstSectionMode = function (firstSectionMode) {
            this.firstSectionMode = firstSectionMode;
            return this;
        };
        this.withLastSectionMode = function (lastSectionMode) {
            this.lastSectionMode = lastSectionMode;
            return this;
        };
        this.withMaxDurationToPt = function (maxDurationToPt) {
            this.maxDurationToPt = maxDurationToPt;
            return this;
        };
        this.withMaxWalkingDurationToPt = function (maxWalkingDurationToPt) {
            this.maxWalkingDurationToPt = maxWalkingDurationToPt;
            return this;
        };
        this.withMaxBikeDurationToPt = function (maxBikeDurationToPt) {
            this.maxBikeDurationToPt = maxBikeDurationToPt;
            return this;
        };
        this.withMaxBssDurationToPt = function (maxBssDurationToPt) {
            this.maxBssDurationToPt = maxBssDurationToPt;
            return this;
        };
        this.withMaxCarDurationToPt = function (maxCarDurationToPt) {
            this.maxCarDurationToPt = maxCarDurationToPt;
            return this;
        };
        this.withMaxRidesharingDurationToPt = function (maxRidesharingDurationToPt) {
            this.maxRidesharingDurationToPt = maxRidesharingDurationToPt;
            return this;
        };
        this.withMaxCarNoParkDurationToPt = function (maxCarNoParkDurationToPt) {
            this.maxCarNoParkDurationToPt = maxCarNoParkDurationToPt;
            return this;
        };
        this.withMaxTaxiDurationToPt = function (maxTaxiDurationToPt) {
            this.maxTaxiDurationToPt = maxTaxiDurationToPt;
            return this;
        };
        this.withWalkingSpeed = function (walkingSpeed) {
            this.walkingSpeed = walkingSpeed;
            return this;
        };
        this.withBikeSpeed = function (bikeSpeed) {
            this.bikeSpeed = bikeSpeed;
            return this;
        };
        this.withBssSpeed = function (bssSpeed) {
            this.bssSpeed = bssSpeed;
            return this;
        };
        this.withCarSpeed = function (carSpeed) {
            this.carSpeed = carSpeed;
            return this;
        };
        this.withRidesharingSpeed = function (ridesharingSpeed) {
            this.ridesharingSpeed = ridesharingSpeed;
            return this;
        };
        this.withCarNoParkSpeed = function (carNoParkSpeed) {
            this.carNoParkSpeed = carNoParkSpeed;
            return this;
        };
        this.withTaxiSpeed = function (taxiSpeed) {
            this.taxiSpeed = taxiSpeed;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withAllowedId = function (allowedId) {
            this.allowedId = allowedId;
            return this;
        };
        this.withDisruptionActive = function (disruptionActive) {
            this.disruptionActive = disruptionActive;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withMaxDuration = function (maxDuration) {
            this.maxDuration = maxDuration;
            return this;
        };
        this.withWheelchair = function (wheelchair) {
            this.wheelchair = wheelchair;
            return this;
        };
        this.withTravelerType = function (travelerType) {
            this.travelerType = travelerType;
            return this;
        };
        this.withDirectPath = function (directPath) {
            this.directPath = directPath;
            return this;
        };
        this.withFreeRadiusFrom = function (freeRadiusFrom) {
            this.freeRadiusFrom = freeRadiusFrom;
            return this;
        };
        this.withFreeRadiusTo = function (freeRadiusTo) {
            this.freeRadiusTo = freeRadiusTo;
            return this;
        };
        this.withDirectPathMode = function (directPathMode) {
            this.directPathMode = directPathMode;
            return this;
        };
        this.withPartnerServices = function (partnerServices) {
            this.partnerServices = partnerServices;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withIsJourneySchedules = function (isJourneySchedules) {
            this.isJourneySchedules = isJourneySchedules;
            return this;
        };
        this.withMinNbJourneys = function (minNbJourneys) {
            this.minNbJourneys = minNbJourneys;
            return this;
        };
        this.withMaxNbJourneys = function (maxNbJourneys) {
            this.maxNbJourneys = maxNbJourneys;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withTimeframeDuration = function (timeframeDuration) {
            this.timeframeDuration = timeframeDuration;
            return this;
        };
        this.withEquipmentDetails = function (equipmentDetails) {
            this.equipmentDetails = equipmentDetails;
            return this;
        };
        this.withMaxTaxiDirectPathDuration = function (maxTaxiDirectPathDuration) {
            this.maxTaxiDirectPathDuration = maxTaxiDirectPathDuration;
            return this;
        };
        this.withMaxWalkingDirectPathDuration = function (maxWalkingDirectPathDuration) {
            this.maxWalkingDirectPathDuration = maxWalkingDirectPathDuration;
            return this;
        };
        this.withMaxCarNoParkDirectPathDuration = function (maxCarNoParkDirectPathDuration) {
            this.maxCarNoParkDirectPathDuration = maxCarNoParkDirectPathDuration;
            return this;
        };
        this.withMaxCarDirectPathDuration = function (maxCarDirectPathDuration) {
            this.maxCarDirectPathDuration = maxCarDirectPathDuration;
            return this;
        };
        this.withMaxRidesharingDirectPathDuration = function (maxRidesharingDirectPathDuration) {
            this.maxRidesharingDirectPathDuration = maxRidesharingDirectPathDuration;
            return this;
        };
        this.withMaxBssDirectPathDuration = function (maxBssDirectPathDuration) {
            this.maxBssDirectPathDuration = maxBssDirectPathDuration;
            return this;
        };
        this.withMaxBikeDirectPathDuration = function (maxBikeDirectPathDuration) {
            this.maxBikeDirectPathDuration = maxBikeDirectPathDuration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'journeys', [{
                from: this.from,
                to: this.to,
                datetime: this.datetime,
                datetimeRepresents: this.datetimeRepresents,
                maxNbTransfers: this.maxNbTransfers,
                minNbTransfers: this.minNbTransfers,
                firstSectionMode: this.firstSectionMode,
                lastSectionMode: this.lastSectionMode,
                maxDurationToPt: this.maxDurationToPt,
                maxWalkingDurationToPt: this.maxWalkingDurationToPt,
                maxBikeDurationToPt: this.maxBikeDurationToPt,
                maxBssDurationToPt: this.maxBssDurationToPt,
                maxCarDurationToPt: this.maxCarDurationToPt,
                maxRidesharingDurationToPt: this.maxRidesharingDurationToPt,
                maxCarNoParkDurationToPt: this.maxCarNoParkDurationToPt,
                maxTaxiDurationToPt: this.maxTaxiDurationToPt,
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                ridesharingSpeed: this.ridesharingSpeed,
                carNoParkSpeed: this.carNoParkSpeed,
                taxiSpeed: this.taxiSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                freeRadiusFrom: this.freeRadiusFrom,
                freeRadiusTo: this.freeRadiusTo,
                directPathMode: this.directPathMode,
                partnerServices: this.partnerServices,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                timeframeDuration: this.timeframeDuration,
                equipmentDetails: this.equipmentDetails,
                maxTaxiDirectPathDuration: this.maxTaxiDirectPathDuration,
                maxWalkingDirectPathDuration: this.maxWalkingDirectPathDuration,
                maxCarNoParkDirectPathDuration: this.maxCarNoParkDirectPathDuration,
                maxCarDirectPathDuration: this.maxCarDirectPathDuration,
                maxRidesharingDirectPathDuration: this.maxRidesharingDirectPathDuration,
                maxBssDirectPathDuration: this.maxBssDirectPathDuration,
                maxBikeDirectPathDuration: this.maxBikeDirectPathDuration,
                depth: this.depth
            }]);
        };
    },
    CoverageLonLatLineGroupsRequestBuilder: function () {
        this.CoverageLonLatLineGroupsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatLineGroups', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatLineGroupsIdRequestBuilder: function () {
        this.CoverageLonLatLineGroupsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatLineGroupsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriLineGroupsRequestBuilder: function () {
        this.CoverageLonLatUriLineGroupsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriLineGroups', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriLineGroupsIdRequestBuilder: function () {
        this.CoverageLonLatUriLineGroupsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriLineGroupsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionLineGroupsRequestBuilder: function () {
        this.CoverageRegionLineGroupsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionLineGroups', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionLineGroupsIdRequestBuilder: function () {
        this.CoverageRegionLineGroupsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionLineGroupsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriLineGroupsRequestBuilder: function () {
        this.CoverageRegionUriLineGroupsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriLineGroups', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriLineGroupsIdRequestBuilder: function () {
        this.CoverageRegionUriLineGroupsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriLineGroupsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    LineGroupsRequestBuilder: function () {
        this.LineGroupsRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'lineGroups', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatLineReportsRequestBuilder: function () {
        this.CoverageLonLatLineReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenUris = null;
            this.disableGeojson = null;
            this.since = null;
            this.until = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatLineReports', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris,
                disableGeojson: this.disableGeojson,
                since: this.since,
                until: this.until
            }]);
        };
    },
    CoverageLonLatUriLineReportsRequestBuilder: function () {
        this.CoverageLonLatUriLineReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenUris = null;
            this.disableGeojson = null;
            this.since = null;
            this.until = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriLineReports', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris,
                disableGeojson: this.disableGeojson,
                since: this.since,
                until: this.until
            }]);
        };
    },
    CoverageRegionLineReportsRequestBuilder: function () {
        this.CoverageRegionLineReportsRequestBuilder = function() {
            this.region = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenUris = null;
            this.disableGeojson = null;
            this.since = null;
            this.until = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionLineReports', [{
                region: this.region,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris,
                disableGeojson: this.disableGeojson,
                since: this.since,
                until: this.until
            }]);
        };
    },
    CoverageRegionUriLineReportsRequestBuilder: function () {
        this.CoverageRegionUriLineReportsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenUris = null;
            this.disableGeojson = null;
            this.since = null;
            this.until = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriLineReports', [{
                region: this.region,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenUris: this.forbiddenUris,
                disableGeojson: this.disableGeojson,
                since: this.since,
                until: this.until
            }]);
        };
    },
    CoverageLonLatLinesRequestBuilder: function () {
        this.CoverageLonLatLinesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatLines', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatLinesIdRequestBuilder: function () {
        this.CoverageLonLatLinesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatLinesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriLinesRequestBuilder: function () {
        this.CoverageLonLatUriLinesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriLines', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriLinesIdRequestBuilder: function () {
        this.CoverageLonLatUriLinesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriLinesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionLinesRequestBuilder: function () {
        this.CoverageRegionLinesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionLines', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionLinesIdRequestBuilder: function () {
        this.CoverageRegionLinesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionLinesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriLinesRequestBuilder: function () {
        this.CoverageRegionUriLinesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriLines', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriLinesIdRequestBuilder: function () {
        this.CoverageRegionUriLinesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriLinesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    LinesRequestBuilder: function () {
        this.LinesRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'lines', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatNetworksRequestBuilder: function () {
        this.CoverageLonLatNetworksRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatNetworks', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatNetworksIdRequestBuilder: function () {
        this.CoverageLonLatNetworksIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatNetworksId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriNetworksRequestBuilder: function () {
        this.CoverageLonLatUriNetworksRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriNetworks', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriNetworksIdRequestBuilder: function () {
        this.CoverageLonLatUriNetworksIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriNetworksId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionNetworksRequestBuilder: function () {
        this.CoverageRegionNetworksRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionNetworks', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionNetworksIdRequestBuilder: function () {
        this.CoverageRegionNetworksIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionNetworksId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriNetworksRequestBuilder: function () {
        this.CoverageRegionUriNetworksRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriNetworks', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriNetworksIdRequestBuilder: function () {
        this.CoverageRegionUriNetworksIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriNetworksId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    NetworksRequestBuilder: function () {
        this.NetworksRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'networks', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatArrivalsRequestBuilder: function () {
        this.CoverageLonLatArrivalsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatArrivals', [{
                lat: this.lat,
                lon: this.lon,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatUriArrivalsRequestBuilder: function () {
        this.CoverageLonLatUriArrivalsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriArrivals', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionArrivalsRequestBuilder: function () {
        this.CoverageRegionArrivalsRequestBuilder = function() {
            this.region = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionArrivals', [{
                region: this.region,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionUriArrivalsRequestBuilder: function () {
        this.CoverageRegionUriArrivalsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriArrivals', [{
                region: this.region,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatDeparturesRequestBuilder: function () {
        this.CoverageLonLatDeparturesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatDepartures', [{
                lat: this.lat,
                lon: this.lon,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatUriDeparturesRequestBuilder: function () {
        this.CoverageLonLatUriDeparturesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriDepartures', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionDeparturesRequestBuilder: function () {
        this.CoverageRegionDeparturesRequestBuilder = function() {
            this.region = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionDepartures', [{
                region: this.region,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionUriDeparturesRequestBuilder: function () {
        this.CoverageRegionUriDeparturesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriDepartures', [{
                region: this.region,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatPhysicalModesRequestBuilder: function () {
        this.CoverageLonLatPhysicalModesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPhysicalModes', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatPhysicalModesIdRequestBuilder: function () {
        this.CoverageLonLatPhysicalModesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPhysicalModesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriPhysicalModesRequestBuilder: function () {
        this.CoverageLonLatUriPhysicalModesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPhysicalModes', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriPhysicalModesIdRequestBuilder: function () {
        this.CoverageLonLatUriPhysicalModesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPhysicalModesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionPhysicalModesRequestBuilder: function () {
        this.CoverageRegionPhysicalModesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPhysicalModes', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionPhysicalModesIdRequestBuilder: function () {
        this.CoverageRegionPhysicalModesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPhysicalModesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriPhysicalModesRequestBuilder: function () {
        this.CoverageRegionUriPhysicalModesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPhysicalModes', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriPhysicalModesIdRequestBuilder: function () {
        this.CoverageRegionUriPhysicalModesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPhysicalModesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatPlacesIdRequestBuilder: function () {
        this.CoverageLonLatPlacesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPlacesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageRegionPlacesIdRequestBuilder: function () {
        this.CoverageRegionPlacesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPlacesId', [{
                region: this.region,
                id: this.id,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    PlacesIdRequestBuilder: function () {
        this.PlacesIdRequestBuilder = function() {
            this.id = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'placesId', [{
                id: this.id,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageLonLatPlacesRequestBuilder: function () {
        this.CoverageLonLatPlacesRequestBuilder = function() {
            this.q = null;
            this.lat = null;
            this.lon = null;
            this.type = null;
            this.count = null;
            this.adminUri = null;
            this.depth = null;
            this.disableGeojson = null;
            this.from = null;
            this.shape = null;
        };
        this.withQ = function (q) {
            this.q = q;
            return this;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withAdminUri = function (adminUri) {
            this.adminUri = adminUri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withShape = function (shape) {
            this.shape = shape;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPlaces', [{
                q: this.q,
                lat: this.lat,
                lon: this.lon,
                type: this.type,
                count: this.count,
                adminUri: this.adminUri,
                depth: this.depth,
                disableGeojson: this.disableGeojson,
                from: this.from,
                shape: this.shape
            }]);
        };
    },
    CoverageRegionPlacesRequestBuilder: function () {
        this.CoverageRegionPlacesRequestBuilder = function() {
            this.q = null;
            this.region = null;
            this.type = null;
            this.count = null;
            this.adminUri = null;
            this.depth = null;
            this.disableGeojson = null;
            this.from = null;
            this.shape = null;
        };
        this.withQ = function (q) {
            this.q = q;
            return this;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withAdminUri = function (adminUri) {
            this.adminUri = adminUri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withShape = function (shape) {
            this.shape = shape;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPlaces', [{
                q: this.q,
                region: this.region,
                type: this.type,
                count: this.count,
                adminUri: this.adminUri,
                depth: this.depth,
                disableGeojson: this.disableGeojson,
                from: this.from,
                shape: this.shape
            }]);
        };
    },
    PlacesRequestBuilder: function () {
        this.PlacesRequestBuilder = function() {
            this.q = null;
            this.type = null;
            this.count = null;
            this.adminUri = null;
            this.depth = null;
            this.disableGeojson = null;
            this.from = null;
            this.shape = null;
        };
        this.withQ = function (q) {
            this.q = q;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withAdminUri = function (adminUri) {
            this.adminUri = adminUri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withFrom = function (from) {
            this.from = from;
            return this;
        };
        this.withShape = function (shape) {
            this.shape = shape;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'places', [{
                q: this.q,
                type: this.type,
                count: this.count,
                adminUri: this.adminUri,
                depth: this.depth,
                disableGeojson: this.disableGeojson,
                from: this.from,
                shape: this.shape
            }]);
        };
    },
    CoordLonLatPlacesNearbyRequestBuilder: function () {
        this.CoordLonLatPlacesNearbyRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordLonLatPlacesNearby', [{
                lat: this.lat,
                lon: this.lon,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoordsLonLatPlacesNearbyRequestBuilder: function () {
        this.CoordsLonLatPlacesNearbyRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coordsLonLatPlacesNearby', [{
                lat: this.lat,
                lon: this.lon,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageLonLatPlacesNearbyRequestBuilder: function () {
        this.CoverageLonLatPlacesNearbyRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPlacesNearby', [{
                lat: this.lat,
                lon: this.lon,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageLonLatUriPlacesNearbyRequestBuilder: function () {
        this.CoverageLonLatUriPlacesNearbyRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPlacesNearby', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageRegionPlacesNearbyRequestBuilder: function () {
        this.CoverageRegionPlacesNearbyRequestBuilder = function() {
            this.region = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPlacesNearby', [{
                region: this.region,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageRegionUriPlacesNearbyRequestBuilder: function () {
        this.CoverageRegionUriPlacesNearbyRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.type = null;
            this.filter = null;
            this.distance = null;
            this.count = null;
            this.depth = null;
            this.startPage = null;
            this.bssStands = null;
            this.addPoiInfos = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPlacesNearby', [{
                region: this.region,
                uri: this.uri,
                type: this.type,
                filter: this.filter,
                distance: this.distance,
                count: this.count,
                depth: this.depth,
                startPage: this.startPage,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption
            }]);
        };
    },
    CoverageLonLatPoiTypesRequestBuilder: function () {
        this.CoverageLonLatPoiTypesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPoiTypes', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatPoiTypesIdRequestBuilder: function () {
        this.CoverageLonLatPoiTypesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPoiTypesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriPoiTypesRequestBuilder: function () {
        this.CoverageLonLatUriPoiTypesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPoiTypes', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriPoiTypesIdRequestBuilder: function () {
        this.CoverageLonLatUriPoiTypesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPoiTypesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionPoiTypesRequestBuilder: function () {
        this.CoverageRegionPoiTypesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPoiTypes', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionPoiTypesIdRequestBuilder: function () {
        this.CoverageRegionPoiTypesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPoiTypesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriPoiTypesRequestBuilder: function () {
        this.CoverageRegionUriPoiTypesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPoiTypes', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriPoiTypesIdRequestBuilder: function () {
        this.CoverageRegionUriPoiTypesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPoiTypesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatPoisRequestBuilder: function () {
        this.CoverageLonLatPoisRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPois', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageLonLatPoisIdRequestBuilder: function () {
        this.CoverageLonLatPoisIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPoisId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageLonLatUriPoisRequestBuilder: function () {
        this.CoverageLonLatUriPoisRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPois', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageLonLatUriPoisIdRequestBuilder: function () {
        this.CoverageLonLatUriPoisIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriPoisId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageRegionPoisRequestBuilder: function () {
        this.CoverageRegionPoisRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPois', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageRegionPoisIdRequestBuilder: function () {
        this.CoverageRegionPoisIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPoisId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageRegionUriPoisRequestBuilder: function () {
        this.CoverageRegionUriPoisRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPois', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageRegionUriPoisIdRequestBuilder: function () {
        this.CoverageRegionUriPoisIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
            this.bssStands = null;
            this.addPoiInfos = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
            return this;
        };
        this.withAddPoiInfos = function (addPoiInfos) {
            this.addPoiInfos = addPoiInfos;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriPoisId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId,
                bssStands: this.bssStands,
                addPoiInfos: this.addPoiInfos
            }]);
        };
    },
    CoverageLonLatPtObjectsRequestBuilder: function () {
        this.CoverageLonLatPtObjectsRequestBuilder = function() {
            this.q = null;
            this.lat = null;
            this.lon = null;
            this.type = null;
            this.count = null;
            this.adminUri = null;
            this.depth = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
        };
        this.withQ = function (q) {
            this.q = q;
            return this;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withAdminUri = function (adminUri) {
            this.adminUri = adminUri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatPtObjects', [{
                q: this.q,
                lat: this.lat,
                lon: this.lon,
                type: this.type,
                count: this.count,
                adminUri: this.adminUri,
                depth: this.depth,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter
            }]);
        };
    },
    CoverageRegionPtObjectsRequestBuilder: function () {
        this.CoverageRegionPtObjectsRequestBuilder = function() {
            this.q = null;
            this.region = null;
            this.type = null;
            this.count = null;
            this.adminUri = null;
            this.depth = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
        };
        this.withQ = function (q) {
            this.q = q;
            return this;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withType = function (type) {
            this.type = type;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withAdminUri = function (adminUri) {
            this.adminUri = adminUri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionPtObjects', [{
                q: this.q,
                region: this.region,
                type: this.type,
                count: this.count,
                adminUri: this.adminUri,
                depth: this.depth,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter
            }]);
        };
    },
    CoverageLonLatUriRouteSchedulesRequestBuilder: function () {
        this.CoverageLonLatUriRouteSchedulesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriRouteSchedules', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionUriRouteSchedulesRequestBuilder: function () {
        this.CoverageRegionUriRouteSchedulesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriRouteSchedules', [{
                region: this.region,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    RouteSchedulesRequestBuilder: function () {
        this.RouteSchedulesRequestBuilder = function() {
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'routeSchedules', [{
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatRoutesRequestBuilder: function () {
        this.CoverageLonLatRoutesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatRoutes', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatRoutesIdRequestBuilder: function () {
        this.CoverageLonLatRoutesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatRoutesId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriRoutesRequestBuilder: function () {
        this.CoverageLonLatUriRoutesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriRoutes', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriRoutesIdRequestBuilder: function () {
        this.CoverageLonLatUriRoutesIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriRoutesId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionRoutesRequestBuilder: function () {
        this.CoverageRegionRoutesRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionRoutes', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionRoutesIdRequestBuilder: function () {
        this.CoverageRegionRoutesIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionRoutesId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriRoutesRequestBuilder: function () {
        this.CoverageRegionUriRoutesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriRoutes', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriRoutesIdRequestBuilder: function () {
        this.CoverageRegionUriRoutesIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriRoutesId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    RoutesRequestBuilder: function () {
        this.RoutesRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'routes', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatStopAreasRequestBuilder: function () {
        this.CoverageLonLatStopAreasRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatStopAreas', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatStopAreasIdRequestBuilder: function () {
        this.CoverageLonLatStopAreasIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatStopAreasId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriStopAreasRequestBuilder: function () {
        this.CoverageLonLatUriStopAreasRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriStopAreas', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriStopAreasIdRequestBuilder: function () {
        this.CoverageLonLatUriStopAreasIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriStopAreasId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionStopAreasRequestBuilder: function () {
        this.CoverageRegionStopAreasRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionStopAreas', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionStopAreasIdRequestBuilder: function () {
        this.CoverageRegionStopAreasIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionStopAreasId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriStopAreasRequestBuilder: function () {
        this.CoverageRegionUriStopAreasRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriStopAreas', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriStopAreasIdRequestBuilder: function () {
        this.CoverageRegionUriStopAreasIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriStopAreasId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    StopAreasRequestBuilder: function () {
        this.StopAreasRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'stopAreas', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatStopPointsRequestBuilder: function () {
        this.CoverageLonLatStopPointsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatStopPoints', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatStopPointsIdRequestBuilder: function () {
        this.CoverageLonLatStopPointsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatStopPointsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriStopPointsRequestBuilder: function () {
        this.CoverageLonLatUriStopPointsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriStopPoints', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriStopPointsIdRequestBuilder: function () {
        this.CoverageLonLatUriStopPointsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriStopPointsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionStopPointsRequestBuilder: function () {
        this.CoverageRegionStopPointsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionStopPoints', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionStopPointsIdRequestBuilder: function () {
        this.CoverageRegionStopPointsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionStopPointsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriStopPointsRequestBuilder: function () {
        this.CoverageRegionUriStopPointsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriStopPoints', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageRegionUriStopPointsIdRequestBuilder: function () {
        this.CoverageRegionUriStopPointsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriStopPointsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    StopPointsRequestBuilder: function () {
        this.StopPointsRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
            this.originalId = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'stopPoints', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags,
                originalId: this.originalId
            }]);
        };
    },
    CoverageLonLatUriStopSchedulesRequestBuilder: function () {
        this.CoverageLonLatUriStopSchedulesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriStopSchedules', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionUriStopSchedulesRequestBuilder: function () {
        this.CoverageRegionUriStopSchedulesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriStopSchedules', [{
                region: this.region,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    StopSchedulesRequestBuilder: function () {
        this.StopSchedulesRequestBuilder = function() {
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'stopSchedules', [{
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatUriTerminusSchedulesRequestBuilder: function () {
        this.CoverageLonLatUriTerminusSchedulesRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriTerminusSchedules', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageRegionUriTerminusSchedulesRequestBuilder: function () {
        this.CoverageRegionUriTerminusSchedulesRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriTerminusSchedules', [{
                region: this.region,
                uri: this.uri,
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    TerminusSchedulesRequestBuilder: function () {
        this.TerminusSchedulesRequestBuilder = function() {
            this.filter = null;
            this.fromDatetime = null;
            this.untilDatetime = null;
            this.duration = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.maxDateTimes = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.calendar = null;
            this.distance = null;
            this.showCodes = null;
            this.dataFreshness = null;
            this.itemsPerSchedule = null;
            this.disableGeojson = null;
            this.directionType = null;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withFromDatetime = function (fromDatetime) {
            this.fromDatetime = fromDatetime;
            return this;
        };
        this.withUntilDatetime = function (untilDatetime) {
            this.untilDatetime = untilDatetime;
            return this;
        };
        this.withDuration = function (duration) {
            this.duration = duration;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withMaxDateTimes = function (maxDateTimes) {
            this.maxDateTimes = maxDateTimes;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withCalendar = function (calendar) {
            this.calendar = calendar;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withItemsPerSchedule = function (itemsPerSchedule) {
            this.itemsPerSchedule = itemsPerSchedule;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDirectionType = function (directionType) {
            this.directionType = directionType;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'terminusSchedules', [{
                filter: this.filter,
                fromDatetime: this.fromDatetime,
                untilDatetime: this.untilDatetime,
                duration: this.duration,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                maxDateTimes: this.maxDateTimes,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                calendar: this.calendar,
                distance: this.distance,
                showCodes: this.showCodes,
                dataFreshness: this.dataFreshness,
                itemsPerSchedule: this.itemsPerSchedule,
                disableGeojson: this.disableGeojson,
                directionType: this.directionType
            }]);
        };
    },
    CoverageLonLatTrafficReportsRequestBuilder: function () {
        this.CoverageLonLatTrafficReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
            this.disableGeojson = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatTrafficReports', [{
                lat: this.lat,
                lon: this.lon,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageLonLatUriTrafficReportsRequestBuilder: function () {
        this.CoverageLonLatUriTrafficReportsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
            this.disableGeojson = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriTrafficReports', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageRegionTrafficReportsRequestBuilder: function () {
        this.CoverageRegionTrafficReportsRequestBuilder = function() {
            this.region = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
            this.disableGeojson = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionTrafficReports', [{
                region: this.region,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageRegionUriTrafficReportsRequestBuilder: function () {
        this.CoverageRegionUriTrafficReportsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.depth = null;
            this.count = null;
            this.startPage = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.distance = null;
            this.disableGeojson = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriTrafficReports', [{
                region: this.region,
                uri: this.uri,
                depth: this.depth,
                count: this.count,
                startPage: this.startPage,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                distance: this.distance,
                disableGeojson: this.disableGeojson
            }]);
        };
    },
    CoverageLonLatTripsRequestBuilder: function () {
        this.CoverageLonLatTripsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatTrips', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatTripsIdRequestBuilder: function () {
        this.CoverageLonLatTripsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatTripsId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriTripsRequestBuilder: function () {
        this.CoverageLonLatUriTripsRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriTrips', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriTripsIdRequestBuilder: function () {
        this.CoverageLonLatUriTripsIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriTripsId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionTripsRequestBuilder: function () {
        this.CoverageRegionTripsRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionTrips', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionTripsIdRequestBuilder: function () {
        this.CoverageRegionTripsIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionTripsId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriTripsRequestBuilder: function () {
        this.CoverageRegionUriTripsRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriTrips', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriTripsIdRequestBuilder: function () {
        this.CoverageRegionUriTripsIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriTripsId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriVehicleJourneysRequestBuilder: function () {
        this.CoverageLonLatUriVehicleJourneysRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriVehicleJourneys', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatUriVehicleJourneysIdRequestBuilder: function () {
        this.CoverageLonLatUriVehicleJourneysIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriVehicleJourneysId', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatVehicleJourneysRequestBuilder: function () {
        this.CoverageLonLatVehicleJourneysRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatVehicleJourneys', [{
                lat: this.lat,
                lon: this.lon,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageLonLatVehicleJourneysIdRequestBuilder: function () {
        this.CoverageLonLatVehicleJourneysIdRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withLat = function (lat) {
            this.lat = lat;
            return this;
        };
        this.withLon = function (lon) {
            this.lon = lon;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatVehicleJourneysId', [{
                lat: this.lat,
                lon: this.lon,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriVehicleJourneysRequestBuilder: function () {
        this.CoverageRegionUriVehicleJourneysRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriVehicleJourneys', [{
                region: this.region,
                uri: this.uri,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionUriVehicleJourneysIdRequestBuilder: function () {
        this.CoverageRegionUriVehicleJourneysIdRequestBuilder = function() {
            this.region = null;
            this.uri = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriVehicleJourneysId', [{
                region: this.region,
                uri: this.uri,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionVehicleJourneysRequestBuilder: function () {
        this.CoverageRegionVehicleJourneysRequestBuilder = function() {
            this.region = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionVehicleJourneys', [{
                region: this.region,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    },
    CoverageRegionVehicleJourneysIdRequestBuilder: function () {
        this.CoverageRegionVehicleJourneysIdRequestBuilder = function() {
            this.region = null;
            this.id = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.externalCode = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.tags = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withId = function (id) {
            this.id = id;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionVehicleJourneysId', [{
                region: this.region,
                id: this.id,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                externalCode: this.externalCode,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                tags: this.tags
            }]);
        };
    },
    VehicleJourneysRequestBuilder: function () {
        this.VehicleJourneysRequestBuilder = function() {
            this.externalCode = null;
            this.startPage = null;
            this.count = null;
            this.depth = null;
            this.forbiddenId = null;
            this.forbiddenUris = null;
            this.headsign = null;
            this.showCodes = null;
            this.odtLevel = null;
            this.dataFreshness = null;
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.disableDisruption = null;
            this.filter = null;
            this.tags = null;
        };
        this.withExternalCode = function (externalCode) {
            this.externalCode = externalCode;
            return this;
        };
        this.withStartPage = function (startPage) {
            this.startPage = startPage;
            return this;
        };
        this.withCount = function (count) {
            this.count = count;
            return this;
        };
        this.withDepth = function (depth) {
            this.depth = depth;
            return this;
        };
        this.withForbiddenId = function (forbiddenId) {
            this.forbiddenId = forbiddenId;
            return this;
        };
        this.withForbiddenUris = function (forbiddenUris) {
            this.forbiddenUris = forbiddenUris;
            return this;
        };
        this.withHeadsign = function (headsign) {
            this.headsign = headsign;
            return this;
        };
        this.withShowCodes = function (showCodes) {
            this.showCodes = showCodes;
            return this;
        };
        this.withOdtLevel = function (odtLevel) {
            this.odtLevel = odtLevel;
            return this;
        };
        this.withDataFreshness = function (dataFreshness) {
            this.dataFreshness = dataFreshness;
            return this;
        };
        this.withDistance = function (distance) {
            this.distance = distance;
            return this;
        };
        this.withSince = function (since) {
            this.since = since;
            return this;
        };
        this.withUntil = function (until) {
            this.until = until;
            return this;
        };
        this.withDisableGeojson = function (disableGeojson) {
            this.disableGeojson = disableGeojson;
            return this;
        };
        this.withDisableDisruption = function (disableDisruption) {
            this.disableDisruption = disableDisruption;
            return this;
        };
        this.withFilter = function (filter) {
            this.filter = filter;
            return this;
        };
        this.withTags = function (tags) {
            this.tags = tags;
            return this;
        };
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'vehicleJourneys', [{
                externalCode: this.externalCode,
                startPage: this.startPage,
                count: this.count,
                depth: this.depth,
                forbiddenId: this.forbiddenId,
                forbiddenUris: this.forbiddenUris,
                headsign: this.headsign,
                showCodes: this.showCodes,
                odtLevel: this.odtLevel,
                dataFreshness: this.dataFreshness,
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                disableDisruption: this.disableDisruption,
                filter: this.filter,
                tags: this.tags
            }]);
        };
    }
};

var apis = {
    addresses: {
        coverageLonLatAddressesRequestBuilder: function () {
            return new request_builders.CoverageLonLatAddressesRequestBuilder();
        },
        coverageLonLatAddressesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatAddressesIdRequestBuilder();
        },
        coverageLonLatUriAddressesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriAddressesRequestBuilder();
        },
        coverageLonLatUriAddressesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriAddressesIdRequestBuilder();
        },
        coverageRegionAddressesRequestBuilder: function () {
            return new request_builders.CoverageRegionAddressesRequestBuilder();
        },
        coverageRegionAddressesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionAddressesIdRequestBuilder();
        },
        coverageRegionUriAddressesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriAddressesRequestBuilder();
        },
        coverageRegionUriAddressesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriAddressesIdRequestBuilder();
        }
    },
    calendars: {
        coverageLonLatCalendarsRequestBuilder: function () {
            return new request_builders.CoverageLonLatCalendarsRequestBuilder();
        },
        coverageLonLatCalendarsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatCalendarsIdRequestBuilder();
        },
        coverageLonLatUriCalendarsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCalendarsRequestBuilder();
        },
        coverageRegionCalendarsRequestBuilder: function () {
            return new request_builders.CoverageRegionCalendarsRequestBuilder();
        },
        coverageRegionCalendarsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionCalendarsIdRequestBuilder();
        },
        coverageRegionUriCalendarsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCalendarsRequestBuilder();
        }
    },
    commercialModes: {
        coverageLonLatCommercialModesRequestBuilder: function () {
            return new request_builders.CoverageLonLatCommercialModesRequestBuilder();
        },
        coverageLonLatCommercialModesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatCommercialModesIdRequestBuilder();
        },
        coverageLonLatUriCommercialModesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCommercialModesRequestBuilder();
        },
        coverageLonLatUriCommercialModesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCommercialModesIdRequestBuilder();
        },
        coverageRegionCommercialModesRequestBuilder: function () {
            return new request_builders.CoverageRegionCommercialModesRequestBuilder();
        },
        coverageRegionCommercialModesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionCommercialModesIdRequestBuilder();
        },
        coverageRegionUriCommercialModesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCommercialModesRequestBuilder();
        },
        coverageRegionUriCommercialModesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCommercialModesIdRequestBuilder();
        }
    },
    companies: {
        coverageLonLatCompaniesRequestBuilder: function () {
            return new request_builders.CoverageLonLatCompaniesRequestBuilder();
        },
        coverageLonLatCompaniesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatCompaniesIdRequestBuilder();
        },
        coverageLonLatUriCompaniesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCompaniesRequestBuilder();
        },
        coverageLonLatUriCompaniesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCompaniesIdRequestBuilder();
        },
        coverageRegionCompaniesRequestBuilder: function () {
            return new request_builders.CoverageRegionCompaniesRequestBuilder();
        },
        coverageRegionCompaniesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionCompaniesIdRequestBuilder();
        },
        coverageRegionUriCompaniesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCompaniesRequestBuilder();
        },
        coverageRegionUriCompaniesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCompaniesIdRequestBuilder();
        }
    },
    contributors: {
        coverageLonLatContributorsRequestBuilder: function () {
            return new request_builders.CoverageLonLatContributorsRequestBuilder();
        },
        coverageLonLatContributorsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatContributorsIdRequestBuilder();
        },
        coverageLonLatUriContributorsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriContributorsRequestBuilder();
        },
        coverageLonLatUriContributorsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriContributorsIdRequestBuilder();
        },
        coverageRegionContributorsRequestBuilder: function () {
            return new request_builders.CoverageRegionContributorsRequestBuilder();
        },
        coverageRegionContributorsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionContributorsIdRequestBuilder();
        },
        coverageRegionUriContributorsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriContributorsRequestBuilder();
        },
        coverageRegionUriContributorsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriContributorsIdRequestBuilder();
        }
    },
    coord: {
        coordLonLatRequestBuilder: function () {
            return new request_builders.CoordLonLatRequestBuilder();
        },
        coordsLonLatRequestBuilder: function () {
            return new request_builders.CoordsLonLatRequestBuilder();
        },
        coverageRegionCoordLonLatAddressesRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordLonLatAddressesRequestBuilder();
        },
        coverageRegionCoordsLonLatAddressesRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordsLonLatAddressesRequestBuilder();
        }
    },
    coords: {
        coverageLonLatCoordRequestBuilder: function () {
            return new request_builders.CoverageLonLatCoordRequestBuilder();
        },
        coverageLonLatCoordIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatCoordIdRequestBuilder();
        },
        coverageLonLatCoordsRequestBuilder: function () {
            return new request_builders.CoverageLonLatCoordsRequestBuilder();
        },
        coverageLonLatCoordsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatCoordsIdRequestBuilder();
        },
        coverageLonLatUriCoordRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCoordRequestBuilder();
        },
        coverageLonLatUriCoordIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCoordIdRequestBuilder();
        },
        coverageLonLatUriCoordsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCoordsRequestBuilder();
        },
        coverageLonLatUriCoordsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriCoordsIdRequestBuilder();
        },
        coverageRegionCoordRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordRequestBuilder();
        },
        coverageRegionCoordIdRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordIdRequestBuilder();
        },
        coverageRegionCoordsRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordsRequestBuilder();
        },
        coverageRegionCoordsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionCoordsIdRequestBuilder();
        },
        coverageRegionUriCoordRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCoordRequestBuilder();
        },
        coverageRegionUriCoordIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCoordIdRequestBuilder();
        },
        coverageRegionUriCoordsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCoordsRequestBuilder();
        },
        coverageRegionUriCoordsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriCoordsIdRequestBuilder();
        }
    },
    coverage: {
        coverageRequestBuilder: function () {
            return new request_builders.CoverageRequestBuilder();
        },
        coverageLonLatRequestBuilder: function () {
            return new request_builders.CoverageLonLatRequestBuilder();
        },
        coverageRegionRequestBuilder: function () {
            return new request_builders.CoverageRegionRequestBuilder();
        }
    },
    datasets: {
        coverageLonLatDatasetsRequestBuilder: function () {
            return new request_builders.CoverageLonLatDatasetsRequestBuilder();
        },
        coverageLonLatDatasetsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatDatasetsIdRequestBuilder();
        },
        coverageLonLatUriDatasetsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriDatasetsRequestBuilder();
        },
        coverageLonLatUriDatasetsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriDatasetsIdRequestBuilder();
        },
        coverageRegionDatasetsRequestBuilder: function () {
            return new request_builders.CoverageRegionDatasetsRequestBuilder();
        },
        coverageRegionDatasetsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionDatasetsIdRequestBuilder();
        },
        coverageRegionUriDatasetsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriDatasetsRequestBuilder();
        },
        coverageRegionUriDatasetsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriDatasetsIdRequestBuilder();
        }
    },
    disruptions: {
        coverageLonLatDisruptionsRequestBuilder: function () {
            return new request_builders.CoverageLonLatDisruptionsRequestBuilder();
        },
        coverageLonLatDisruptionsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatDisruptionsIdRequestBuilder();
        },
        coverageLonLatUriDisruptionsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriDisruptionsRequestBuilder();
        },
        coverageLonLatUriDisruptionsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriDisruptionsIdRequestBuilder();
        },
        coverageRegionDisruptionsRequestBuilder: function () {
            return new request_builders.CoverageRegionDisruptionsRequestBuilder();
        },
        coverageRegionDisruptionsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionDisruptionsIdRequestBuilder();
        },
        coverageRegionUriDisruptionsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriDisruptionsRequestBuilder();
        },
        coverageRegionUriDisruptionsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriDisruptionsIdRequestBuilder();
        }
    },
    equipmentReports: {
        coordLonLatEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoordLonLatEquipmentReportsRequestBuilder();
        },
        coordsLonLatEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoordsLonLatEquipmentReportsRequestBuilder();
        },
        coverageLonLatEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatEquipmentReportsRequestBuilder();
        },
        coverageLonLatUriEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriEquipmentReportsRequestBuilder();
        },
        coverageRegionEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionEquipmentReportsRequestBuilder();
        },
        coverageRegionUriEquipmentReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriEquipmentReportsRequestBuilder();
        }
    },
    geoStatus: {
        coverageLonLatGeoStatusRequestBuilder: function () {
            return new request_builders.CoverageLonLatGeoStatusRequestBuilder();
        },
        coverageRegionGeoStatusRequestBuilder: function () {
            return new request_builders.CoverageRegionGeoStatusRequestBuilder();
        }
    },
    graphicalIsochrone: {
        coverageLonLatIsochronesRequestBuilder: function () {
            return new request_builders.CoverageLonLatIsochronesRequestBuilder();
        },
        coverageRegionIsochronesRequestBuilder: function () {
            return new request_builders.CoverageRegionIsochronesRequestBuilder();
        }
    },
    heatMap: {
        coverageLonLatHeatMapsRequestBuilder: function () {
            return new request_builders.CoverageLonLatHeatMapsRequestBuilder();
        },
        coverageRegionHeatMapsRequestBuilder: function () {
            return new request_builders.CoverageRegionHeatMapsRequestBuilder();
        }
    },
    journeyPatternPoints: {
        coverageLonLatJourneyPatternPointsRequestBuilder: function () {
            return new request_builders.CoverageLonLatJourneyPatternPointsRequestBuilder();
        },
        coverageLonLatJourneyPatternPointsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatJourneyPatternPointsIdRequestBuilder();
        },
        coverageLonLatUriJourneyPatternPointsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriJourneyPatternPointsRequestBuilder();
        },
        coverageLonLatUriJourneyPatternPointsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriJourneyPatternPointsIdRequestBuilder();
        },
        coverageRegionJourneyPatternPointsRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneyPatternPointsRequestBuilder();
        },
        coverageRegionJourneyPatternPointsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneyPatternPointsIdRequestBuilder();
        },
        coverageRegionUriJourneyPatternPointsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriJourneyPatternPointsRequestBuilder();
        },
        coverageRegionUriJourneyPatternPointsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriJourneyPatternPointsIdRequestBuilder();
        }
    },
    journeyPatterns: {
        coverageLonLatJourneyPatternsRequestBuilder: function () {
            return new request_builders.CoverageLonLatJourneyPatternsRequestBuilder();
        },
        coverageLonLatJourneyPatternsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatJourneyPatternsIdRequestBuilder();
        },
        coverageLonLatUriJourneyPatternsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriJourneyPatternsRequestBuilder();
        },
        coverageLonLatUriJourneyPatternsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriJourneyPatternsIdRequestBuilder();
        },
        coverageRegionJourneyPatternsRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneyPatternsRequestBuilder();
        },
        coverageRegionJourneyPatternsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneyPatternsIdRequestBuilder();
        },
        coverageRegionUriJourneyPatternsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriJourneyPatternsRequestBuilder();
        },
        coverageRegionUriJourneyPatternsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriJourneyPatternsIdRequestBuilder();
        }
    },
    journeys: {
        coverageLonLatJourneysRequestBuilder: function () {
            return new request_builders.CoverageLonLatJourneysRequestBuilder();
        },
        coverageRegionJourneysRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneysRequestBuilder();
        },
        journeysRequestBuilder: function () {
            return new request_builders.JourneysRequestBuilder();
        }
    },
    lineGroups: {
        coverageLonLatLineGroupsRequestBuilder: function () {
            return new request_builders.CoverageLonLatLineGroupsRequestBuilder();
        },
        coverageLonLatLineGroupsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatLineGroupsIdRequestBuilder();
        },
        coverageLonLatUriLineGroupsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriLineGroupsRequestBuilder();
        },
        coverageLonLatUriLineGroupsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriLineGroupsIdRequestBuilder();
        },
        coverageRegionLineGroupsRequestBuilder: function () {
            return new request_builders.CoverageRegionLineGroupsRequestBuilder();
        },
        coverageRegionLineGroupsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionLineGroupsIdRequestBuilder();
        },
        coverageRegionUriLineGroupsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriLineGroupsRequestBuilder();
        },
        coverageRegionUriLineGroupsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriLineGroupsIdRequestBuilder();
        },
        lineGroupsRequestBuilder: function () {
            return new request_builders.LineGroupsRequestBuilder();
        }
    },
    lineReports: {
        coverageLonLatLineReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatLineReportsRequestBuilder();
        },
        coverageLonLatUriLineReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriLineReportsRequestBuilder();
        },
        coverageRegionLineReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionLineReportsRequestBuilder();
        },
        coverageRegionUriLineReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriLineReportsRequestBuilder();
        }
    },
    lines: {
        coverageLonLatLinesRequestBuilder: function () {
            return new request_builders.CoverageLonLatLinesRequestBuilder();
        },
        coverageLonLatLinesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatLinesIdRequestBuilder();
        },
        coverageLonLatUriLinesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriLinesRequestBuilder();
        },
        coverageLonLatUriLinesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriLinesIdRequestBuilder();
        },
        coverageRegionLinesRequestBuilder: function () {
            return new request_builders.CoverageRegionLinesRequestBuilder();
        },
        coverageRegionLinesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionLinesIdRequestBuilder();
        },
        coverageRegionUriLinesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriLinesRequestBuilder();
        },
        coverageRegionUriLinesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriLinesIdRequestBuilder();
        },
        linesRequestBuilder: function () {
            return new request_builders.LinesRequestBuilder();
        }
    },
    networks: {
        coverageLonLatNetworksRequestBuilder: function () {
            return new request_builders.CoverageLonLatNetworksRequestBuilder();
        },
        coverageLonLatNetworksIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatNetworksIdRequestBuilder();
        },
        coverageLonLatUriNetworksRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriNetworksRequestBuilder();
        },
        coverageLonLatUriNetworksIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriNetworksIdRequestBuilder();
        },
        coverageRegionNetworksRequestBuilder: function () {
            return new request_builders.CoverageRegionNetworksRequestBuilder();
        },
        coverageRegionNetworksIdRequestBuilder: function () {
            return new request_builders.CoverageRegionNetworksIdRequestBuilder();
        },
        coverageRegionUriNetworksRequestBuilder: function () {
            return new request_builders.CoverageRegionUriNetworksRequestBuilder();
        },
        coverageRegionUriNetworksIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriNetworksIdRequestBuilder();
        },
        networksRequestBuilder: function () {
            return new request_builders.NetworksRequestBuilder();
        }
    },
    nextArrivals: {
        coverageLonLatArrivalsRequestBuilder: function () {
            return new request_builders.CoverageLonLatArrivalsRequestBuilder();
        },
        coverageLonLatUriArrivalsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriArrivalsRequestBuilder();
        },
        coverageRegionArrivalsRequestBuilder: function () {
            return new request_builders.CoverageRegionArrivalsRequestBuilder();
        },
        coverageRegionUriArrivalsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriArrivalsRequestBuilder();
        }
    },
    nextDepartures: {
        coverageLonLatDeparturesRequestBuilder: function () {
            return new request_builders.CoverageLonLatDeparturesRequestBuilder();
        },
        coverageLonLatUriDeparturesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriDeparturesRequestBuilder();
        },
        coverageRegionDeparturesRequestBuilder: function () {
            return new request_builders.CoverageRegionDeparturesRequestBuilder();
        },
        coverageRegionUriDeparturesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriDeparturesRequestBuilder();
        }
    },
    physicalModes: {
        coverageLonLatPhysicalModesRequestBuilder: function () {
            return new request_builders.CoverageLonLatPhysicalModesRequestBuilder();
        },
        coverageLonLatPhysicalModesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatPhysicalModesIdRequestBuilder();
        },
        coverageLonLatUriPhysicalModesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPhysicalModesRequestBuilder();
        },
        coverageLonLatUriPhysicalModesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPhysicalModesIdRequestBuilder();
        },
        coverageRegionPhysicalModesRequestBuilder: function () {
            return new request_builders.CoverageRegionPhysicalModesRequestBuilder();
        },
        coverageRegionPhysicalModesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionPhysicalModesIdRequestBuilder();
        },
        coverageRegionUriPhysicalModesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPhysicalModesRequestBuilder();
        },
        coverageRegionUriPhysicalModesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPhysicalModesIdRequestBuilder();
        }
    },
    placeUri: {
        coverageLonLatPlacesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatPlacesIdRequestBuilder();
        },
        coverageRegionPlacesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionPlacesIdRequestBuilder();
        },
        placesIdRequestBuilder: function () {
            return new request_builders.PlacesIdRequestBuilder();
        }
    },
    places: {
        coverageLonLatPlacesRequestBuilder: function () {
            return new request_builders.CoverageLonLatPlacesRequestBuilder();
        },
        coverageRegionPlacesRequestBuilder: function () {
            return new request_builders.CoverageRegionPlacesRequestBuilder();
        },
        placesRequestBuilder: function () {
            return new request_builders.PlacesRequestBuilder();
        }
    },
    placesNearby: {
        coordLonLatPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoordLonLatPlacesNearbyRequestBuilder();
        },
        coordsLonLatPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoordsLonLatPlacesNearbyRequestBuilder();
        },
        coverageLonLatPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoverageLonLatPlacesNearbyRequestBuilder();
        },
        coverageLonLatUriPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPlacesNearbyRequestBuilder();
        },
        coverageRegionPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoverageRegionPlacesNearbyRequestBuilder();
        },
        coverageRegionUriPlacesNearbyRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPlacesNearbyRequestBuilder();
        }
    },
    poiTypes: {
        coverageLonLatPoiTypesRequestBuilder: function () {
            return new request_builders.CoverageLonLatPoiTypesRequestBuilder();
        },
        coverageLonLatPoiTypesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatPoiTypesIdRequestBuilder();
        },
        coverageLonLatUriPoiTypesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPoiTypesRequestBuilder();
        },
        coverageLonLatUriPoiTypesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPoiTypesIdRequestBuilder();
        },
        coverageRegionPoiTypesRequestBuilder: function () {
            return new request_builders.CoverageRegionPoiTypesRequestBuilder();
        },
        coverageRegionPoiTypesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionPoiTypesIdRequestBuilder();
        },
        coverageRegionUriPoiTypesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPoiTypesRequestBuilder();
        },
        coverageRegionUriPoiTypesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPoiTypesIdRequestBuilder();
        }
    },
    pois: {
        coverageLonLatPoisRequestBuilder: function () {
            return new request_builders.CoverageLonLatPoisRequestBuilder();
        },
        coverageLonLatPoisIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatPoisIdRequestBuilder();
        },
        coverageLonLatUriPoisRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPoisRequestBuilder();
        },
        coverageLonLatUriPoisIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriPoisIdRequestBuilder();
        },
        coverageRegionPoisRequestBuilder: function () {
            return new request_builders.CoverageRegionPoisRequestBuilder();
        },
        coverageRegionPoisIdRequestBuilder: function () {
            return new request_builders.CoverageRegionPoisIdRequestBuilder();
        },
        coverageRegionUriPoisRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPoisRequestBuilder();
        },
        coverageRegionUriPoisIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriPoisIdRequestBuilder();
        }
    },
    ptobjects: {
        coverageLonLatPtObjectsRequestBuilder: function () {
            return new request_builders.CoverageLonLatPtObjectsRequestBuilder();
        },
        coverageRegionPtObjectsRequestBuilder: function () {
            return new request_builders.CoverageRegionPtObjectsRequestBuilder();
        }
    },
    routeSchedules: {
        coverageLonLatUriRouteSchedulesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriRouteSchedulesRequestBuilder();
        },
        coverageRegionUriRouteSchedulesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriRouteSchedulesRequestBuilder();
        },
        routeSchedulesRequestBuilder: function () {
            return new request_builders.RouteSchedulesRequestBuilder();
        }
    },
    routes: {
        coverageLonLatRoutesRequestBuilder: function () {
            return new request_builders.CoverageLonLatRoutesRequestBuilder();
        },
        coverageLonLatRoutesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatRoutesIdRequestBuilder();
        },
        coverageLonLatUriRoutesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriRoutesRequestBuilder();
        },
        coverageLonLatUriRoutesIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriRoutesIdRequestBuilder();
        },
        coverageRegionRoutesRequestBuilder: function () {
            return new request_builders.CoverageRegionRoutesRequestBuilder();
        },
        coverageRegionRoutesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionRoutesIdRequestBuilder();
        },
        coverageRegionUriRoutesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriRoutesRequestBuilder();
        },
        coverageRegionUriRoutesIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriRoutesIdRequestBuilder();
        },
        routesRequestBuilder: function () {
            return new request_builders.RoutesRequestBuilder();
        }
    },
    stopAreas: {
        coverageLonLatStopAreasRequestBuilder: function () {
            return new request_builders.CoverageLonLatStopAreasRequestBuilder();
        },
        coverageLonLatStopAreasIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatStopAreasIdRequestBuilder();
        },
        coverageLonLatUriStopAreasRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriStopAreasRequestBuilder();
        },
        coverageLonLatUriStopAreasIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriStopAreasIdRequestBuilder();
        },
        coverageRegionStopAreasRequestBuilder: function () {
            return new request_builders.CoverageRegionStopAreasRequestBuilder();
        },
        coverageRegionStopAreasIdRequestBuilder: function () {
            return new request_builders.CoverageRegionStopAreasIdRequestBuilder();
        },
        coverageRegionUriStopAreasRequestBuilder: function () {
            return new request_builders.CoverageRegionUriStopAreasRequestBuilder();
        },
        coverageRegionUriStopAreasIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriStopAreasIdRequestBuilder();
        },
        stopAreasRequestBuilder: function () {
            return new request_builders.StopAreasRequestBuilder();
        }
    },
    stopPoints: {
        coverageLonLatStopPointsRequestBuilder: function () {
            return new request_builders.CoverageLonLatStopPointsRequestBuilder();
        },
        coverageLonLatStopPointsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatStopPointsIdRequestBuilder();
        },
        coverageLonLatUriStopPointsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriStopPointsRequestBuilder();
        },
        coverageLonLatUriStopPointsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriStopPointsIdRequestBuilder();
        },
        coverageRegionStopPointsRequestBuilder: function () {
            return new request_builders.CoverageRegionStopPointsRequestBuilder();
        },
        coverageRegionStopPointsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionStopPointsIdRequestBuilder();
        },
        coverageRegionUriStopPointsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriStopPointsRequestBuilder();
        },
        coverageRegionUriStopPointsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriStopPointsIdRequestBuilder();
        },
        stopPointsRequestBuilder: function () {
            return new request_builders.StopPointsRequestBuilder();
        }
    },
    stopSchedules: {
        coverageLonLatUriStopSchedulesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriStopSchedulesRequestBuilder();
        },
        coverageRegionUriStopSchedulesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriStopSchedulesRequestBuilder();
        },
        stopSchedulesRequestBuilder: function () {
            return new request_builders.StopSchedulesRequestBuilder();
        }
    },
    terminusSchedules: {
        coverageLonLatUriTerminusSchedulesRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriTerminusSchedulesRequestBuilder();
        },
        coverageRegionUriTerminusSchedulesRequestBuilder: function () {
            return new request_builders.CoverageRegionUriTerminusSchedulesRequestBuilder();
        },
        terminusSchedulesRequestBuilder: function () {
            return new request_builders.TerminusSchedulesRequestBuilder();
        }
    },
    trafficReport: {
        coverageLonLatTrafficReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatTrafficReportsRequestBuilder();
        },
        coverageLonLatUriTrafficReportsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriTrafficReportsRequestBuilder();
        },
        coverageRegionTrafficReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionTrafficReportsRequestBuilder();
        },
        coverageRegionUriTrafficReportsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriTrafficReportsRequestBuilder();
        }
    },
    trips: {
        coverageLonLatTripsRequestBuilder: function () {
            return new request_builders.CoverageLonLatTripsRequestBuilder();
        },
        coverageLonLatTripsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatTripsIdRequestBuilder();
        },
        coverageLonLatUriTripsRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriTripsRequestBuilder();
        },
        coverageLonLatUriTripsIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriTripsIdRequestBuilder();
        },
        coverageRegionTripsRequestBuilder: function () {
            return new request_builders.CoverageRegionTripsRequestBuilder();
        },
        coverageRegionTripsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionTripsIdRequestBuilder();
        },
        coverageRegionUriTripsRequestBuilder: function () {
            return new request_builders.CoverageRegionUriTripsRequestBuilder();
        },
        coverageRegionUriTripsIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriTripsIdRequestBuilder();
        }
    },
    vehicleJourneys: {
        coverageLonLatUriVehicleJourneysRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriVehicleJourneysRequestBuilder();
        },
        coverageLonLatUriVehicleJourneysIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriVehicleJourneysIdRequestBuilder();
        },
        coverageLonLatVehicleJourneysRequestBuilder: function () {
            return new request_builders.CoverageLonLatVehicleJourneysRequestBuilder();
        },
        coverageLonLatVehicleJourneysIdRequestBuilder: function () {
            return new request_builders.CoverageLonLatVehicleJourneysIdRequestBuilder();
        },
        coverageRegionUriVehicleJourneysRequestBuilder: function () {
            return new request_builders.CoverageRegionUriVehicleJourneysRequestBuilder();
        },
        coverageRegionUriVehicleJourneysIdRequestBuilder: function () {
            return new request_builders.CoverageRegionUriVehicleJourneysIdRequestBuilder();
        },
        coverageRegionVehicleJourneysRequestBuilder: function () {
            return new request_builders.CoverageRegionVehicleJourneysRequestBuilder();
        },
        coverageRegionVehicleJourneysIdRequestBuilder: function () {
            return new request_builders.CoverageRegionVehicleJourneysIdRequestBuilder();
        },
        vehicleJourneysRequestBuilder: function () {
            return new request_builders.VehicleJourneysRequestBuilder();
        }
    }
};

module.exports = {
    init: function (config, successCallback, errorCallback) {
        exec(
            successCallback,
            errorCallback,
            'NavitiaSDK',
            'init',
            [config]
        );
    },
    addresses: apis.addresses,
    calendars: apis.calendars,
    commercialModes: apis.commercialModes,
    companies: apis.companies,
    contributors: apis.contributors,
    coord: apis.coord,
    coords: apis.coords,
    coverage: apis.coverage,
    datasets: apis.datasets,
    disruptions: apis.disruptions,
    equipmentReports: apis.equipmentReports,
    geoStatus: apis.geoStatus,
    graphicalIsochrone: apis.graphicalIsochrone,
    heatMap: apis.heatMap,
    journeyPatternPoints: apis.journeyPatternPoints,
    journeyPatterns: apis.journeyPatterns,
    journeys: apis.journeys,
    lineGroups: apis.lineGroups,
    lineReports: apis.lineReports,
    lines: apis.lines,
    networks: apis.networks,
    nextArrivals: apis.nextArrivals,
    nextDepartures: apis.nextDepartures,
    physicalModes: apis.physicalModes,
    placeUri: apis.placeUri,
    places: apis.places,
    placesNearby: apis.placesNearby,
    poiTypes: apis.poiTypes,
    pois: apis.pois,
    ptobjects: apis.ptobjects,
    routeSchedules: apis.routeSchedules,
    routes: apis.routes,
    stopAreas: apis.stopAreas,
    stopPoints: apis.stopPoints,
    stopSchedules: apis.stopSchedules,
    terminusSchedules: apis.terminusSchedules,
    trafficReport: apis.trafficReport,
    trips: apis.trips,
    vehicleJourneys: apis.vehicleJourneys
};
