import NavitiaSDK

@objc(CDVNavitiaSDK) class CDVNavitiaSDK : CDVPlugin {
    var sdk: NavitiaSDK? = nil

    func anyToDateTime(_ value: Any) -> Date {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")
        return isoFormatter.date(from: value as! String)!
    }

    func anyToBool(_ value: Any) -> Bool {
        return value as? Bool ?? false
    }

    func anyToInt(_ value: Any) -> Int32 {
        return value as? Int32 ?? 0
    }

    func anyToFloat(_ value: Any) -> Float {
        return value as? Float ?? 0
    }

    func anyToString(_ value: Any) -> String {
        return value as? String ?? ""
    }

    func arrayToEnum<T: RawRepresentable>(_ values: Any) -> [T] {
        let rawValues = values as! [Any]
        var values: [T]  = []
        rawValues.forEach({ rawValue in
            if let value = anyToEnum(rawValue) as T? {
                values.append(value)
            }
        })

        return values
    }

    func anyToEnum<T: RawRepresentable>(_ value: Any) -> T? {
        return T.init(rawValue: value as! T.RawValue)
    }

    func arrayToStringDict(_ values: Any) -> [String] {
        return values as? [String] ?? []
    }

    func arrayToIntDict(_ values: Any) -> [Int32] {
        return values as? [Int32] ?? []
    }

    @objc(init:)
    func `init`(command: CDVInvokedUrlCommand) {
        var pluginResult: CDVPluginResult?
        let token = command.arguments[0] as? String

        if token == nil || token?.count == 0 {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "No token provided")
        } else {
            self.sdk = NavitiaSDK.init(configuration: NavitiaConfiguration.init(token: token!))
            let message = String(format: "SDK initialized with token %@", token!)
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: message)
        }

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }

    @objc(coverageRegionCalendars:)
    func coverageRegionCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CalendarsApi? = self.sdk?.calendarsApi {
                let queryBuilder: CoverageRegionCalendarsRequestBuilder = api.newCoverageRegionCalendarsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "startDate") != nil) {
                    queryBuilder.withStartDate(anyToString(params!["startDate"]!))
                }
                if (params?.index(forKey: "endDate") != nil) {
                    queryBuilder.withEndDate(anyToString(params!["endDate"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionCalendarsId:)
    func coverageRegionCalendarsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CalendarsApi? = self.sdk?.calendarsApi {
                let queryBuilder: CoverageRegionCalendarsIdRequestBuilder = api.newCoverageRegionCalendarsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "startDate") != nil) {
                    queryBuilder.withStartDate(anyToString(params!["startDate"]!))
                }
                if (params?.index(forKey: "endDate") != nil) {
                    queryBuilder.withEndDate(anyToString(params!["endDate"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriCalendars:)
    func coverageRegionUriCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CalendarsApi? = self.sdk?.calendarsApi {
                let queryBuilder: CoverageRegionUriCalendarsRequestBuilder = api.newCoverageRegionUriCalendarsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "startDate") != nil) {
                    queryBuilder.withStartDate(anyToString(params!["startDate"]!))
                }
                if (params?.index(forKey: "endDate") != nil) {
                    queryBuilder.withEndDate(anyToString(params!["endDate"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatCommercialModes:)
    func coverageLonLatCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageLonLatCommercialModesRequestBuilder = api.newCoverageLonLatCommercialModesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatCommercialModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatCommercialModesId:)
    func coverageLonLatCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageLonLatCommercialModesIdRequestBuilder = api.newCoverageLonLatCommercialModesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatCommercialModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriCommercialModes:)
    func coverageLonLatUriCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageLonLatUriCommercialModesRequestBuilder = api.newCoverageLonLatUriCommercialModesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriCommercialModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriCommercialModesId:)
    func coverageLonLatUriCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageLonLatUriCommercialModesIdRequestBuilder = api.newCoverageLonLatUriCommercialModesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriCommercialModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionCommercialModes:)
    func coverageRegionCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageRegionCommercialModesRequestBuilder = api.newCoverageRegionCommercialModesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionCommercialModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionCommercialModesId:)
    func coverageRegionCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageRegionCommercialModesIdRequestBuilder = api.newCoverageRegionCommercialModesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionCommercialModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriCommercialModes:)
    func coverageRegionUriCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageRegionUriCommercialModesRequestBuilder = api.newCoverageRegionUriCommercialModesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriCommercialModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriCommercialModesId:)
    func coverageRegionUriCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CommercialModesApi? = self.sdk?.commercialModesApi {
                let queryBuilder: CoverageRegionUriCommercialModesIdRequestBuilder = api.newCoverageRegionUriCommercialModesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriCommercialModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatCompanies:)
    func coverageLonLatCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageLonLatCompaniesRequestBuilder = api.newCoverageLonLatCompaniesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatCompaniesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatCompaniesId:)
    func coverageLonLatCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageLonLatCompaniesIdRequestBuilder = api.newCoverageLonLatCompaniesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatCompaniesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriCompanies:)
    func coverageLonLatUriCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageLonLatUriCompaniesRequestBuilder = api.newCoverageLonLatUriCompaniesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriCompaniesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriCompaniesId:)
    func coverageLonLatUriCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageLonLatUriCompaniesIdRequestBuilder = api.newCoverageLonLatUriCompaniesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriCompaniesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionCompanies:)
    func coverageRegionCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageRegionCompaniesRequestBuilder = api.newCoverageRegionCompaniesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionCompaniesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionCompaniesId:)
    func coverageRegionCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageRegionCompaniesIdRequestBuilder = api.newCoverageRegionCompaniesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionCompaniesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriCompanies:)
    func coverageRegionUriCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageRegionUriCompaniesRequestBuilder = api.newCoverageRegionUriCompaniesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriCompaniesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriCompaniesId:)
    func coverageRegionUriCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CompaniesApi? = self.sdk?.companiesApi {
                let queryBuilder: CoverageRegionUriCompaniesIdRequestBuilder = api.newCoverageRegionUriCompaniesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriCompaniesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatContributors:)
    func coverageLonLatContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageLonLatContributorsRequestBuilder = api.newCoverageLonLatContributorsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatContributorsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatContributorsId:)
    func coverageLonLatContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageLonLatContributorsIdRequestBuilder = api.newCoverageLonLatContributorsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatContributorsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriContributors:)
    func coverageLonLatUriContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageLonLatUriContributorsRequestBuilder = api.newCoverageLonLatUriContributorsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriContributorsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriContributorsId:)
    func coverageLonLatUriContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageLonLatUriContributorsIdRequestBuilder = api.newCoverageLonLatUriContributorsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriContributorsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionContributors:)
    func coverageRegionContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageRegionContributorsRequestBuilder = api.newCoverageRegionContributorsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionContributorsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionContributorsId:)
    func coverageRegionContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageRegionContributorsIdRequestBuilder = api.newCoverageRegionContributorsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionContributorsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriContributors:)
    func coverageRegionUriContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageRegionUriContributorsRequestBuilder = api.newCoverageRegionUriContributorsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriContributorsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriContributorsId:)
    func coverageRegionUriContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: ContributorsApi? = self.sdk?.contributorsApi {
                let queryBuilder: CoverageRegionUriContributorsIdRequestBuilder = api.newCoverageRegionUriContributorsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriContributorsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverage:)
    func coverage(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CoverageApi? = self.sdk?.coverageApi {
                let queryBuilder: CoverageRequestBuilder = api.newCoverageRequestBuilder();

                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLat:)
    func coverageLonLat(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CoverageApi? = self.sdk?.coverageApi {
                let queryBuilder: CoverageLonLatRequestBuilder = api.newCoverageLonLatRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegion:)
    func coverageRegion(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: CoverageApi? = self.sdk?.coverageApi {
                let queryBuilder: CoverageRegionRequestBuilder = api.newCoverageRegionRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatDatasets:)
    func coverageLonLatDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageLonLatDatasetsRequestBuilder = api.newCoverageLonLatDatasetsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatDatasetsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatDatasetsId:)
    func coverageLonLatDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageLonLatDatasetsIdRequestBuilder = api.newCoverageLonLatDatasetsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatDatasetsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriDatasets:)
    func coverageLonLatUriDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageLonLatUriDatasetsRequestBuilder = api.newCoverageLonLatUriDatasetsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriDatasetsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriDatasetsId:)
    func coverageLonLatUriDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageLonLatUriDatasetsIdRequestBuilder = api.newCoverageLonLatUriDatasetsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriDatasetsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionDatasets:)
    func coverageRegionDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageRegionDatasetsRequestBuilder = api.newCoverageRegionDatasetsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionDatasetsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionDatasetsId:)
    func coverageRegionDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageRegionDatasetsIdRequestBuilder = api.newCoverageRegionDatasetsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionDatasetsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriDatasets:)
    func coverageRegionUriDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageRegionUriDatasetsRequestBuilder = api.newCoverageRegionUriDatasetsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriDatasetsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriDatasetsId:)
    func coverageRegionUriDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DatasetsApi? = self.sdk?.datasetsApi {
                let queryBuilder: CoverageRegionUriDatasetsIdRequestBuilder = api.newCoverageRegionUriDatasetsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriDatasetsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatDisruptions:)
    func coverageLonLatDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageLonLatDisruptionsRequestBuilder = api.newCoverageLonLatDisruptionsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatDisruptionsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatDisruptionsId:)
    func coverageLonLatDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageLonLatDisruptionsIdRequestBuilder = api.newCoverageLonLatDisruptionsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatDisruptionsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriDisruptions:)
    func coverageLonLatUriDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageLonLatUriDisruptionsRequestBuilder = api.newCoverageLonLatUriDisruptionsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriDisruptionsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriDisruptionsId:)
    func coverageLonLatUriDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageLonLatUriDisruptionsIdRequestBuilder = api.newCoverageLonLatUriDisruptionsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriDisruptionsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionDisruptions:)
    func coverageRegionDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageRegionDisruptionsRequestBuilder = api.newCoverageRegionDisruptionsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionDisruptionsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionDisruptionsId:)
    func coverageRegionDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageRegionDisruptionsIdRequestBuilder = api.newCoverageRegionDisruptionsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionDisruptionsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriDisruptions:)
    func coverageRegionUriDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageRegionUriDisruptionsRequestBuilder = api.newCoverageRegionUriDisruptionsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriDisruptionsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriDisruptionsId:)
    func coverageRegionUriDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: DisruptionsApi? = self.sdk?.disruptionsApi {
                let queryBuilder: CoverageRegionUriDisruptionsIdRequestBuilder = api.newCoverageRegionUriDisruptionsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriDisruptionsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionGeoStatus:)
    func coverageRegionGeoStatus(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: GeoStatusApi? = self.sdk?.geoStatusApi {
                let queryBuilder: CoverageRegionGeoStatusRequestBuilder = api.newCoverageRegionGeoStatusRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionIsochrones:)
    func coverageRegionIsochrones(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: GraphicalIsochroneApi? = self.sdk?.graphicalIsochroneApi {
                let queryBuilder: CoverageRegionIsochronesRequestBuilder = api.newCoverageRegionIsochronesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "to") != nil) {
                    queryBuilder.withTo(anyToString(params!["to"]!))
                }
                if (params?.index(forKey: "datetime") != nil) {
                    queryBuilder.withDatetime(anyToDateTime(params!["datetime"]!))
                }
                if (params?.index(forKey: "datetimeRepresents") != nil) {
                    if let enumValue = anyToEnum(params!["datetimeRepresents"]!) as CoverageRegionIsochronesRequestBuilder.Datetime_representsEnum? {
                        queryBuilder.withDatetimeRepresents(enumValue)
                    }
                }
                if (params?.index(forKey: "maxNbTransfers") != nil) {
                    queryBuilder.withMaxNbTransfers(anyToInt(params!["maxNbTransfers"]!))
                }
                if (params?.index(forKey: "minNbTransfers") != nil) {
                    queryBuilder.withMinNbTransfers(anyToInt(params!["minNbTransfers"]!))
                }
                if (params?.index(forKey: "firstSectionMode") != nil) {
                    queryBuilder.withFirstSectionMode(arrayToEnum(params!["firstSectionMode"]!) as [CoverageRegionIsochronesRequestBuilder.First_section_mode[]Enum])
                }
                if (params?.index(forKey: "lastSectionMode") != nil) {
                    queryBuilder.withLastSectionMode(arrayToEnum(params!["lastSectionMode"]!) as [CoverageRegionIsochronesRequestBuilder.Last_section_mode[]Enum])
                }
                if (params?.index(forKey: "maxDurationToPt") != nil) {
                    queryBuilder.withMaxDurationToPt(anyToInt(params!["maxDurationToPt"]!))
                }
                if (params?.index(forKey: "maxWalkingDurationToPt") != nil) {
                    queryBuilder.withMaxWalkingDurationToPt(anyToInt(params!["maxWalkingDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBikeDurationToPt") != nil) {
                    queryBuilder.withMaxBikeDurationToPt(anyToInt(params!["maxBikeDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBssDurationToPt") != nil) {
                    queryBuilder.withMaxBssDurationToPt(anyToInt(params!["maxBssDurationToPt"]!))
                }
                if (params?.index(forKey: "maxCarDurationToPt") != nil) {
                    queryBuilder.withMaxCarDurationToPt(anyToInt(params!["maxCarDurationToPt"]!))
                }
                if (params?.index(forKey: "walkingSpeed") != nil) {
                    queryBuilder.withWalkingSpeed(anyToFloat(params!["walkingSpeed"]!))
                }
                if (params?.index(forKey: "bikeSpeed") != nil) {
                    queryBuilder.withBikeSpeed(anyToFloat(params!["bikeSpeed"]!))
                }
                if (params?.index(forKey: "bssSpeed") != nil) {
                    queryBuilder.withBssSpeed(anyToFloat(params!["bssSpeed"]!))
                }
                if (params?.index(forKey: "carSpeed") != nil) {
                    queryBuilder.withCarSpeed(anyToFloat(params!["carSpeed"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "allowedId") != nil) {
                    queryBuilder.withAllowedId(arrayToStringDict(params!["allowedId"]!))
                }
                if (params?.index(forKey: "disruptionActive") != nil) {
                    queryBuilder.withDisruptionActive(anyToBool(params!["disruptionActive"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionIsochronesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "maxDuration") != nil) {
                    queryBuilder.withMaxDuration(anyToInt(params!["maxDuration"]!))
                }
                if (params?.index(forKey: "wheelchair") != nil) {
                    queryBuilder.withWheelchair(anyToBool(params!["wheelchair"]!))
                }
                if (params?.index(forKey: "travelerType") != nil) {
                    if let enumValue = anyToEnum(params!["travelerType"]!) as CoverageRegionIsochronesRequestBuilder.Traveler_typeEnum? {
                        queryBuilder.withTravelerType(enumValue)
                    }
                }
                if (params?.index(forKey: "directPath") != nil) {
                    if let enumValue = anyToEnum(params!["directPath"]!) as CoverageRegionIsochronesRequestBuilder.Direct_pathEnum? {
                        queryBuilder.withDirectPath(enumValue)
                    }
                }
                if (params?.index(forKey: "minDuration") != nil) {
                    queryBuilder.withMinDuration(anyToInt(params!["minDuration"]!))
                }
                if (params?.index(forKey: "boundaryDuration") != nil) {
                    queryBuilder.withBoundaryDuration(arrayToIntDict(params!["boundaryDuration"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionHeatMaps:)
    func coverageRegionHeatMaps(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: HeatMapApi? = self.sdk?.heatMapApi {
                let queryBuilder: CoverageRegionHeatMapsRequestBuilder = api.newCoverageRegionHeatMapsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "to") != nil) {
                    queryBuilder.withTo(anyToString(params!["to"]!))
                }
                if (params?.index(forKey: "datetime") != nil) {
                    queryBuilder.withDatetime(anyToDateTime(params!["datetime"]!))
                }
                if (params?.index(forKey: "datetimeRepresents") != nil) {
                    if let enumValue = anyToEnum(params!["datetimeRepresents"]!) as CoverageRegionHeatMapsRequestBuilder.Datetime_representsEnum? {
                        queryBuilder.withDatetimeRepresents(enumValue)
                    }
                }
                if (params?.index(forKey: "maxNbTransfers") != nil) {
                    queryBuilder.withMaxNbTransfers(anyToInt(params!["maxNbTransfers"]!))
                }
                if (params?.index(forKey: "minNbTransfers") != nil) {
                    queryBuilder.withMinNbTransfers(anyToInt(params!["minNbTransfers"]!))
                }
                if (params?.index(forKey: "firstSectionMode") != nil) {
                    queryBuilder.withFirstSectionMode(arrayToEnum(params!["firstSectionMode"]!) as [CoverageRegionHeatMapsRequestBuilder.First_section_mode[]Enum])
                }
                if (params?.index(forKey: "lastSectionMode") != nil) {
                    queryBuilder.withLastSectionMode(arrayToEnum(params!["lastSectionMode"]!) as [CoverageRegionHeatMapsRequestBuilder.Last_section_mode[]Enum])
                }
                if (params?.index(forKey: "maxDurationToPt") != nil) {
                    queryBuilder.withMaxDurationToPt(anyToInt(params!["maxDurationToPt"]!))
                }
                if (params?.index(forKey: "maxWalkingDurationToPt") != nil) {
                    queryBuilder.withMaxWalkingDurationToPt(anyToInt(params!["maxWalkingDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBikeDurationToPt") != nil) {
                    queryBuilder.withMaxBikeDurationToPt(anyToInt(params!["maxBikeDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBssDurationToPt") != nil) {
                    queryBuilder.withMaxBssDurationToPt(anyToInt(params!["maxBssDurationToPt"]!))
                }
                if (params?.index(forKey: "maxCarDurationToPt") != nil) {
                    queryBuilder.withMaxCarDurationToPt(anyToInt(params!["maxCarDurationToPt"]!))
                }
                if (params?.index(forKey: "walkingSpeed") != nil) {
                    queryBuilder.withWalkingSpeed(anyToFloat(params!["walkingSpeed"]!))
                }
                if (params?.index(forKey: "bikeSpeed") != nil) {
                    queryBuilder.withBikeSpeed(anyToFloat(params!["bikeSpeed"]!))
                }
                if (params?.index(forKey: "bssSpeed") != nil) {
                    queryBuilder.withBssSpeed(anyToFloat(params!["bssSpeed"]!))
                }
                if (params?.index(forKey: "carSpeed") != nil) {
                    queryBuilder.withCarSpeed(anyToFloat(params!["carSpeed"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "allowedId") != nil) {
                    queryBuilder.withAllowedId(arrayToStringDict(params!["allowedId"]!))
                }
                if (params?.index(forKey: "disruptionActive") != nil) {
                    queryBuilder.withDisruptionActive(anyToBool(params!["disruptionActive"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionHeatMapsRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "maxDuration") != nil) {
                    queryBuilder.withMaxDuration(anyToInt(params!["maxDuration"]!))
                }
                if (params?.index(forKey: "wheelchair") != nil) {
                    queryBuilder.withWheelchair(anyToBool(params!["wheelchair"]!))
                }
                if (params?.index(forKey: "travelerType") != nil) {
                    if let enumValue = anyToEnum(params!["travelerType"]!) as CoverageRegionHeatMapsRequestBuilder.Traveler_typeEnum? {
                        queryBuilder.withTravelerType(enumValue)
                    }
                }
                if (params?.index(forKey: "directPath") != nil) {
                    if let enumValue = anyToEnum(params!["directPath"]!) as CoverageRegionHeatMapsRequestBuilder.Direct_pathEnum? {
                        queryBuilder.withDirectPath(enumValue)
                    }
                }
                if (params?.index(forKey: "resolution") != nil) {
                    queryBuilder.withResolution(anyToInt(params!["resolution"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatJourneyPatternPoints:)
    func coverageLonLatJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageLonLatJourneyPatternPointsRequestBuilder = api.newCoverageLonLatJourneyPatternPointsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatJourneyPatternPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatJourneyPatternPointsId:)
    func coverageLonLatJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageLonLatJourneyPatternPointsIdRequestBuilder = api.newCoverageLonLatJourneyPatternPointsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatJourneyPatternPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriJourneyPatternPoints:)
    func coverageLonLatUriJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageLonLatUriJourneyPatternPointsRequestBuilder = api.newCoverageLonLatUriJourneyPatternPointsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriJourneyPatternPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriJourneyPatternPointsId:)
    func coverageLonLatUriJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageLonLatUriJourneyPatternPointsIdRequestBuilder = api.newCoverageLonLatUriJourneyPatternPointsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriJourneyPatternPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionJourneyPatternPoints:)
    func coverageRegionJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageRegionJourneyPatternPointsRequestBuilder = api.newCoverageRegionJourneyPatternPointsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionJourneyPatternPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionJourneyPatternPointsId:)
    func coverageRegionJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageRegionJourneyPatternPointsIdRequestBuilder = api.newCoverageRegionJourneyPatternPointsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionJourneyPatternPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriJourneyPatternPoints:)
    func coverageRegionUriJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageRegionUriJourneyPatternPointsRequestBuilder = api.newCoverageRegionUriJourneyPatternPointsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriJourneyPatternPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriJourneyPatternPointsId:)
    func coverageRegionUriJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternPointsApi? = self.sdk?.journeyPatternPointsApi {
                let queryBuilder: CoverageRegionUriJourneyPatternPointsIdRequestBuilder = api.newCoverageRegionUriJourneyPatternPointsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriJourneyPatternPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatJourneyPatterns:)
    func coverageLonLatJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageLonLatJourneyPatternsRequestBuilder = api.newCoverageLonLatJourneyPatternsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatJourneyPatternsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatJourneyPatternsId:)
    func coverageLonLatJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageLonLatJourneyPatternsIdRequestBuilder = api.newCoverageLonLatJourneyPatternsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatJourneyPatternsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriJourneyPatterns:)
    func coverageLonLatUriJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageLonLatUriJourneyPatternsRequestBuilder = api.newCoverageLonLatUriJourneyPatternsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriJourneyPatternsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriJourneyPatternsId:)
    func coverageLonLatUriJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageLonLatUriJourneyPatternsIdRequestBuilder = api.newCoverageLonLatUriJourneyPatternsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriJourneyPatternsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionJourneyPatterns:)
    func coverageRegionJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageRegionJourneyPatternsRequestBuilder = api.newCoverageRegionJourneyPatternsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionJourneyPatternsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionJourneyPatternsId:)
    func coverageRegionJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageRegionJourneyPatternsIdRequestBuilder = api.newCoverageRegionJourneyPatternsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionJourneyPatternsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriJourneyPatterns:)
    func coverageRegionUriJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageRegionUriJourneyPatternsRequestBuilder = api.newCoverageRegionUriJourneyPatternsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriJourneyPatternsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriJourneyPatternsId:)
    func coverageRegionUriJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneyPatternsApi? = self.sdk?.journeyPatternsApi {
                let queryBuilder: CoverageRegionUriJourneyPatternsIdRequestBuilder = api.newCoverageRegionUriJourneyPatternsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriJourneyPatternsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatJourneys:)
    func coverageLonLatJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneysApi? = self.sdk?.journeysApi {
                let queryBuilder: CoverageLonLatJourneysRequestBuilder = api.newCoverageLonLatJourneysRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "to") != nil) {
                    queryBuilder.withTo(anyToString(params!["to"]!))
                }
                if (params?.index(forKey: "datetime") != nil) {
                    queryBuilder.withDatetime(anyToDateTime(params!["datetime"]!))
                }
                if (params?.index(forKey: "datetimeRepresents") != nil) {
                    if let enumValue = anyToEnum(params!["datetimeRepresents"]!) as CoverageLonLatJourneysRequestBuilder.Datetime_representsEnum? {
                        queryBuilder.withDatetimeRepresents(enumValue)
                    }
                }
                if (params?.index(forKey: "maxNbTransfers") != nil) {
                    queryBuilder.withMaxNbTransfers(anyToInt(params!["maxNbTransfers"]!))
                }
                if (params?.index(forKey: "minNbTransfers") != nil) {
                    queryBuilder.withMinNbTransfers(anyToInt(params!["minNbTransfers"]!))
                }
                if (params?.index(forKey: "firstSectionMode") != nil) {
                    queryBuilder.withFirstSectionMode(arrayToEnum(params!["firstSectionMode"]!) as [CoverageLonLatJourneysRequestBuilder.First_section_mode[]Enum])
                }
                if (params?.index(forKey: "lastSectionMode") != nil) {
                    queryBuilder.withLastSectionMode(arrayToEnum(params!["lastSectionMode"]!) as [CoverageLonLatJourneysRequestBuilder.Last_section_mode[]Enum])
                }
                if (params?.index(forKey: "maxDurationToPt") != nil) {
                    queryBuilder.withMaxDurationToPt(anyToInt(params!["maxDurationToPt"]!))
                }
                if (params?.index(forKey: "maxWalkingDurationToPt") != nil) {
                    queryBuilder.withMaxWalkingDurationToPt(anyToInt(params!["maxWalkingDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBikeDurationToPt") != nil) {
                    queryBuilder.withMaxBikeDurationToPt(anyToInt(params!["maxBikeDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBssDurationToPt") != nil) {
                    queryBuilder.withMaxBssDurationToPt(anyToInt(params!["maxBssDurationToPt"]!))
                }
                if (params?.index(forKey: "maxCarDurationToPt") != nil) {
                    queryBuilder.withMaxCarDurationToPt(anyToInt(params!["maxCarDurationToPt"]!))
                }
                if (params?.index(forKey: "walkingSpeed") != nil) {
                    queryBuilder.withWalkingSpeed(anyToFloat(params!["walkingSpeed"]!))
                }
                if (params?.index(forKey: "bikeSpeed") != nil) {
                    queryBuilder.withBikeSpeed(anyToFloat(params!["bikeSpeed"]!))
                }
                if (params?.index(forKey: "bssSpeed") != nil) {
                    queryBuilder.withBssSpeed(anyToFloat(params!["bssSpeed"]!))
                }
                if (params?.index(forKey: "carSpeed") != nil) {
                    queryBuilder.withCarSpeed(anyToFloat(params!["carSpeed"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "allowedId") != nil) {
                    queryBuilder.withAllowedId(arrayToStringDict(params!["allowedId"]!))
                }
                if (params?.index(forKey: "disruptionActive") != nil) {
                    queryBuilder.withDisruptionActive(anyToBool(params!["disruptionActive"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatJourneysRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "maxDuration") != nil) {
                    queryBuilder.withMaxDuration(anyToInt(params!["maxDuration"]!))
                }
                if (params?.index(forKey: "wheelchair") != nil) {
                    queryBuilder.withWheelchair(anyToBool(params!["wheelchair"]!))
                }
                if (params?.index(forKey: "travelerType") != nil) {
                    if let enumValue = anyToEnum(params!["travelerType"]!) as CoverageLonLatJourneysRequestBuilder.Traveler_typeEnum? {
                        queryBuilder.withTravelerType(enumValue)
                    }
                }
                if (params?.index(forKey: "directPath") != nil) {
                    if let enumValue = anyToEnum(params!["directPath"]!) as CoverageLonLatJourneysRequestBuilder.Direct_pathEnum? {
                        queryBuilder.withDirectPath(enumValue)
                    }
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "isJourneySchedules") != nil) {
                    queryBuilder.withIsJourneySchedules(anyToBool(params!["isJourneySchedules"]!))
                }
                if (params?.index(forKey: "minNbJourneys") != nil) {
                    queryBuilder.withMinNbJourneys(anyToInt(params!["minNbJourneys"]!))
                }
                if (params?.index(forKey: "maxNbJourneys") != nil) {
                    queryBuilder.withMaxNbJourneys(anyToInt(params!["maxNbJourneys"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatJourneysRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionJourneys:)
    func coverageRegionJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneysApi? = self.sdk?.journeysApi {
                let queryBuilder: CoverageRegionJourneysRequestBuilder = api.newCoverageRegionJourneysRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "to") != nil) {
                    queryBuilder.withTo(anyToString(params!["to"]!))
                }
                if (params?.index(forKey: "datetime") != nil) {
                    queryBuilder.withDatetime(anyToDateTime(params!["datetime"]!))
                }
                if (params?.index(forKey: "datetimeRepresents") != nil) {
                    if let enumValue = anyToEnum(params!["datetimeRepresents"]!) as CoverageRegionJourneysRequestBuilder.Datetime_representsEnum? {
                        queryBuilder.withDatetimeRepresents(enumValue)
                    }
                }
                if (params?.index(forKey: "maxNbTransfers") != nil) {
                    queryBuilder.withMaxNbTransfers(anyToInt(params!["maxNbTransfers"]!))
                }
                if (params?.index(forKey: "minNbTransfers") != nil) {
                    queryBuilder.withMinNbTransfers(anyToInt(params!["minNbTransfers"]!))
                }
                if (params?.index(forKey: "firstSectionMode") != nil) {
                    queryBuilder.withFirstSectionMode(arrayToEnum(params!["firstSectionMode"]!) as [CoverageRegionJourneysRequestBuilder.First_section_mode[]Enum])
                }
                if (params?.index(forKey: "lastSectionMode") != nil) {
                    queryBuilder.withLastSectionMode(arrayToEnum(params!["lastSectionMode"]!) as [CoverageRegionJourneysRequestBuilder.Last_section_mode[]Enum])
                }
                if (params?.index(forKey: "maxDurationToPt") != nil) {
                    queryBuilder.withMaxDurationToPt(anyToInt(params!["maxDurationToPt"]!))
                }
                if (params?.index(forKey: "maxWalkingDurationToPt") != nil) {
                    queryBuilder.withMaxWalkingDurationToPt(anyToInt(params!["maxWalkingDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBikeDurationToPt") != nil) {
                    queryBuilder.withMaxBikeDurationToPt(anyToInt(params!["maxBikeDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBssDurationToPt") != nil) {
                    queryBuilder.withMaxBssDurationToPt(anyToInt(params!["maxBssDurationToPt"]!))
                }
                if (params?.index(forKey: "maxCarDurationToPt") != nil) {
                    queryBuilder.withMaxCarDurationToPt(anyToInt(params!["maxCarDurationToPt"]!))
                }
                if (params?.index(forKey: "walkingSpeed") != nil) {
                    queryBuilder.withWalkingSpeed(anyToFloat(params!["walkingSpeed"]!))
                }
                if (params?.index(forKey: "bikeSpeed") != nil) {
                    queryBuilder.withBikeSpeed(anyToFloat(params!["bikeSpeed"]!))
                }
                if (params?.index(forKey: "bssSpeed") != nil) {
                    queryBuilder.withBssSpeed(anyToFloat(params!["bssSpeed"]!))
                }
                if (params?.index(forKey: "carSpeed") != nil) {
                    queryBuilder.withCarSpeed(anyToFloat(params!["carSpeed"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "allowedId") != nil) {
                    queryBuilder.withAllowedId(arrayToStringDict(params!["allowedId"]!))
                }
                if (params?.index(forKey: "disruptionActive") != nil) {
                    queryBuilder.withDisruptionActive(anyToBool(params!["disruptionActive"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionJourneysRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "maxDuration") != nil) {
                    queryBuilder.withMaxDuration(anyToInt(params!["maxDuration"]!))
                }
                if (params?.index(forKey: "wheelchair") != nil) {
                    queryBuilder.withWheelchair(anyToBool(params!["wheelchair"]!))
                }
                if (params?.index(forKey: "travelerType") != nil) {
                    if let enumValue = anyToEnum(params!["travelerType"]!) as CoverageRegionJourneysRequestBuilder.Traveler_typeEnum? {
                        queryBuilder.withTravelerType(enumValue)
                    }
                }
                if (params?.index(forKey: "directPath") != nil) {
                    if let enumValue = anyToEnum(params!["directPath"]!) as CoverageRegionJourneysRequestBuilder.Direct_pathEnum? {
                        queryBuilder.withDirectPath(enumValue)
                    }
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "isJourneySchedules") != nil) {
                    queryBuilder.withIsJourneySchedules(anyToBool(params!["isJourneySchedules"]!))
                }
                if (params?.index(forKey: "minNbJourneys") != nil) {
                    queryBuilder.withMinNbJourneys(anyToInt(params!["minNbJourneys"]!))
                }
                if (params?.index(forKey: "maxNbJourneys") != nil) {
                    queryBuilder.withMaxNbJourneys(anyToInt(params!["maxNbJourneys"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionJourneysRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(journeys:)
    func journeys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: JourneysApi? = self.sdk?.journeysApi {
                let queryBuilder: JourneysRequestBuilder = api.newJourneysRequestBuilder();

                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "to") != nil) {
                    queryBuilder.withTo(anyToString(params!["to"]!))
                }
                if (params?.index(forKey: "datetime") != nil) {
                    queryBuilder.withDatetime(anyToDateTime(params!["datetime"]!))
                }
                if (params?.index(forKey: "datetimeRepresents") != nil) {
                    if let enumValue = anyToEnum(params!["datetimeRepresents"]!) as JourneysRequestBuilder.Datetime_representsEnum? {
                        queryBuilder.withDatetimeRepresents(enumValue)
                    }
                }
                if (params?.index(forKey: "maxNbTransfers") != nil) {
                    queryBuilder.withMaxNbTransfers(anyToInt(params!["maxNbTransfers"]!))
                }
                if (params?.index(forKey: "minNbTransfers") != nil) {
                    queryBuilder.withMinNbTransfers(anyToInt(params!["minNbTransfers"]!))
                }
                if (params?.index(forKey: "firstSectionMode") != nil) {
                    queryBuilder.withFirstSectionMode(arrayToEnum(params!["firstSectionMode"]!) as [JourneysRequestBuilder.First_section_mode[]Enum])
                }
                if (params?.index(forKey: "lastSectionMode") != nil) {
                    queryBuilder.withLastSectionMode(arrayToEnum(params!["lastSectionMode"]!) as [JourneysRequestBuilder.Last_section_mode[]Enum])
                }
                if (params?.index(forKey: "maxDurationToPt") != nil) {
                    queryBuilder.withMaxDurationToPt(anyToInt(params!["maxDurationToPt"]!))
                }
                if (params?.index(forKey: "maxWalkingDurationToPt") != nil) {
                    queryBuilder.withMaxWalkingDurationToPt(anyToInt(params!["maxWalkingDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBikeDurationToPt") != nil) {
                    queryBuilder.withMaxBikeDurationToPt(anyToInt(params!["maxBikeDurationToPt"]!))
                }
                if (params?.index(forKey: "maxBssDurationToPt") != nil) {
                    queryBuilder.withMaxBssDurationToPt(anyToInt(params!["maxBssDurationToPt"]!))
                }
                if (params?.index(forKey: "maxCarDurationToPt") != nil) {
                    queryBuilder.withMaxCarDurationToPt(anyToInt(params!["maxCarDurationToPt"]!))
                }
                if (params?.index(forKey: "walkingSpeed") != nil) {
                    queryBuilder.withWalkingSpeed(anyToFloat(params!["walkingSpeed"]!))
                }
                if (params?.index(forKey: "bikeSpeed") != nil) {
                    queryBuilder.withBikeSpeed(anyToFloat(params!["bikeSpeed"]!))
                }
                if (params?.index(forKey: "bssSpeed") != nil) {
                    queryBuilder.withBssSpeed(anyToFloat(params!["bssSpeed"]!))
                }
                if (params?.index(forKey: "carSpeed") != nil) {
                    queryBuilder.withCarSpeed(anyToFloat(params!["carSpeed"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "allowedId") != nil) {
                    queryBuilder.withAllowedId(arrayToStringDict(params!["allowedId"]!))
                }
                if (params?.index(forKey: "disruptionActive") != nil) {
                    queryBuilder.withDisruptionActive(anyToBool(params!["disruptionActive"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as JourneysRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "maxDuration") != nil) {
                    queryBuilder.withMaxDuration(anyToInt(params!["maxDuration"]!))
                }
                if (params?.index(forKey: "wheelchair") != nil) {
                    queryBuilder.withWheelchair(anyToBool(params!["wheelchair"]!))
                }
                if (params?.index(forKey: "travelerType") != nil) {
                    if let enumValue = anyToEnum(params!["travelerType"]!) as JourneysRequestBuilder.Traveler_typeEnum? {
                        queryBuilder.withTravelerType(enumValue)
                    }
                }
                if (params?.index(forKey: "directPath") != nil) {
                    if let enumValue = anyToEnum(params!["directPath"]!) as JourneysRequestBuilder.Direct_pathEnum? {
                        queryBuilder.withDirectPath(enumValue)
                    }
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "isJourneySchedules") != nil) {
                    queryBuilder.withIsJourneySchedules(anyToBool(params!["isJourneySchedules"]!))
                }
                if (params?.index(forKey: "minNbJourneys") != nil) {
                    queryBuilder.withMinNbJourneys(anyToInt(params!["minNbJourneys"]!))
                }
                if (params?.index(forKey: "maxNbJourneys") != nil) {
                    queryBuilder.withMaxNbJourneys(anyToInt(params!["maxNbJourneys"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [JourneysRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatLineGroups:)
    func coverageLonLatLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageLonLatLineGroupsRequestBuilder = api.newCoverageLonLatLineGroupsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatLineGroupsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatLineGroupsId:)
    func coverageLonLatLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageLonLatLineGroupsIdRequestBuilder = api.newCoverageLonLatLineGroupsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatLineGroupsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriLineGroups:)
    func coverageLonLatUriLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageLonLatUriLineGroupsRequestBuilder = api.newCoverageLonLatUriLineGroupsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriLineGroupsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriLineGroupsId:)
    func coverageLonLatUriLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageLonLatUriLineGroupsIdRequestBuilder = api.newCoverageLonLatUriLineGroupsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriLineGroupsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionLineGroups:)
    func coverageRegionLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageRegionLineGroupsRequestBuilder = api.newCoverageRegionLineGroupsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionLineGroupsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionLineGroupsId:)
    func coverageRegionLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageRegionLineGroupsIdRequestBuilder = api.newCoverageRegionLineGroupsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionLineGroupsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriLineGroups:)
    func coverageRegionUriLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageRegionUriLineGroupsRequestBuilder = api.newCoverageRegionUriLineGroupsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriLineGroupsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriLineGroupsId:)
    func coverageRegionUriLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: CoverageRegionUriLineGroupsIdRequestBuilder = api.newCoverageRegionUriLineGroupsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriLineGroupsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(lineGroups:)
    func lineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineGroupsApi? = self.sdk?.lineGroupsApi {
                let queryBuilder: LineGroupsRequestBuilder = api.newLineGroupsRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as LineGroupsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionLineReports:)
    func coverageRegionLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineReportsApi? = self.sdk?.lineReportsApi {
                let queryBuilder: CoverageRegionLineReportsRequestBuilder = api.newCoverageRegionLineReportsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriLineReports:)
    func coverageRegionUriLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LineReportsApi? = self.sdk?.lineReportsApi {
                let queryBuilder: CoverageRegionUriLineReportsRequestBuilder = api.newCoverageRegionUriLineReportsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatLines:)
    func coverageLonLatLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageLonLatLinesRequestBuilder = api.newCoverageLonLatLinesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatLinesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatLinesId:)
    func coverageLonLatLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageLonLatLinesIdRequestBuilder = api.newCoverageLonLatLinesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatLinesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriLines:)
    func coverageLonLatUriLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageLonLatUriLinesRequestBuilder = api.newCoverageLonLatUriLinesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriLinesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriLinesId:)
    func coverageLonLatUriLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageLonLatUriLinesIdRequestBuilder = api.newCoverageLonLatUriLinesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriLinesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionLines:)
    func coverageRegionLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageRegionLinesRequestBuilder = api.newCoverageRegionLinesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionLinesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionLinesId:)
    func coverageRegionLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageRegionLinesIdRequestBuilder = api.newCoverageRegionLinesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionLinesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriLines:)
    func coverageRegionUriLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageRegionUriLinesRequestBuilder = api.newCoverageRegionUriLinesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriLinesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriLinesId:)
    func coverageRegionUriLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: CoverageRegionUriLinesIdRequestBuilder = api.newCoverageRegionUriLinesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriLinesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(lines:)
    func lines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: LinesApi? = self.sdk?.linesApi {
                let queryBuilder: LinesRequestBuilder = api.newLinesRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as LinesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatNetworks:)
    func coverageLonLatNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageLonLatNetworksRequestBuilder = api.newCoverageLonLatNetworksRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatNetworksRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatNetworksId:)
    func coverageLonLatNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageLonLatNetworksIdRequestBuilder = api.newCoverageLonLatNetworksIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatNetworksIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriNetworks:)
    func coverageLonLatUriNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageLonLatUriNetworksRequestBuilder = api.newCoverageLonLatUriNetworksRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriNetworksRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriNetworksId:)
    func coverageLonLatUriNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageLonLatUriNetworksIdRequestBuilder = api.newCoverageLonLatUriNetworksIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriNetworksIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionNetworks:)
    func coverageRegionNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageRegionNetworksRequestBuilder = api.newCoverageRegionNetworksRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionNetworksRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionNetworksId:)
    func coverageRegionNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageRegionNetworksIdRequestBuilder = api.newCoverageRegionNetworksIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionNetworksIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriNetworks:)
    func coverageRegionUriNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageRegionUriNetworksRequestBuilder = api.newCoverageRegionUriNetworksRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriNetworksRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriNetworksId:)
    func coverageRegionUriNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: CoverageRegionUriNetworksIdRequestBuilder = api.newCoverageRegionUriNetworksIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriNetworksIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(networks:)
    func networks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NetworksApi? = self.sdk?.networksApi {
                let queryBuilder: NetworksRequestBuilder = api.newNetworksRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as NetworksRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatArrivals:)
    func coverageLonLatArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextArrivalsApi? = self.sdk?.nextArrivalsApi {
                let queryBuilder: CoverageLonLatArrivalsRequestBuilder = api.newCoverageLonLatArrivalsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatArrivalsRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriArrivals:)
    func coverageLonLatUriArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextArrivalsApi? = self.sdk?.nextArrivalsApi {
                let queryBuilder: CoverageLonLatUriArrivalsRequestBuilder = api.newCoverageLonLatUriArrivalsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatUriArrivalsRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionArrivals:)
    func coverageRegionArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextArrivalsApi? = self.sdk?.nextArrivalsApi {
                let queryBuilder: CoverageRegionArrivalsRequestBuilder = api.newCoverageRegionArrivalsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionArrivalsRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriArrivals:)
    func coverageRegionUriArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextArrivalsApi? = self.sdk?.nextArrivalsApi {
                let queryBuilder: CoverageRegionUriArrivalsRequestBuilder = api.newCoverageRegionUriArrivalsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionUriArrivalsRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatDepartures:)
    func coverageLonLatDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextDeparturesApi? = self.sdk?.nextDeparturesApi {
                let queryBuilder: CoverageLonLatDeparturesRequestBuilder = api.newCoverageLonLatDeparturesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatDeparturesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriDepartures:)
    func coverageLonLatUriDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextDeparturesApi? = self.sdk?.nextDeparturesApi {
                let queryBuilder: CoverageLonLatUriDeparturesRequestBuilder = api.newCoverageLonLatUriDeparturesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatUriDeparturesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionDepartures:)
    func coverageRegionDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextDeparturesApi? = self.sdk?.nextDeparturesApi {
                let queryBuilder: CoverageRegionDeparturesRequestBuilder = api.newCoverageRegionDeparturesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionDeparturesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriDepartures:)
    func coverageRegionUriDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: NextDeparturesApi? = self.sdk?.nextDeparturesApi {
                let queryBuilder: CoverageRegionUriDeparturesRequestBuilder = api.newCoverageRegionUriDeparturesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionUriDeparturesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPhysicalModes:)
    func coverageLonLatPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageLonLatPhysicalModesRequestBuilder = api.newCoverageLonLatPhysicalModesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPhysicalModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPhysicalModesId:)
    func coverageLonLatPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageLonLatPhysicalModesIdRequestBuilder = api.newCoverageLonLatPhysicalModesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPhysicalModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPhysicalModes:)
    func coverageLonLatUriPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageLonLatUriPhysicalModesRequestBuilder = api.newCoverageLonLatUriPhysicalModesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPhysicalModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPhysicalModesId:)
    func coverageLonLatUriPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageLonLatUriPhysicalModesIdRequestBuilder = api.newCoverageLonLatUriPhysicalModesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPhysicalModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPhysicalModes:)
    func coverageRegionPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageRegionPhysicalModesRequestBuilder = api.newCoverageRegionPhysicalModesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPhysicalModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPhysicalModesId:)
    func coverageRegionPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageRegionPhysicalModesIdRequestBuilder = api.newCoverageRegionPhysicalModesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPhysicalModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPhysicalModes:)
    func coverageRegionUriPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageRegionUriPhysicalModesRequestBuilder = api.newCoverageRegionUriPhysicalModesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPhysicalModesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPhysicalModesId:)
    func coverageRegionUriPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PhysicalModesApi? = self.sdk?.physicalModesApi {
                let queryBuilder: CoverageRegionUriPhysicalModesIdRequestBuilder = api.newCoverageRegionUriPhysicalModesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPhysicalModesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPlaces:)
    func coverageLonLatPlaces(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesApi? = self.sdk?.placesApi {
                let queryBuilder: CoverageLonLatPlacesRequestBuilder = api.newCoverageLonLatPlacesRequestBuilder();

                if (params?.index(forKey: "q") != nil) {
                    queryBuilder.withQ(anyToString(params!["q"]!))
                }
                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageLonLatPlacesRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "adminUri") != nil) {
                    queryBuilder.withAdminUri(arrayToStringDict(params!["adminUri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "shape") != nil) {
                    queryBuilder.withShape(anyToString(params!["shape"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPlaces:)
    func coverageRegionPlaces(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesApi? = self.sdk?.placesApi {
                let queryBuilder: CoverageRegionPlacesRequestBuilder = api.newCoverageRegionPlacesRequestBuilder();

                if (params?.index(forKey: "q") != nil) {
                    queryBuilder.withQ(anyToString(params!["q"]!))
                }
                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageRegionPlacesRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "adminUri") != nil) {
                    queryBuilder.withAdminUri(arrayToStringDict(params!["adminUri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "shape") != nil) {
                    queryBuilder.withShape(anyToString(params!["shape"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(places:)
    func places(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesApi? = self.sdk?.placesApi {
                let queryBuilder: PlacesRequestBuilder = api.newPlacesRequestBuilder();

                if (params?.index(forKey: "q") != nil) {
                    queryBuilder.withQ(anyToString(params!["q"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [PlacesRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "adminUri") != nil) {
                    queryBuilder.withAdminUri(arrayToStringDict(params!["adminUri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "from") != nil) {
                    queryBuilder.withFrom(anyToString(params!["from"]!))
                }
                if (params?.index(forKey: "shape") != nil) {
                    queryBuilder.withShape(anyToString(params!["shape"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coordLonLatPlacesNearby:)
    func coordLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoordLonLatPlacesNearbyRequestBuilder = api.newCoordLonLatPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoordLonLatPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoordLonLatPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coordsLonLatPlacesNearby:)
    func coordsLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoordsLonLatPlacesNearbyRequestBuilder = api.newCoordsLonLatPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoordsLonLatPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoordsLonLatPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPlacesNearby:)
    func coverageLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoverageLonLatPlacesNearbyRequestBuilder = api.newCoverageLonLatPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageLonLatPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPlacesNearby:)
    func coverageLonLatUriPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoverageLonLatUriPlacesNearbyRequestBuilder = api.newCoverageLonLatUriPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageLonLatUriPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatUriPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPlacesNearby:)
    func coverageRegionPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoverageRegionPlacesNearbyRequestBuilder = api.newCoverageRegionPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageRegionPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPlacesNearby:)
    func coverageRegionUriPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PlacesNearbyApi? = self.sdk?.placesNearbyApi {
                let queryBuilder: CoverageRegionUriPlacesNearbyRequestBuilder = api.newCoverageRegionUriPlacesNearbyRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageRegionUriPlacesNearbyRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionUriPlacesNearbyRequestBuilder.Add_poi_infos[]Enum])
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPoiTypes:)
    func coverageLonLatPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageLonLatPoiTypesRequestBuilder = api.newCoverageLonLatPoiTypesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPoiTypesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPoiTypesId:)
    func coverageLonLatPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageLonLatPoiTypesIdRequestBuilder = api.newCoverageLonLatPoiTypesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPoiTypesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPoiTypes:)
    func coverageLonLatUriPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageLonLatUriPoiTypesRequestBuilder = api.newCoverageLonLatUriPoiTypesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPoiTypesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPoiTypesId:)
    func coverageLonLatUriPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageLonLatUriPoiTypesIdRequestBuilder = api.newCoverageLonLatUriPoiTypesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPoiTypesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPoiTypes:)
    func coverageRegionPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageRegionPoiTypesRequestBuilder = api.newCoverageRegionPoiTypesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPoiTypesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPoiTypesId:)
    func coverageRegionPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageRegionPoiTypesIdRequestBuilder = api.newCoverageRegionPoiTypesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPoiTypesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPoiTypes:)
    func coverageRegionUriPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageRegionUriPoiTypesRequestBuilder = api.newCoverageRegionUriPoiTypesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPoiTypesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPoiTypesId:)
    func coverageRegionUriPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoiTypesApi? = self.sdk?.poiTypesApi {
                let queryBuilder: CoverageRegionUriPoiTypesIdRequestBuilder = api.newCoverageRegionUriPoiTypesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPoiTypesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPois:)
    func coverageLonLatPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageLonLatPoisRequestBuilder = api.newCoverageLonLatPoisRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPoisRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatPoisRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPoisId:)
    func coverageLonLatPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageLonLatPoisIdRequestBuilder = api.newCoverageLonLatPoisIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatPoisIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatPoisIdRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPois:)
    func coverageLonLatUriPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageLonLatUriPoisRequestBuilder = api.newCoverageLonLatUriPoisRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPoisRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatUriPoisRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriPoisId:)
    func coverageLonLatUriPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageLonLatUriPoisIdRequestBuilder = api.newCoverageLonLatUriPoisIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriPoisIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageLonLatUriPoisIdRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPois:)
    func coverageRegionPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageRegionPoisRequestBuilder = api.newCoverageRegionPoisRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPoisRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionPoisRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPoisId:)
    func coverageRegionPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageRegionPoisIdRequestBuilder = api.newCoverageRegionPoisIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionPoisIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionPoisIdRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPois:)
    func coverageRegionUriPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageRegionUriPoisRequestBuilder = api.newCoverageRegionUriPoisRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPoisRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionUriPoisRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriPoisId:)
    func coverageRegionUriPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PoisApi? = self.sdk?.poisApi {
                let queryBuilder: CoverageRegionUriPoisIdRequestBuilder = api.newCoverageRegionUriPoisIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriPoisIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }
                if (params?.index(forKey: "bssStands") != nil) {
                    queryBuilder.withBssStands(anyToBool(params!["bssStands"]!))
                }
                if (params?.index(forKey: "addPoiInfos") != nil) {
                    queryBuilder.withAddPoiInfos(arrayToEnum(params!["addPoiInfos"]!) as [CoverageRegionUriPoisIdRequestBuilder.Add_poi_infos[]Enum])
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatPtObjects:)
    func coverageLonLatPtObjects(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PtobjectsApi? = self.sdk?.ptobjectsApi {
                let queryBuilder: CoverageLonLatPtObjectsRequestBuilder = api.newCoverageLonLatPtObjectsRequestBuilder();

                if (params?.index(forKey: "q") != nil) {
                    queryBuilder.withQ(anyToString(params!["q"]!))
                }
                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageLonLatPtObjectsRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "adminUri") != nil) {
                    queryBuilder.withAdminUri(arrayToStringDict(params!["adminUri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionPtObjects:)
    func coverageRegionPtObjects(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: PtobjectsApi? = self.sdk?.ptobjectsApi {
                let queryBuilder: CoverageRegionPtObjectsRequestBuilder = api.newCoverageRegionPtObjectsRequestBuilder();

                if (params?.index(forKey: "q") != nil) {
                    queryBuilder.withQ(anyToString(params!["q"]!))
                }
                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "type") != nil) {
                    queryBuilder.withType(arrayToEnum(params!["type"]!) as [CoverageRegionPtObjectsRequestBuilder.Type[]Enum])
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "adminUri") != nil) {
                    queryBuilder.withAdminUri(arrayToStringDict(params!["adminUri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriRouteSchedules:)
    func coverageLonLatUriRouteSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RouteSchedulesApi? = self.sdk?.routeSchedulesApi {
                let queryBuilder: CoverageLonLatUriRouteSchedulesRequestBuilder = api.newCoverageLonLatUriRouteSchedulesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatUriRouteSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriRouteSchedules:)
    func coverageRegionUriRouteSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RouteSchedulesApi? = self.sdk?.routeSchedulesApi {
                let queryBuilder: CoverageRegionUriRouteSchedulesRequestBuilder = api.newCoverageRegionUriRouteSchedulesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionUriRouteSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(routeSchedules:)
    func routeSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RouteSchedulesApi? = self.sdk?.routeSchedulesApi {
                let queryBuilder: RouteSchedulesRequestBuilder = api.newRouteSchedulesRequestBuilder();

                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as RouteSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatRoutes:)
    func coverageLonLatRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageLonLatRoutesRequestBuilder = api.newCoverageLonLatRoutesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatRoutesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatRoutesId:)
    func coverageLonLatRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageLonLatRoutesIdRequestBuilder = api.newCoverageLonLatRoutesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatRoutesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriRoutes:)
    func coverageLonLatUriRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageLonLatUriRoutesRequestBuilder = api.newCoverageLonLatUriRoutesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriRoutesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriRoutesId:)
    func coverageLonLatUriRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageLonLatUriRoutesIdRequestBuilder = api.newCoverageLonLatUriRoutesIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriRoutesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionRoutes:)
    func coverageRegionRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageRegionRoutesRequestBuilder = api.newCoverageRegionRoutesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionRoutesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionRoutesId:)
    func coverageRegionRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageRegionRoutesIdRequestBuilder = api.newCoverageRegionRoutesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionRoutesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriRoutes:)
    func coverageRegionUriRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageRegionUriRoutesRequestBuilder = api.newCoverageRegionUriRoutesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriRoutesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriRoutesId:)
    func coverageRegionUriRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: CoverageRegionUriRoutesIdRequestBuilder = api.newCoverageRegionUriRoutesIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriRoutesIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(routes:)
    func routes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: RoutesApi? = self.sdk?.routesApi {
                let queryBuilder: RoutesRequestBuilder = api.newRoutesRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as RoutesRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionStatus:)
    func coverageRegionStatus(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StatusApi? = self.sdk?.statusApi {
                let queryBuilder: CoverageRegionStatusRequestBuilder = api.newCoverageRegionStatusRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatStopAreas:)
    func coverageLonLatStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageLonLatStopAreasRequestBuilder = api.newCoverageLonLatStopAreasRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatStopAreasRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatStopAreasId:)
    func coverageLonLatStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageLonLatStopAreasIdRequestBuilder = api.newCoverageLonLatStopAreasIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatStopAreasIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriStopAreas:)
    func coverageLonLatUriStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageLonLatUriStopAreasRequestBuilder = api.newCoverageLonLatUriStopAreasRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriStopAreasRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriStopAreasId:)
    func coverageLonLatUriStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageLonLatUriStopAreasIdRequestBuilder = api.newCoverageLonLatUriStopAreasIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriStopAreasIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionStopAreas:)
    func coverageRegionStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageRegionStopAreasRequestBuilder = api.newCoverageRegionStopAreasRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionStopAreasRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionStopAreasId:)
    func coverageRegionStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageRegionStopAreasIdRequestBuilder = api.newCoverageRegionStopAreasIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionStopAreasIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriStopAreas:)
    func coverageRegionUriStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageRegionUriStopAreasRequestBuilder = api.newCoverageRegionUriStopAreasRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriStopAreasRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriStopAreasId:)
    func coverageRegionUriStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: CoverageRegionUriStopAreasIdRequestBuilder = api.newCoverageRegionUriStopAreasIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriStopAreasIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(stopAreas:)
    func stopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopAreasApi? = self.sdk?.stopAreasApi {
                let queryBuilder: StopAreasRequestBuilder = api.newStopAreasRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as StopAreasRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatStopPoints:)
    func coverageLonLatStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageLonLatStopPointsRequestBuilder = api.newCoverageLonLatStopPointsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatStopPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatStopPointsId:)
    func coverageLonLatStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageLonLatStopPointsIdRequestBuilder = api.newCoverageLonLatStopPointsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatStopPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriStopPoints:)
    func coverageLonLatUriStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageLonLatUriStopPointsRequestBuilder = api.newCoverageLonLatUriStopPointsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriStopPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriStopPointsId:)
    func coverageLonLatUriStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageLonLatUriStopPointsIdRequestBuilder = api.newCoverageLonLatUriStopPointsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriStopPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionStopPoints:)
    func coverageRegionStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageRegionStopPointsRequestBuilder = api.newCoverageRegionStopPointsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionStopPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionStopPointsId:)
    func coverageRegionStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageRegionStopPointsIdRequestBuilder = api.newCoverageRegionStopPointsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionStopPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriStopPoints:)
    func coverageRegionUriStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageRegionUriStopPointsRequestBuilder = api.newCoverageRegionUriStopPointsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriStopPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriStopPointsId:)
    func coverageRegionUriStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: CoverageRegionUriStopPointsIdRequestBuilder = api.newCoverageRegionUriStopPointsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriStopPointsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(stopPoints:)
    func stopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopPointsApi? = self.sdk?.stopPointsApi {
                let queryBuilder: StopPointsRequestBuilder = api.newStopPointsRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as StopPointsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "originalId") != nil) {
                    queryBuilder.withOriginalId(anyToString(params!["originalId"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriStopSchedules:)
    func coverageLonLatUriStopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopSchedulesApi? = self.sdk?.stopSchedulesApi {
                let queryBuilder: CoverageLonLatUriStopSchedulesRequestBuilder = api.newCoverageLonLatUriStopSchedulesRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageLonLatUriStopSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriStopSchedules:)
    func coverageRegionUriStopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopSchedulesApi? = self.sdk?.stopSchedulesApi {
                let queryBuilder: CoverageRegionUriStopSchedulesRequestBuilder = api.newCoverageRegionUriStopSchedulesRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as CoverageRegionUriStopSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(stopSchedules:)
    func stopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: StopSchedulesApi? = self.sdk?.stopSchedulesApi {
                let queryBuilder: StopSchedulesRequestBuilder = api.newStopSchedulesRequestBuilder();

                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }
                if (params?.index(forKey: "fromDatetime") != nil) {
                    queryBuilder.withFromDatetime(anyToDateTime(params!["fromDatetime"]!))
                }
                if (params?.index(forKey: "untilDatetime") != nil) {
                    queryBuilder.withUntilDatetime(anyToDateTime(params!["untilDatetime"]!))
                }
                if (params?.index(forKey: "duration") != nil) {
                    queryBuilder.withDuration(anyToInt(params!["duration"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "maxDateTimes") != nil) {
                    queryBuilder.withMaxDateTimes(anyToInt(params!["maxDateTimes"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "calendar") != nil) {
                    queryBuilder.withCalendar(anyToString(params!["calendar"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "dataFreshness") != nil) {
                    if let enumValue = anyToEnum(params!["dataFreshness"]!) as StopSchedulesRequestBuilder.Data_freshnessEnum? {
                        queryBuilder.withDataFreshness(enumValue)
                    }
                }
                if (params?.index(forKey: "itemsPerSchedule") != nil) {
                    queryBuilder.withItemsPerSchedule(anyToInt(params!["itemsPerSchedule"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionTrafficReports:)
    func coverageRegionTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TrafficReportApi? = self.sdk?.trafficReportApi {
                let queryBuilder: CoverageRegionTrafficReportsRequestBuilder = api.newCoverageRegionTrafficReportsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriTrafficReports:)
    func coverageRegionUriTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TrafficReportApi? = self.sdk?.trafficReportApi {
                let queryBuilder: CoverageRegionUriTrafficReportsRequestBuilder = api.newCoverageRegionUriTrafficReportsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatTrips:)
    func coverageLonLatTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageLonLatTripsRequestBuilder = api.newCoverageLonLatTripsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatTripsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatTripsId:)
    func coverageLonLatTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageLonLatTripsIdRequestBuilder = api.newCoverageLonLatTripsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatTripsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriTrips:)
    func coverageLonLatUriTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageLonLatUriTripsRequestBuilder = api.newCoverageLonLatUriTripsRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriTripsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriTripsId:)
    func coverageLonLatUriTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageLonLatUriTripsIdRequestBuilder = api.newCoverageLonLatUriTripsIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriTripsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionTrips:)
    func coverageRegionTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageRegionTripsRequestBuilder = api.newCoverageRegionTripsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionTripsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionTripsId:)
    func coverageRegionTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageRegionTripsIdRequestBuilder = api.newCoverageRegionTripsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionTripsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriTrips:)
    func coverageRegionUriTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageRegionUriTripsRequestBuilder = api.newCoverageRegionUriTripsRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriTripsRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriTripsId:)
    func coverageRegionUriTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: TripsApi? = self.sdk?.tripsApi {
                let queryBuilder: CoverageRegionUriTripsIdRequestBuilder = api.newCoverageRegionUriTripsIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriTripsIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriVehicleJourneys:)
    func coverageLonLatUriVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageLonLatUriVehicleJourneysRequestBuilder = api.newCoverageLonLatUriVehicleJourneysRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriVehicleJourneysRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatUriVehicleJourneysId:)
    func coverageLonLatUriVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageLonLatUriVehicleJourneysIdRequestBuilder = api.newCoverageLonLatUriVehicleJourneysIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatUriVehicleJourneysIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatVehicleJourneys:)
    func coverageLonLatVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageLonLatVehicleJourneysRequestBuilder = api.newCoverageLonLatVehicleJourneysRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatVehicleJourneysRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageLonLatVehicleJourneysId:)
    func coverageLonLatVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageLonLatVehicleJourneysIdRequestBuilder = api.newCoverageLonLatVehicleJourneysIdRequestBuilder();

                if (params?.index(forKey: "lat") != nil) {
                    queryBuilder.withLat(anyToFloat(params!["lat"]!))
                }
                if (params?.index(forKey: "lon") != nil) {
                    queryBuilder.withLon(anyToFloat(params!["lon"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageLonLatVehicleJourneysIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriVehicleJourneys:)
    func coverageRegionUriVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageRegionUriVehicleJourneysRequestBuilder = api.newCoverageRegionUriVehicleJourneysRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriVehicleJourneysRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionUriVehicleJourneysId:)
    func coverageRegionUriVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageRegionUriVehicleJourneysIdRequestBuilder = api.newCoverageRegionUriVehicleJourneysIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "uri") != nil) {
                    queryBuilder.withUri(anyToString(params!["uri"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionUriVehicleJourneysIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionVehicleJourneys:)
    func coverageRegionVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageRegionVehicleJourneysRequestBuilder = api.newCoverageRegionVehicleJourneysRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionVehicleJourneysRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(coverageRegionVehicleJourneysId:)
    func coverageRegionVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: CoverageRegionVehicleJourneysIdRequestBuilder = api.newCoverageRegionVehicleJourneysIdRequestBuilder();

                if (params?.index(forKey: "region") != nil) {
                    queryBuilder.withRegion(anyToString(params!["region"]!))
                }
                if (params?.index(forKey: "id") != nil) {
                    queryBuilder.withId(anyToString(params!["id"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as CoverageRegionVehicleJourneysIdRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
    @objc(vehicleJourneys:)
    func vehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]

        if params == nil || params?.count == 0 {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        } else {
            if let api: VehicleJourneysApi? = self.sdk?.vehicleJourneysApi {
                let queryBuilder: VehicleJourneysRequestBuilder = api.newVehicleJourneysRequestBuilder();

                if (params?.index(forKey: "externalCode") != nil) {
                    queryBuilder.withExternalCode(anyToString(params!["externalCode"]!))
                }
                if (params?.index(forKey: "startPage") != nil) {
                    queryBuilder.withStartPage(anyToInt(params!["startPage"]!))
                }
                if (params?.index(forKey: "count") != nil) {
                    queryBuilder.withCount(anyToInt(params!["count"]!))
                }
                if (params?.index(forKey: "depth") != nil) {
                    queryBuilder.withDepth(anyToInt(params!["depth"]!))
                }
                if (params?.index(forKey: "forbiddenId") != nil) {
                    queryBuilder.withForbiddenId(arrayToStringDict(params!["forbiddenId"]!))
                }
                if (params?.index(forKey: "forbiddenUris") != nil) {
                    queryBuilder.withForbiddenUris(arrayToStringDict(params!["forbiddenUris"]!))
                }
                if (params?.index(forKey: "headsign") != nil) {
                    queryBuilder.withHeadsign(anyToString(params!["headsign"]!))
                }
                if (params?.index(forKey: "showCodes") != nil) {
                    queryBuilder.withShowCodes(anyToBool(params!["showCodes"]!))
                }
                if (params?.index(forKey: "odtLevel") != nil) {
                    if let enumValue = anyToEnum(params!["odtLevel"]!) as VehicleJourneysRequestBuilder.Odt_levelEnum? {
                        queryBuilder.withOdtLevel(enumValue)
                    }
                }
                if (params?.index(forKey: "distance") != nil) {
                    queryBuilder.withDistance(anyToInt(params!["distance"]!))
                }
                if (params?.index(forKey: "since") != nil) {
                    queryBuilder.withSince(anyToDateTime(params!["since"]!))
                }
                if (params?.index(forKey: "until") != nil) {
                    queryBuilder.withUntil(anyToDateTime(params!["until"]!))
                }
                if (params?.index(forKey: "disableGeojson") != nil) {
                    queryBuilder.withDisableGeojson(anyToBool(params!["disableGeojson"]!))
                }
                if (params?.index(forKey: "filter") != nil) {
                    queryBuilder.withFilter(anyToString(params!["filter"]!))
                }

                queryBuilder.rawGet(completion: { results, error in
                    var pluginResult: CDVPluginResult? = nil

                    if error == nil {
                        NSLog(String(format: "SDK journeys with query %@", queryBuilder.makeUrl()))
                        let jsonData = results?.data(using: String.Encoding.utf8)
                        if jsonData != nil {
                            do {
                                let jsonResults = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
                            } catch {
                                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                            }
                        }
                    } else {
                        NSLog(String(format: "SDK journeys fail with query %@", queryBuilder.makeUrl()))
                        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error!.localizedDescription)
                    }

                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                })
            }
        }
    }
}
