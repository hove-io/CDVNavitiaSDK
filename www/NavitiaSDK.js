var exec = require('cordova/exec');

var request_builders = {
    
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                originalId: this.originalId
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
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
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands
            }]);
        };
    },
    CoverageLonLatUriJourneysRequestBuilder: function () {
        this.CoverageLonLatUriJourneysRequestBuilder = function() {
            this.lat = null;
            this.lon = null;
            this.uri = null;
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
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
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
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageLonLatUriJourneys', [{
                lat: this.lat,
                lon: this.lon,
                uri: this.uri,
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
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands
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
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
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
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands
            }]);
        };
    },
    CoverageRegionUriJourneysRequestBuilder: function () {
        this.CoverageRegionUriJourneysRequestBuilder = function() {
            this.region = null;
            this.uri = null;
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
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
        };
        this.withRegion = function (region) {
            this.region = region;
            return this;
        };
        this.withUri = function (uri) {
            this.uri = uri;
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
        this.get = function (successCallback, errorCallback) {
            exec(successCallback, errorCallback, 'NavitiaSDK', 'coverageRegionUriJourneys', [{
                region: this.region,
                uri: this.uri,
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
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands
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
            this.walkingSpeed = null;
            this.bikeSpeed = null;
            this.bssSpeed = null;
            this.carSpeed = null;
            this.forbiddenUris = null;
            this.allowedId = null;
            this.disruptionActive = null;
            this.dataFreshness = null;
            this.maxDuration = null;
            this.wheelchair = null;
            this.travelerType = null;
            this.directPath = null;
            this.count = null;
            this.isJourneySchedules = null;
            this.minNbJourneys = null;
            this.maxNbJourneys = null;
            this.bssStands = null;
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
                walkingSpeed: this.walkingSpeed,
                bikeSpeed: this.bikeSpeed,
                bssSpeed: this.bssSpeed,
                carSpeed: this.carSpeed,
                forbiddenUris: this.forbiddenUris,
                allowedId: this.allowedId,
                disruptionActive: this.disruptionActive,
                dataFreshness: this.dataFreshness,
                maxDuration: this.maxDuration,
                wheelchair: this.wheelchair,
                travelerType: this.travelerType,
                directPath: this.directPath,
                count: this.count,
                isJourneySchedules: this.isJourneySchedules,
                minNbJourneys: this.minNbJourneys,
                maxNbJourneys: this.maxNbJourneys,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
                originalId: this.originalId
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
                originalId: this.originalId,
                bssStands: this.bssStands
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.originalId = null;
            this.bssStands = null;
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
        this.withOriginalId = function (originalId) {
            this.originalId = originalId;
            return this;
        };
        this.withBssStands = function (bssStands) {
            this.bssStands = bssStands;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                originalId: this.originalId,
                bssStands: this.bssStands
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter,
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
                disableGeojson: this.disableGeojson
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
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson
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
            this.distance = null;
            this.since = null;
            this.until = null;
            this.disableGeojson = null;
            this.filter = null;
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
        this.withFilter = function (filter) {
            this.filter = filter;
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
                distance: this.distance,
                since: this.since,
                until: this.until,
                disableGeojson: this.disableGeojson,
                filter: this.filter
            }]);
        };
    }
};

var apis = {
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
        coverageLonLatUriJourneysRequestBuilder: function () {
            return new request_builders.CoverageLonLatUriJourneysRequestBuilder();
        },
        coverageRegionJourneysRequestBuilder: function () {
            return new request_builders.CoverageRegionJourneysRequestBuilder();
        },
        coverageRegionUriJourneysRequestBuilder: function () {
            return new request_builders.CoverageRegionUriJourneysRequestBuilder();
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
    init: function (token) {
        exec(
            function(success) { },
            function(error) { },
            'NavitiaSDK',
            'init',
            [token]
        );
    },
    commercialModes: apis.commercialModes,
    companies: apis.companies,
    contributors: apis.contributors,
    coverage: apis.coverage,
    datasets: apis.datasets,
    disruptions: apis.disruptions,
    journeyPatternPoints: apis.journeyPatternPoints,
    journeyPatterns: apis.journeyPatterns,
    journeys: apis.journeys,
    lineGroups: apis.lineGroups,
    lines: apis.lines,
    networks: apis.networks,
    nextArrivals: apis.nextArrivals,
    nextDepartures: apis.nextDepartures,
    physicalModes: apis.physicalModes,
    places: apis.places,
    poiTypes: apis.poiTypes,
    pois: apis.pois,
    routeSchedules: apis.routeSchedules,
    routes: apis.routes,
    stopAreas: apis.stopAreas,
    stopPoints: apis.stopPoints,
    stopSchedules: apis.stopSchedules,
    trips: apis.trips,
    vehicleJourneys: apis.vehicleJourneys
};
