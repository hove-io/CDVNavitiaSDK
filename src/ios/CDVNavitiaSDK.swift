import NavitiaSDK

@objc(CDVNavitiaSDK) class CDVNavitiaSDK : CDVPlugin {

    func anyToDateTime(_ value: Any?) -> Date {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")

        return isoFormatter.date(from: value as! String)!
    }

    func anyToBool(_ value: Any?) -> Bool {
        return value as? Bool ?? false
    }

    func anyToInt(_ value: Any?) -> Int {
        return value as? Int ?? 0
    }

    func anyToFloat(_ value: Any?) -> Float {
        return value as? Float ?? 0
    }

    func anyToDouble(_ value: Any?) -> Double {
        return value as? Double ?? 0
    }

    func anyToString(_ value: Any?) -> String {
        return value as? String ?? ""
    }

    func arrayToEnum<T: RawRepresentable>(_ values: Any?) -> [T] {
        guard let rawValues = values as? [Any] else {
            return []
        }
        
        var values: [T]  = []
        rawValues.forEach({ rawValue in
            if let value = anyToEnum(rawValue) as T? {
                values.append(value)
            }
        })

        return values
    }

    func anyToEnum<T: RawRepresentable>(_ value: Any?) -> T? {
        guard let rawValue = value as? T.RawValue else {
            return nil
        }

        return T.init(rawValue: rawValue)
    }

    func arrayToStringDict(_ values: Any?) -> [String] {
        return values as? [String] ?? []
    }

    func arrayToIntDict(_ values: Any?) -> [Int] {
        return values as? [Int] ?? []
    }

    @objc(init:)
    func `init`(command: CDVInvokedUrlCommand) {
        guard let arguments = command.arguments, let config = arguments[0] as? [String: Any] else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "No valid plugin config")
            commandDelegate.send(pluginResult, callbackId: command.callbackId)
            return
        }

        guard let token = config["token"] as? String, !token.isEmpty else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "No token provided")
            commandDelegate.send(pluginResult, callbackId: command.callbackId)
            return
        }

        let environment = toNavitiaEnvironment(environment: config["environment"] as? String ?? "PROD")
        Expert.shared.initialize(token: token, environment: environment)
        
        let message = String(format: "SDK initialized with token %@", token)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: message)
        commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    private func toNavitiaEnvironment(environment: String) -> NavitiaEnvironment {
        switch environment {
        case "CUSTOMER":
            return NavitiaEnvironment.customer
        case "DEV":
            return NavitiaEnvironment.dev
        case "INTERNAL":
            return NavitiaEnvironment.internal
        default:
            return NavitiaEnvironment.prod
        }
    }

    @objc(coverageLonLatAddresses:)
    func coverageLonLatAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageLonLatAddresses(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatAddressesId:)
    func coverageLonLatAddressesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageLonLatAddressesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriAddresses:)
    func coverageLonLatUriAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageLonLatUriAddresses(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriAddressesId:)
    func coverageLonLatUriAddressesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageLonLatUriAddressesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionAddresses:)
    func coverageRegionAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageRegionAddresses(region: anyToString(params["region"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionAddressesId:)
    func coverageRegionAddressesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageRegionAddressesId(region: anyToString(params["region"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriAddresses:)
    func coverageRegionUriAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageRegionUriAddresses(region: anyToString(params["region"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriAddressesId:)
    func coverageRegionUriAddressesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.addressesApi.getCoverageRegionUriAddressesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCalendars:)
    func coverageLonLatCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageLonLatCalendars(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCalendarsId:)
    func coverageLonLatCalendarsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageLonLatCalendarsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCalendars:)
    func coverageLonLatUriCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageLonLatUriCalendars(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCalendars:)
    func coverageRegionCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageRegionCalendars(region: anyToString(params["region"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCalendarsId:)
    func coverageRegionCalendarsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageRegionCalendarsId(region: anyToString(params["region"]), id: anyToString(params["id"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCalendars:)
    func coverageRegionUriCalendars(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.calendarsApi.getCoverageRegionUriCalendars(region: anyToString(params["region"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), startDate: anyToString(params["startDate"]), endDate: anyToString(params["endDate"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCommercialModes:)
    func coverageLonLatCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageLonLatCommercialModes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCommercialModesId:)
    func coverageLonLatCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageLonLatCommercialModesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCommercialModes:)
    func coverageLonLatUriCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageLonLatUriCommercialModes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCommercialModesId:)
    func coverageLonLatUriCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageLonLatUriCommercialModesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCommercialModes:)
    func coverageRegionCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageRegionCommercialModes(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCommercialModesId:)
    func coverageRegionCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageRegionCommercialModesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCommercialModes:)
    func coverageRegionUriCommercialModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageRegionUriCommercialModes(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCommercialModesId:)
    func coverageRegionUriCommercialModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.commercialModesApi.getCoverageRegionUriCommercialModesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCompanies:)
    func coverageLonLatCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageLonLatCompanies(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCompaniesId:)
    func coverageLonLatCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageLonLatCompaniesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCompanies:)
    func coverageLonLatUriCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageLonLatUriCompanies(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCompaniesId:)
    func coverageLonLatUriCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageLonLatUriCompaniesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCompanies:)
    func coverageRegionCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageRegionCompanies(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCompaniesId:)
    func coverageRegionCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageRegionCompaniesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCompanies:)
    func coverageRegionUriCompanies(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageRegionUriCompanies(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCompaniesId:)
    func coverageRegionUriCompaniesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.companiesApi.getCoverageRegionUriCompaniesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatContributors:)
    func coverageLonLatContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageLonLatContributors(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatContributorsId:)
    func coverageLonLatContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageLonLatContributorsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriContributors:)
    func coverageLonLatUriContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageLonLatUriContributors(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriContributorsId:)
    func coverageLonLatUriContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageLonLatUriContributorsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionContributors:)
    func coverageRegionContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageRegionContributors(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionContributorsId:)
    func coverageRegionContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageRegionContributorsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriContributors:)
    func coverageRegionUriContributors(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageRegionUriContributors(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriContributorsId:)
    func coverageRegionUriContributorsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.contributorsApi.getCoverageRegionUriContributorsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordLonLat:)
    func coordLonLat(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordApi.getCoordLonLat(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordsLonLat:)
    func coordsLonLat(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordApi.getCoordsLonLat(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoordLonLatAddresses:)
    func coverageRegionCoordLonLatAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordApi.getCoverageRegionCoordLonLatAddresses(lat: anyToDouble(params["lat"]), region: anyToString(params["region"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoordsLonLatAddresses:)
    func coverageRegionCoordsLonLatAddresses(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordApi.getCoverageRegionCoordsLonLatAddresses(lat: anyToDouble(params["lat"]), region: anyToString(params["region"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCoord:)
    func coverageLonLatCoord(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatCoord(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCoordId:)
    func coverageLonLatCoordId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatCoordId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCoords:)
    func coverageLonLatCoords(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatCoords(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatCoordsId:)
    func coverageLonLatCoordsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatCoordsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCoord:)
    func coverageLonLatUriCoord(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatUriCoord(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCoordId:)
    func coverageLonLatUriCoordId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatUriCoordId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCoords:)
    func coverageLonLatUriCoords(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatUriCoords(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriCoordsId:)
    func coverageLonLatUriCoordsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageLonLatUriCoordsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoord:)
    func coverageRegionCoord(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionCoord(region: anyToString(params["region"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoordId:)
    func coverageRegionCoordId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionCoordId(region: anyToString(params["region"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoords:)
    func coverageRegionCoords(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionCoords(region: anyToString(params["region"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionCoordsId:)
    func coverageRegionCoordsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionCoordsId(region: anyToString(params["region"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCoord:)
    func coverageRegionUriCoord(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionUriCoord(region: anyToString(params["region"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCoordId:)
    func coverageRegionUriCoordId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionUriCoordId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCoords:)
    func coverageRegionUriCoords(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionUriCoords(region: anyToString(params["region"]), uri: anyToString(params["uri"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriCoordsId:)
    func coverageRegionUriCoordsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coordsApi.getCoverageRegionUriCoordsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverage:)
    func coverage(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coverageApi.getCoverage(disableGeojson: anyToBool(params["disableGeojson"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLat:)
    func coverageLonLat(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coverageApi.getCoverageLonLat(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), disableGeojson: anyToBool(params["disableGeojson"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegion:)
    func coverageRegion(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.coverageApi.getCoverageRegion(region: anyToString(params["region"]), disableGeojson: anyToBool(params["disableGeojson"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatDatasets:)
    func coverageLonLatDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageLonLatDatasets(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatDatasetsId:)
    func coverageLonLatDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageLonLatDatasetsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriDatasets:)
    func coverageLonLatUriDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageLonLatUriDatasets(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriDatasetsId:)
    func coverageLonLatUriDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageLonLatUriDatasetsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionDatasets:)
    func coverageRegionDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageRegionDatasets(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionDatasetsId:)
    func coverageRegionDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageRegionDatasetsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriDatasets:)
    func coverageRegionUriDatasets(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageRegionUriDatasets(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriDatasetsId:)
    func coverageRegionUriDatasetsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.datasetsApi.getCoverageRegionUriDatasetsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatDisruptions:)
    func coverageLonLatDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageLonLatDisruptions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatDisruptionsId:)
    func coverageLonLatDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageLonLatDisruptionsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriDisruptions:)
    func coverageLonLatUriDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageLonLatUriDisruptions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriDisruptionsId:)
    func coverageLonLatUriDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageLonLatUriDisruptionsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionDisruptions:)
    func coverageRegionDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageRegionDisruptions(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionDisruptionsId:)
    func coverageRegionDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageRegionDisruptionsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriDisruptions:)
    func coverageRegionUriDisruptions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageRegionUriDisruptions(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriDisruptionsId:)
    func coverageRegionUriDisruptionsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.disruptionsApi.getCoverageRegionUriDisruptionsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordLonLatEquipmentReports:)
    func coordLonLatEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoordLonLatEquipmentReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordsLonLatEquipmentReports:)
    func coordsLonLatEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoordsLonLatEquipmentReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatEquipmentReports:)
    func coverageLonLatEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoverageLonLatEquipmentReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriEquipmentReports:)
    func coverageLonLatUriEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoverageLonLatUriEquipmentReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionEquipmentReports:)
    func coverageRegionEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoverageRegionEquipmentReports(region: anyToString(params["region"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriEquipmentReports:)
    func coverageRegionUriEquipmentReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.equipmentReportsApi.getCoverageRegionUriEquipmentReports(region: anyToString(params["region"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordLonLatFreefloatingsNearby:)
    func coordLonLatFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoordLonLatFreefloatingsNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordsLonLatFreefloatingsNearby:)
    func coordsLonLatFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoordsLonLatFreefloatingsNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatFreefloatingsNearby:)
    func coverageLonLatFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoverageLonLatFreefloatingsNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriFreefloatingsNearby:)
    func coverageLonLatUriFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoverageLonLatUriFreefloatingsNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionFreefloatingsNearby:)
    func coverageRegionFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoverageRegionFreefloatingsNearby(region: anyToString(params["region"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriFreefloatingsNearby:)
    func coverageRegionUriFreefloatingsNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.freeFloatingsNearbyApi.getCoverageRegionUriFreefloatingsNearby(region: anyToString(params["region"]), uri: anyToString(params["uri"]), type: arrayToStringDict(params["type"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), coord: anyToString(params["coord"]), startPage: anyToInt(params["startPage"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatGeoStatus:)
    func coverageLonLatGeoStatus(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.geoStatusApi.getCoverageLonLatGeoStatus(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionGeoStatus:)
    func coverageRegionGeoStatus(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.geoStatusApi.getCoverageRegionGeoStatus(region: anyToString(params["region"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatIsochrones:)
    func coverageLonLatIsochrones(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.graphicalIsochroneApi.getCoverageLonLatIsochrones(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), minDuration: anyToInt(params["minDuration"]), boundaryDuration: arrayToIntDict(params["boundaryDuration"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionIsochrones:)
    func coverageRegionIsochrones(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.graphicalIsochroneApi.getCoverageRegionIsochrones(region: anyToString(params["region"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), minDuration: anyToInt(params["minDuration"]), boundaryDuration: arrayToIntDict(params["boundaryDuration"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatHeatMaps:)
    func coverageLonLatHeatMaps(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.heatMapApi.getCoverageLonLatHeatMaps(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), resolution: anyToInt(params["resolution"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionHeatMaps:)
    func coverageRegionHeatMaps(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.heatMapApi.getCoverageRegionHeatMaps(region: anyToString(params["region"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), resolution: anyToInt(params["resolution"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatJourneyPatternPoints:)
    func coverageLonLatJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageLonLatJourneyPatternPoints(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatJourneyPatternPointsId:)
    func coverageLonLatJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageLonLatJourneyPatternPointsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriJourneyPatternPoints:)
    func coverageLonLatUriJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageLonLatUriJourneyPatternPoints(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriJourneyPatternPointsId:)
    func coverageLonLatUriJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageLonLatUriJourneyPatternPointsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionJourneyPatternPoints:)
    func coverageRegionJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageRegionJourneyPatternPoints(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionJourneyPatternPointsId:)
    func coverageRegionJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageRegionJourneyPatternPointsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriJourneyPatternPoints:)
    func coverageRegionUriJourneyPatternPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageRegionUriJourneyPatternPoints(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriJourneyPatternPointsId:)
    func coverageRegionUriJourneyPatternPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternPointsApi.getCoverageRegionUriJourneyPatternPointsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatJourneyPatterns:)
    func coverageLonLatJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageLonLatJourneyPatterns(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatJourneyPatternsId:)
    func coverageLonLatJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageLonLatJourneyPatternsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriJourneyPatterns:)
    func coverageLonLatUriJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageLonLatUriJourneyPatterns(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriJourneyPatternsId:)
    func coverageLonLatUriJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageLonLatUriJourneyPatternsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionJourneyPatterns:)
    func coverageRegionJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageRegionJourneyPatterns(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionJourneyPatternsId:)
    func coverageRegionJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageRegionJourneyPatternsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriJourneyPatterns:)
    func coverageRegionUriJourneyPatterns(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageRegionUriJourneyPatterns(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriJourneyPatternsId:)
    func coverageRegionUriJourneyPatternsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeyPatternsApi.getCoverageRegionUriJourneyPatternsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatJourneys:)
    func coverageLonLatJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeysApi.getCoverageLonLatJourneys(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), count: anyToInt(params["count"]), isJourneySchedules: anyToBool(params["isJourneySchedules"]), minNbJourneys: anyToInt(params["minNbJourneys"]), maxNbJourneys: anyToInt(params["maxNbJourneys"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), timeframeDuration: anyToInt(params["timeframeDuration"]), equipmentDetails: anyToBool(params["equipmentDetails"]), maxTaxiDirectPathDuration: anyToInt(params["maxTaxiDirectPathDuration"]), maxWalkingDirectPathDuration: anyToInt(params["maxWalkingDirectPathDuration"]), maxCarNoParkDirectPathDuration: anyToInt(params["maxCarNoParkDirectPathDuration"]), maxCarDirectPathDuration: anyToInt(params["maxCarDirectPathDuration"]), maxRidesharingDirectPathDuration: anyToInt(params["maxRidesharingDirectPathDuration"]), maxBssDirectPathDuration: anyToInt(params["maxBssDirectPathDuration"]), maxBikeDirectPathDuration: anyToInt(params["maxBikeDirectPathDuration"]), depth: anyToInt(params["depth"]), maxWaitingDuration: anyToInt(params["maxWaitingDuration"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionJourneys:)
    func coverageRegionJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeysApi.getCoverageRegionJourneys(region: anyToString(params["region"]), from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), count: anyToInt(params["count"]), isJourneySchedules: anyToBool(params["isJourneySchedules"]), minNbJourneys: anyToInt(params["minNbJourneys"]), maxNbJourneys: anyToInt(params["maxNbJourneys"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), timeframeDuration: anyToInt(params["timeframeDuration"]), equipmentDetails: anyToBool(params["equipmentDetails"]), maxTaxiDirectPathDuration: anyToInt(params["maxTaxiDirectPathDuration"]), maxWalkingDirectPathDuration: anyToInt(params["maxWalkingDirectPathDuration"]), maxCarNoParkDirectPathDuration: anyToInt(params["maxCarNoParkDirectPathDuration"]), maxCarDirectPathDuration: anyToInt(params["maxCarDirectPathDuration"]), maxRidesharingDirectPathDuration: anyToInt(params["maxRidesharingDirectPathDuration"]), maxBssDirectPathDuration: anyToInt(params["maxBssDirectPathDuration"]), maxBikeDirectPathDuration: anyToInt(params["maxBikeDirectPathDuration"]), depth: anyToInt(params["depth"]), maxWaitingDuration: anyToInt(params["maxWaitingDuration"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(journeys:)
    func journeys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.journeysApi.getJourneys(from: anyToString(params["from"]), to: anyToString(params["to"]), datetime: anyToDateTime(params["datetime"]), datetimeRepresents: anyToString(params["datetimeRepresents"]), maxNbTransfers: anyToInt(params["maxNbTransfers"]), minNbTransfers: anyToInt(params["minNbTransfers"]), firstSectionMode: arrayToStringDict(params["firstSectionMode"]), lastSectionMode: arrayToStringDict(params["lastSectionMode"]), maxDurationToPt: anyToInt(params["maxDurationToPt"]), maxWalkingDurationToPt: anyToInt(params["maxWalkingDurationToPt"]), maxBikeDurationToPt: anyToInt(params["maxBikeDurationToPt"]), maxBssDurationToPt: anyToInt(params["maxBssDurationToPt"]), maxCarDurationToPt: anyToInt(params["maxCarDurationToPt"]), maxRidesharingDurationToPt: anyToInt(params["maxRidesharingDurationToPt"]), maxCarNoParkDurationToPt: anyToInt(params["maxCarNoParkDurationToPt"]), maxTaxiDurationToPt: anyToInt(params["maxTaxiDurationToPt"]), walkingSpeed: anyToFloat(params["walkingSpeed"]), bikeSpeed: anyToFloat(params["bikeSpeed"]), bssSpeed: anyToFloat(params["bssSpeed"]), carSpeed: anyToFloat(params["carSpeed"]), ridesharingSpeed: anyToFloat(params["ridesharingSpeed"]), carNoParkSpeed: anyToFloat(params["carNoParkSpeed"]), taxiSpeed: anyToFloat(params["taxiSpeed"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), allowedId: arrayToStringDict(params["allowedId"]), disruptionActive: anyToBool(params["disruptionActive"]), dataFreshness: anyToString(params["dataFreshness"]), maxDuration: anyToInt(params["maxDuration"]), wheelchair: anyToBool(params["wheelchair"]), travelerType: anyToString(params["travelerType"]), directPath: anyToString(params["directPath"]), freeRadiusFrom: anyToInt(params["freeRadiusFrom"]), freeRadiusTo: anyToInt(params["freeRadiusTo"]), directPathMode: arrayToStringDict(params["directPathMode"]), partnerServices: arrayToStringDict(params["partnerServices"]), count: anyToInt(params["count"]), isJourneySchedules: anyToBool(params["isJourneySchedules"]), minNbJourneys: anyToInt(params["minNbJourneys"]), maxNbJourneys: anyToInt(params["maxNbJourneys"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), timeframeDuration: anyToInt(params["timeframeDuration"]), equipmentDetails: anyToBool(params["equipmentDetails"]), maxTaxiDirectPathDuration: anyToInt(params["maxTaxiDirectPathDuration"]), maxWalkingDirectPathDuration: anyToInt(params["maxWalkingDirectPathDuration"]), maxCarNoParkDirectPathDuration: anyToInt(params["maxCarNoParkDirectPathDuration"]), maxCarDirectPathDuration: anyToInt(params["maxCarDirectPathDuration"]), maxRidesharingDirectPathDuration: anyToInt(params["maxRidesharingDirectPathDuration"]), maxBssDirectPathDuration: anyToInt(params["maxBssDirectPathDuration"]), maxBikeDirectPathDuration: anyToInt(params["maxBikeDirectPathDuration"]), depth: anyToInt(params["depth"]), maxWaitingDuration: anyToInt(params["maxWaitingDuration"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatLineGroups:)
    func coverageLonLatLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageLonLatLineGroups(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatLineGroupsId:)
    func coverageLonLatLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageLonLatLineGroupsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriLineGroups:)
    func coverageLonLatUriLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageLonLatUriLineGroups(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriLineGroupsId:)
    func coverageLonLatUriLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageLonLatUriLineGroupsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionLineGroups:)
    func coverageRegionLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageRegionLineGroups(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionLineGroupsId:)
    func coverageRegionLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageRegionLineGroupsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriLineGroups:)
    func coverageRegionUriLineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageRegionUriLineGroups(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriLineGroupsId:)
    func coverageRegionUriLineGroupsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getCoverageRegionUriLineGroupsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(lineGroups:)
    func lineGroups(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineGroupsApi.getLineGroups(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatLineReports:)
    func coverageLonLatLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineReportsApi.getCoverageLonLatLineReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), filterStatus: arrayToStringDict(params["filterStatus"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriLineReports:)
    func coverageLonLatUriLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineReportsApi.getCoverageLonLatUriLineReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), filterStatus: arrayToStringDict(params["filterStatus"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionLineReports:)
    func coverageRegionLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineReportsApi.getCoverageRegionLineReports(region: anyToString(params["region"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), filterStatus: arrayToStringDict(params["filterStatus"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriLineReports:)
    func coverageRegionUriLineReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.lineReportsApi.getCoverageRegionUriLineReports(region: anyToString(params["region"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), filterStatus: arrayToStringDict(params["filterStatus"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatLines:)
    func coverageLonLatLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageLonLatLines(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatLinesId:)
    func coverageLonLatLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageLonLatLinesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriLines:)
    func coverageLonLatUriLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageLonLatUriLines(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriLinesId:)
    func coverageLonLatUriLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageLonLatUriLinesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionLines:)
    func coverageRegionLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageRegionLines(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionLinesId:)
    func coverageRegionLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageRegionLinesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriLines:)
    func coverageRegionUriLines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageRegionUriLines(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriLinesId:)
    func coverageRegionUriLinesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getCoverageRegionUriLinesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(lines:)
    func lines(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.linesApi.getLines(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatNetworks:)
    func coverageLonLatNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageLonLatNetworks(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatNetworksId:)
    func coverageLonLatNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageLonLatNetworksId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriNetworks:)
    func coverageLonLatUriNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageLonLatUriNetworks(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriNetworksId:)
    func coverageLonLatUriNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageLonLatUriNetworksId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionNetworks:)
    func coverageRegionNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageRegionNetworks(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionNetworksId:)
    func coverageRegionNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageRegionNetworksId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriNetworks:)
    func coverageRegionUriNetworks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageRegionUriNetworks(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriNetworksId:)
    func coverageRegionUriNetworksId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getCoverageRegionUriNetworksId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(networks:)
    func networks(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.networksApi.getNetworks(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatArrivals:)
    func coverageLonLatArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextArrivalsApi.getCoverageLonLatArrivals(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriArrivals:)
    func coverageLonLatUriArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextArrivalsApi.getCoverageLonLatUriArrivals(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionArrivals:)
    func coverageRegionArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextArrivalsApi.getCoverageRegionArrivals(region: anyToString(params["region"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriArrivals:)
    func coverageRegionUriArrivals(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextArrivalsApi.getCoverageRegionUriArrivals(region: anyToString(params["region"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatDepartures:)
    func coverageLonLatDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextDeparturesApi.getCoverageLonLatDepartures(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriDepartures:)
    func coverageLonLatUriDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextDeparturesApi.getCoverageLonLatUriDepartures(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionDepartures:)
    func coverageRegionDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextDeparturesApi.getCoverageRegionDepartures(region: anyToString(params["region"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriDepartures:)
    func coverageRegionUriDepartures(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.nextDeparturesApi.getCoverageRegionUriDepartures(region: anyToString(params["region"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPhysicalModes:)
    func coverageLonLatPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageLonLatPhysicalModes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPhysicalModesId:)
    func coverageLonLatPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageLonLatPhysicalModesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPhysicalModes:)
    func coverageLonLatUriPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageLonLatUriPhysicalModes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPhysicalModesId:)
    func coverageLonLatUriPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageLonLatUriPhysicalModesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPhysicalModes:)
    func coverageRegionPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageRegionPhysicalModes(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPhysicalModesId:)
    func coverageRegionPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageRegionPhysicalModesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPhysicalModes:)
    func coverageRegionUriPhysicalModes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageRegionUriPhysicalModes(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPhysicalModesId:)
    func coverageRegionUriPhysicalModesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.physicalModesApi.getCoverageRegionUriPhysicalModesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPlacesId:)
    func coverageLonLatPlacesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placeUriApi.getCoverageLonLatPlacesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPlacesId:)
    func coverageRegionPlacesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placeUriApi.getCoverageRegionPlacesId(region: anyToString(params["region"]), id: anyToString(params["id"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(placesId:)
    func placesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placeUriApi.getPlacesId(id: anyToString(params["id"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPlaces:)
    func coverageLonLatPlaces(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesApi.getCoverageLonLatPlaces(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), q: anyToString(params["q"]), type: arrayToStringDict(params["type"]), count: anyToInt(params["count"]), adminUri: arrayToStringDict(params["adminUri"]), depth: anyToInt(params["depth"]), disableGeojson: anyToBool(params["disableGeojson"]), from: anyToString(params["from"]), shape: anyToString(params["shape"]), shapeScope: arrayToStringDict(params["shapeScope"]), placesProximityRadius: anyToFloat(params["placesProximityRadius"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPlaces:)
    func coverageRegionPlaces(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesApi.getCoverageRegionPlaces(region: anyToString(params["region"]), q: anyToString(params["q"]), type: arrayToStringDict(params["type"]), count: anyToInt(params["count"]), adminUri: arrayToStringDict(params["adminUri"]), depth: anyToInt(params["depth"]), disableGeojson: anyToBool(params["disableGeojson"]), from: anyToString(params["from"]), shape: anyToString(params["shape"]), shapeScope: arrayToStringDict(params["shapeScope"]), placesProximityRadius: anyToFloat(params["placesProximityRadius"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(places:)
    func places(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesApi.getPlaces(q: anyToString(params["q"]), type: arrayToStringDict(params["type"]), count: anyToInt(params["count"]), adminUri: arrayToStringDict(params["adminUri"]), depth: anyToInt(params["depth"]), disableGeojson: anyToBool(params["disableGeojson"]), from: anyToString(params["from"]), shape: anyToString(params["shape"]), shapeScope: arrayToStringDict(params["shapeScope"]), placesProximityRadius: anyToFloat(params["placesProximityRadius"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordLonLatPlacesNearby:)
    func coordLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoordLonLatPlacesNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordsLonLatPlacesNearby:)
    func coordsLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoordsLonLatPlacesNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPlacesNearby:)
    func coverageLonLatPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoverageLonLatPlacesNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPlacesNearby:)
    func coverageLonLatUriPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoverageLonLatUriPlacesNearby(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPlacesNearby:)
    func coverageRegionPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoverageRegionPlacesNearby(region: anyToString(params["region"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPlacesNearby:)
    func coverageRegionUriPlacesNearby(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.placesNearbyApi.getCoverageRegionUriPlacesNearby(region: anyToString(params["region"]), uri: anyToString(params["uri"]), type: arrayToStringDict(params["type"]), filter: anyToString(params["filter"]), distance: anyToInt(params["distance"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), startPage: anyToInt(params["startPage"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPoiTypes:)
    func coverageLonLatPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageLonLatPoiTypes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPoiTypesId:)
    func coverageLonLatPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageLonLatPoiTypesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPoiTypes:)
    func coverageLonLatUriPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageLonLatUriPoiTypes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPoiTypesId:)
    func coverageLonLatUriPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageLonLatUriPoiTypesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPoiTypes:)
    func coverageRegionPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageRegionPoiTypes(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPoiTypesId:)
    func coverageRegionPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageRegionPoiTypesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPoiTypes:)
    func coverageRegionUriPoiTypes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageRegionUriPoiTypes(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPoiTypesId:)
    func coverageRegionUriPoiTypesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poiTypesApi.getCoverageRegionUriPoiTypesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPois:)
    func coverageLonLatPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageLonLatPois(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPoisId:)
    func coverageLonLatPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageLonLatPoisId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPois:)
    func coverageLonLatUriPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageLonLatUriPois(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriPoisId:)
    func coverageLonLatUriPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageLonLatUriPoisId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPois:)
    func coverageRegionPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageRegionPois(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPoisId:)
    func coverageRegionPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageRegionPoisId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPois:)
    func coverageRegionUriPois(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageRegionUriPois(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriPoisId:)
    func coverageRegionUriPoisId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.poisApi.getCoverageRegionUriPoisId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"]), bssStands: anyToBool(params["bssStands"]), addPoiInfos: arrayToStringDict(params["addPoiInfos"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatPtObjects:)
    func coverageLonLatPtObjects(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.ptobjectsApi.getCoverageLonLatPtObjects(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), q: anyToString(params["q"]), type: arrayToStringDict(params["type"]), count: anyToInt(params["count"]), adminUri: arrayToStringDict(params["adminUri"]), depth: anyToInt(params["depth"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionPtObjects:)
    func coverageRegionPtObjects(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.ptobjectsApi.getCoverageRegionPtObjects(region: anyToString(params["region"]), q: anyToString(params["q"]), type: arrayToStringDict(params["type"]), count: anyToInt(params["count"]), adminUri: arrayToStringDict(params["adminUri"]), depth: anyToInt(params["depth"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriRouteSchedules:)
    func coverageLonLatUriRouteSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routeSchedulesApi.getCoverageLonLatUriRouteSchedules(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriRouteSchedules:)
    func coverageRegionUriRouteSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routeSchedulesApi.getCoverageRegionUriRouteSchedules(region: anyToString(params["region"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(routeSchedules:)
    func routeSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routeSchedulesApi.getRouteSchedules(filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatRoutes:)
    func coverageLonLatRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageLonLatRoutes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatRoutesId:)
    func coverageLonLatRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageLonLatRoutesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriRoutes:)
    func coverageLonLatUriRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageLonLatUriRoutes(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriRoutesId:)
    func coverageLonLatUriRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageLonLatUriRoutesId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionRoutes:)
    func coverageRegionRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageRegionRoutes(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionRoutesId:)
    func coverageRegionRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageRegionRoutesId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriRoutes:)
    func coverageRegionUriRoutes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageRegionUriRoutes(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriRoutesId:)
    func coverageRegionUriRoutesId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getCoverageRegionUriRoutesId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(routes:)
    func routes(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.routesApi.getRoutes(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatStopAreas:)
    func coverageLonLatStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageLonLatStopAreas(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatStopAreasId:)
    func coverageLonLatStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageLonLatStopAreasId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriStopAreas:)
    func coverageLonLatUriStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageLonLatUriStopAreas(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriStopAreasId:)
    func coverageLonLatUriStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageLonLatUriStopAreasId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionStopAreas:)
    func coverageRegionStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageRegionStopAreas(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionStopAreasId:)
    func coverageRegionStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageRegionStopAreasId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriStopAreas:)
    func coverageRegionUriStopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageRegionUriStopAreas(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriStopAreasId:)
    func coverageRegionUriStopAreasId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getCoverageRegionUriStopAreasId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(stopAreas:)
    func stopAreas(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopAreasApi.getStopAreas(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatStopPoints:)
    func coverageLonLatStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageLonLatStopPoints(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatStopPointsId:)
    func coverageLonLatStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageLonLatStopPointsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriStopPoints:)
    func coverageLonLatUriStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageLonLatUriStopPoints(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriStopPointsId:)
    func coverageLonLatUriStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageLonLatUriStopPointsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionStopPoints:)
    func coverageRegionStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageRegionStopPoints(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionStopPointsId:)
    func coverageRegionStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageRegionStopPointsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriStopPoints:)
    func coverageRegionUriStopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageRegionUriStopPoints(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriStopPointsId:)
    func coverageRegionUriStopPointsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getCoverageRegionUriStopPointsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(stopPoints:)
    func stopPoints(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopPointsApi.getStopPoints(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"]), originalId: anyToString(params["originalId"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriStopSchedules:)
    func coverageLonLatUriStopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopSchedulesApi.getCoverageLonLatUriStopSchedules(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriStopSchedules:)
    func coverageRegionUriStopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopSchedulesApi.getCoverageRegionUriStopSchedules(region: anyToString(params["region"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(stopSchedules:)
    func stopSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.stopSchedulesApi.getStopSchedules(filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriTerminusSchedules:)
    func coverageLonLatUriTerminusSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.terminusSchedulesApi.getCoverageLonLatUriTerminusSchedules(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriTerminusSchedules:)
    func coverageRegionUriTerminusSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.terminusSchedulesApi.getCoverageRegionUriTerminusSchedules(region: anyToString(params["region"]), uri: anyToString(params["uri"]), filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(terminusSchedules:)
    func terminusSchedules(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.terminusSchedulesApi.getTerminusSchedules(filter: anyToString(params["filter"]), fromDatetime: anyToDateTime(params["fromDatetime"]), untilDatetime: anyToDateTime(params["untilDatetime"]), duration: anyToInt(params["duration"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), maxDateTimes: anyToInt(params["maxDateTimes"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), calendar: anyToString(params["calendar"]), distance: anyToInt(params["distance"]), showCodes: anyToBool(params["showCodes"]), dataFreshness: anyToString(params["dataFreshness"]), itemsPerSchedule: anyToInt(params["itemsPerSchedule"]), disableGeojson: anyToBool(params["disableGeojson"]), directionType: anyToString(params["directionType"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatTrafficReports:)
    func coverageLonLatTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.trafficReportApi.getCoverageLonLatTrafficReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriTrafficReports:)
    func coverageLonLatUriTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.trafficReportApi.getCoverageLonLatUriTrafficReports(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionTrafficReports:)
    func coverageRegionTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.trafficReportApi.getCoverageRegionTrafficReports(region: anyToString(params["region"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriTrafficReports:)
    func coverageRegionUriTrafficReports(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.trafficReportApi.getCoverageRegionUriTrafficReports(region: anyToString(params["region"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), startPage: anyToInt(params["startPage"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), distance: anyToInt(params["distance"]), disableGeojson: anyToBool(params["disableGeojson"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatTrips:)
    func coverageLonLatTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageLonLatTrips(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatTripsId:)
    func coverageLonLatTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageLonLatTripsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriTrips:)
    func coverageLonLatUriTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageLonLatUriTrips(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriTripsId:)
    func coverageLonLatUriTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageLonLatUriTripsId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionTrips:)
    func coverageRegionTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageRegionTrips(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionTripsId:)
    func coverageRegionTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageRegionTripsId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriTrips:)
    func coverageRegionUriTrips(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageRegionUriTrips(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriTripsId:)
    func coverageRegionUriTripsId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.tripsApi.getCoverageRegionUriTripsId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriVehicleJourneys:)
    func coverageLonLatUriVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageLonLatUriVehicleJourneys(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriVehicleJourneysId:)
    func coverageLonLatUriVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageLonLatUriVehicleJourneysId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatVehicleJourneys:)
    func coverageLonLatVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageLonLatVehicleJourneys(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatVehicleJourneysId:)
    func coverageLonLatVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageLonLatVehicleJourneysId(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriVehicleJourneys:)
    func coverageRegionUriVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageRegionUriVehicleJourneys(region: anyToString(params["region"]), uri: anyToString(params["uri"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriVehicleJourneysId:)
    func coverageRegionUriVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageRegionUriVehicleJourneysId(region: anyToString(params["region"]), uri: anyToString(params["uri"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionVehicleJourneys:)
    func coverageRegionVehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageRegionVehicleJourneys(region: anyToString(params["region"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionVehicleJourneysId:)
    func coverageRegionVehicleJourneysId(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getCoverageRegionVehicleJourneysId(region: anyToString(params["region"]), id: anyToString(params["id"]), startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(vehicleJourneys:)
    func vehicleJourneys(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehicleJourneysApi.getVehicleJourneys(startPage: anyToInt(params["startPage"]), count: anyToInt(params["count"]), depth: anyToInt(params["depth"]), forbiddenId: arrayToStringDict(params["forbiddenId"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"]), externalCode: anyToString(params["externalCode"]), headsign: anyToString(params["headsign"]), showCodes: anyToBool(params["showCodes"]), odtLevel: anyToString(params["odtLevel"]), dataFreshness: anyToString(params["dataFreshness"]), distance: anyToInt(params["distance"]), since: anyToDateTime(params["since"]), until: anyToDateTime(params["until"]), disableGeojson: anyToBool(params["disableGeojson"]), disableDisruption: anyToBool(params["disableDisruption"]), filter: anyToString(params["filter"]), tags: arrayToStringDict(params["tags"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordLonLatVehiclePositions:)
    func coordLonLatVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoordLonLatVehiclePositions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coordsLonLatVehiclePositions:)
    func coordsLonLatVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoordsLonLatVehiclePositions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatUriVehiclePositions:)
    func coverageLonLatUriVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoverageLonLatUriVehiclePositions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageLonLatVehiclePositions:)
    func coverageLonLatVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoverageLonLatVehiclePositions(lat: anyToDouble(params["lat"]), lon: anyToDouble(params["lon"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionUriVehiclePositions:)
    func coverageRegionUriVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoverageRegionUriVehiclePositions(region: anyToString(params["region"]), uri: anyToString(params["uri"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
    @objc(coverageRegionVehiclePositions:)
    func coverageRegionVehiclePositions(command: CDVInvokedUrlCommand) {
        let params = command.arguments[0] as? [String : Any]
        guard let params = params,
                params.count > 0,
                let commandDelegate = self.commandDelegate else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Wrong parameters")
            commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )
            return
        }

        Expert.shared.vehiclePositionsApi.getCoverageRegionVehiclePositions(region: anyToString(params["region"]), depth: anyToInt(params["depth"]), count: anyToInt(params["count"]), filter: anyToString(params["filter"]), startPage: anyToInt(params["startPage"]), forbiddenUris: arrayToStringDict(params["forbiddenUris"])) { results, data, error in
            guard error == nil, let jsonData = data else {
                if let expertApiError = error {
                    NSLog(String(format: "SDK journeys fail with error %@", expertApiError.localizedDescription))
                    let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: expertApiError.localizedDescription)
                    commandDelegate.send(pluginResult, callbackId: command.callbackId)
                }
                return
            }
            
            var pluginResult: CDVPluginResult? = nil
            do {
                let jsonResults = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: jsonResults)
            } catch {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
            }

            commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
}
