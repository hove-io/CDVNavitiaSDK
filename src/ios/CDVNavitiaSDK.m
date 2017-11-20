#import "CDVNavitiaSDK.h"
#import <Cordova/CDV.h>

@implementation CDVNavitiaSDK

- (void)init:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];
    
    if ([token isKindOfClass:[NSNull class]] || [token length] == 0) {
        NSString* errorMessage = @"No token provided";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
    } else {
        NavitiaConfiguration *conf =  [[NavitiaConfiguration alloc] initWithToken:token];
        self.sdk = [[NavitiaSDK alloc] initWithConfiguration:conf];
        NSString* successMessage = @"SDK initialized";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"%@ %@", successMessage, token]];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)coverageRegionCalendars:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CalendarsApi *api = [self.sdk calendarsApi];
        CoverageRegionCalendarsRequestBuilder *queryBuilder = [api newCoverageRegionCalendarsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"startDate"]) {
            [queryBuilder withStartDate:(NSString*)[params objectForKey:@"startDate"]];
        }
        if ([params objectForKey:@"endDate"]) {
            [queryBuilder withEndDate:(NSString*)[params objectForKey:@"endDate"]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCalendars with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCalendars fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionCalendarsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CalendarsApi *api = [self.sdk calendarsApi];
        CoverageRegionCalendarsIdRequestBuilder *queryBuilder = [api newCoverageRegionCalendarsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"startDate"]) {
            [queryBuilder withStartDate:(NSString*)[params objectForKey:@"startDate"]];
        }
        if ([params objectForKey:@"endDate"]) {
            [queryBuilder withEndDate:(NSString*)[params objectForKey:@"endDate"]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCalendarsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCalendarsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriCalendars:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CalendarsApi *api = [self.sdk calendarsApi];
        CoverageRegionUriCalendarsRequestBuilder *queryBuilder = [api newCoverageRegionUriCalendarsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"startDate"]) {
            [queryBuilder withStartDate:(NSString*)[params objectForKey:@"startDate"]];
        }
        if ([params objectForKey:@"endDate"]) {
            [queryBuilder withEndDate:(NSString*)[params objectForKey:@"endDate"]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriCalendars with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriCalendars fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatCommercialModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageLonLatCommercialModesRequestBuilder *queryBuilder = [api newCoverageLonLatCommercialModesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatCommercialModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatCommercialModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatCommercialModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageLonLatCommercialModesIdRequestBuilder *queryBuilder = [api newCoverageLonLatCommercialModesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatCommercialModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatCommercialModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriCommercialModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageLonLatUriCommercialModesRequestBuilder *queryBuilder = [api newCoverageLonLatUriCommercialModesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriCommercialModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriCommercialModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriCommercialModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageLonLatUriCommercialModesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriCommercialModesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriCommercialModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriCommercialModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionCommercialModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageRegionCommercialModesRequestBuilder *queryBuilder = [api newCoverageRegionCommercialModesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCommercialModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCommercialModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionCommercialModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageRegionCommercialModesIdRequestBuilder *queryBuilder = [api newCoverageRegionCommercialModesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCommercialModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCommercialModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriCommercialModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageRegionUriCommercialModesRequestBuilder *queryBuilder = [api newCoverageRegionUriCommercialModesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriCommercialModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriCommercialModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriCommercialModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CommercialModesApi *api = [self.sdk commercialModesApi];
        CoverageRegionUriCommercialModesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriCommercialModesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriCommercialModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriCommercialModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatCompanies:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageLonLatCompaniesRequestBuilder *queryBuilder = [api newCoverageLonLatCompaniesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatCompanies with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatCompanies fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatCompaniesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageLonLatCompaniesIdRequestBuilder *queryBuilder = [api newCoverageLonLatCompaniesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatCompaniesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatCompaniesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriCompanies:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageLonLatUriCompaniesRequestBuilder *queryBuilder = [api newCoverageLonLatUriCompaniesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriCompanies with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriCompanies fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriCompaniesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageLonLatUriCompaniesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriCompaniesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriCompaniesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriCompaniesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionCompanies:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageRegionCompaniesRequestBuilder *queryBuilder = [api newCoverageRegionCompaniesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCompanies with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCompanies fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionCompaniesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageRegionCompaniesIdRequestBuilder *queryBuilder = [api newCoverageRegionCompaniesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionCompaniesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionCompaniesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriCompanies:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageRegionUriCompaniesRequestBuilder *queryBuilder = [api newCoverageRegionUriCompaniesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriCompanies with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriCompanies fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriCompaniesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CompaniesApi *api = [self.sdk companiesApi];
        CoverageRegionUriCompaniesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriCompaniesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriCompaniesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriCompaniesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatContributors:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageLonLatContributorsRequestBuilder *queryBuilder = [api newCoverageLonLatContributorsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatContributors with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatContributors fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatContributorsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageLonLatContributorsIdRequestBuilder *queryBuilder = [api newCoverageLonLatContributorsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatContributorsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatContributorsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriContributors:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageLonLatUriContributorsRequestBuilder *queryBuilder = [api newCoverageLonLatUriContributorsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriContributors with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriContributors fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriContributorsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageLonLatUriContributorsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriContributorsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriContributorsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriContributorsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionContributors:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageRegionContributorsRequestBuilder *queryBuilder = [api newCoverageRegionContributorsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionContributors with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionContributors fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionContributorsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageRegionContributorsIdRequestBuilder *queryBuilder = [api newCoverageRegionContributorsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionContributorsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionContributorsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriContributors:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageRegionUriContributorsRequestBuilder *queryBuilder = [api newCoverageRegionUriContributorsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriContributors with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriContributors fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriContributorsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        ContributorsApi *api = [self.sdk contributorsApi];
        CoverageRegionUriContributorsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriContributorsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriContributorsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriContributorsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverage:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CoverageApi *api = [self.sdk coverageApi];
        CoverageRequestBuilder *queryBuilder = [api newCoverageRequestBuilder];

        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverage with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverage fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLat:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CoverageApi *api = [self.sdk coverageApi];
        CoverageLonLatRequestBuilder *queryBuilder = [api newCoverageLonLatRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLat with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLat fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegion:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CoverageApi *api = [self.sdk coverageApi];
        CoverageRegionRequestBuilder *queryBuilder = [api newCoverageRegionRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegion with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegion fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatDatasets:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageLonLatDatasetsRequestBuilder *queryBuilder = [api newCoverageLonLatDatasetsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatDatasets with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatDatasets fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatDatasetsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageLonLatDatasetsIdRequestBuilder *queryBuilder = [api newCoverageLonLatDatasetsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatDatasetsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatDatasetsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriDatasets:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageLonLatUriDatasetsRequestBuilder *queryBuilder = [api newCoverageLonLatUriDatasetsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriDatasets with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriDatasets fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriDatasetsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageLonLatUriDatasetsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriDatasetsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriDatasetsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriDatasetsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionDatasets:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageRegionDatasetsRequestBuilder *queryBuilder = [api newCoverageRegionDatasetsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionDatasets with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionDatasets fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionDatasetsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageRegionDatasetsIdRequestBuilder *queryBuilder = [api newCoverageRegionDatasetsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionDatasetsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionDatasetsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriDatasets:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageRegionUriDatasetsRequestBuilder *queryBuilder = [api newCoverageRegionUriDatasetsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriDatasets with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriDatasets fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriDatasetsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DatasetsApi *api = [self.sdk datasetsApi];
        CoverageRegionUriDatasetsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriDatasetsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriDatasetsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriDatasetsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatDisruptions:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageLonLatDisruptionsRequestBuilder *queryBuilder = [api newCoverageLonLatDisruptionsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatDisruptions with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatDisruptions fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatDisruptionsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageLonLatDisruptionsIdRequestBuilder *queryBuilder = [api newCoverageLonLatDisruptionsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatDisruptionsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatDisruptionsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriDisruptions:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageLonLatUriDisruptionsRequestBuilder *queryBuilder = [api newCoverageLonLatUriDisruptionsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriDisruptions with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriDisruptions fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriDisruptionsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageLonLatUriDisruptionsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriDisruptionsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriDisruptionsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriDisruptionsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionDisruptions:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageRegionDisruptionsRequestBuilder *queryBuilder = [api newCoverageRegionDisruptionsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionDisruptions with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionDisruptions fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionDisruptionsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageRegionDisruptionsIdRequestBuilder *queryBuilder = [api newCoverageRegionDisruptionsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionDisruptionsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionDisruptionsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriDisruptions:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageRegionUriDisruptionsRequestBuilder *queryBuilder = [api newCoverageRegionUriDisruptionsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriDisruptions with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriDisruptions fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriDisruptionsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        DisruptionsApi *api = [self.sdk disruptionsApi];
        CoverageRegionUriDisruptionsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriDisruptionsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriDisruptionsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriDisruptionsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionGeoStatus:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        GeoStatusApi *api = [self.sdk geoStatusApi];
        CoverageRegionGeoStatusRequestBuilder *queryBuilder = [api newCoverageRegionGeoStatusRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionGeoStatus with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionGeoStatus fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionIsochrones:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        GraphicalIsochroneApi *api = [self.sdk graphicalIsochroneApi];
        CoverageRegionIsochronesRequestBuilder *queryBuilder = [api newCoverageRegionIsochronesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"to"]) {
            [queryBuilder withTo:(NSString*)[params objectForKey:@"to"]];
        }
        if ([params objectForKey:@"datetime"]) {
            [queryBuilder withDatetime:(NSString*)[params objectForKey:@"datetime"]];
        }
        if ([params objectForKey:@"datetimeRepresents"]) {
            [queryBuilder withDatetimeRepresents:(NSString*)[params objectForKey:@"datetimeRepresents"]];
        }
        if ([params objectForKey:@"maxNbTransfers"]) {
            [queryBuilder withMaxNbTransfers:[[params objectForKey:@"maxNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"minNbTransfers"]) {
            [queryBuilder withMinNbTransfers:[[params objectForKey:@"minNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"firstSectionMode"]) {
            [queryBuilder withFirstSectionMode:(NSArray*)[params objectForKey:@"firstSectionMode"]];
        }
        if ([params objectForKey:@"lastSectionMode"]) {
            [queryBuilder withLastSectionMode:(NSArray*)[params objectForKey:@"lastSectionMode"]];
        }
        if ([params objectForKey:@"maxDurationToPt"]) {
            [queryBuilder withMaxDurationToPt:[[params objectForKey:@"maxDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxWalkingDurationToPt"]) {
            [queryBuilder withMaxWalkingDurationToPt:[[params objectForKey:@"maxWalkingDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBikeDurationToPt"]) {
            [queryBuilder withMaxBikeDurationToPt:[[params objectForKey:@"maxBikeDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBssDurationToPt"]) {
            [queryBuilder withMaxBssDurationToPt:[[params objectForKey:@"maxBssDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxCarDurationToPt"]) {
            [queryBuilder withMaxCarDurationToPt:[[params objectForKey:@"maxCarDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"walkingSpeed"]) {
            [queryBuilder withWalkingSpeed:[[params objectForKey:@"walkingSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bikeSpeed"]) {
            [queryBuilder withBikeSpeed:[[params objectForKey:@"bikeSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bssSpeed"]) {
            [queryBuilder withBssSpeed:[[params objectForKey:@"bssSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"carSpeed"]) {
            [queryBuilder withCarSpeed:[[params objectForKey:@"carSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"allowedId"]) {
            [queryBuilder withAllowedId:(NSArray*)[params objectForKey:@"allowedId"]];
        }
        if ([params objectForKey:@"disruptionActive"]) {
            [queryBuilder withDisruptionActive:(NSNumber*)[params objectForKey:@"disruptionActive"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"maxDuration"]) {
            [queryBuilder withMaxDuration:[[params objectForKey:@"maxDuration"] integerValue]];
        }
        if ([params objectForKey:@"wheelchair"]) {
            [queryBuilder withWheelchair:(NSNumber*)[params objectForKey:@"wheelchair"]];
        }
        if ([params objectForKey:@"travelerType"]) {
            [queryBuilder withTravelerType:(NSString*)[params objectForKey:@"travelerType"]];
        }
        if ([params objectForKey:@"directPath"]) {
            [queryBuilder withDirectPath:(NSString*)[params objectForKey:@"directPath"]];
        }
        if ([params objectForKey:@"minDuration"]) {
            [queryBuilder withMinDuration:[[params objectForKey:@"minDuration"] integerValue]];
        }
        if ([params objectForKey:@"boundaryDuration"]) {
            [queryBuilder withBoundaryDuration:(NSArray*)[params objectForKey:@"boundaryDuration"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionIsochrones with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionIsochrones fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionHeatMaps:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        HeatMapApi *api = [self.sdk heatMapApi];
        CoverageRegionHeatMapsRequestBuilder *queryBuilder = [api newCoverageRegionHeatMapsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"to"]) {
            [queryBuilder withTo:(NSString*)[params objectForKey:@"to"]];
        }
        if ([params objectForKey:@"datetime"]) {
            [queryBuilder withDatetime:(NSString*)[params objectForKey:@"datetime"]];
        }
        if ([params objectForKey:@"datetimeRepresents"]) {
            [queryBuilder withDatetimeRepresents:(NSString*)[params objectForKey:@"datetimeRepresents"]];
        }
        if ([params objectForKey:@"maxNbTransfers"]) {
            [queryBuilder withMaxNbTransfers:[[params objectForKey:@"maxNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"minNbTransfers"]) {
            [queryBuilder withMinNbTransfers:[[params objectForKey:@"minNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"firstSectionMode"]) {
            [queryBuilder withFirstSectionMode:(NSArray*)[params objectForKey:@"firstSectionMode"]];
        }
        if ([params objectForKey:@"lastSectionMode"]) {
            [queryBuilder withLastSectionMode:(NSArray*)[params objectForKey:@"lastSectionMode"]];
        }
        if ([params objectForKey:@"maxDurationToPt"]) {
            [queryBuilder withMaxDurationToPt:[[params objectForKey:@"maxDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxWalkingDurationToPt"]) {
            [queryBuilder withMaxWalkingDurationToPt:[[params objectForKey:@"maxWalkingDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBikeDurationToPt"]) {
            [queryBuilder withMaxBikeDurationToPt:[[params objectForKey:@"maxBikeDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBssDurationToPt"]) {
            [queryBuilder withMaxBssDurationToPt:[[params objectForKey:@"maxBssDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxCarDurationToPt"]) {
            [queryBuilder withMaxCarDurationToPt:[[params objectForKey:@"maxCarDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"walkingSpeed"]) {
            [queryBuilder withWalkingSpeed:[[params objectForKey:@"walkingSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bikeSpeed"]) {
            [queryBuilder withBikeSpeed:[[params objectForKey:@"bikeSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bssSpeed"]) {
            [queryBuilder withBssSpeed:[[params objectForKey:@"bssSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"carSpeed"]) {
            [queryBuilder withCarSpeed:[[params objectForKey:@"carSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"allowedId"]) {
            [queryBuilder withAllowedId:(NSArray*)[params objectForKey:@"allowedId"]];
        }
        if ([params objectForKey:@"disruptionActive"]) {
            [queryBuilder withDisruptionActive:(NSNumber*)[params objectForKey:@"disruptionActive"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"maxDuration"]) {
            [queryBuilder withMaxDuration:[[params objectForKey:@"maxDuration"] integerValue]];
        }
        if ([params objectForKey:@"wheelchair"]) {
            [queryBuilder withWheelchair:(NSNumber*)[params objectForKey:@"wheelchair"]];
        }
        if ([params objectForKey:@"travelerType"]) {
            [queryBuilder withTravelerType:(NSString*)[params objectForKey:@"travelerType"]];
        }
        if ([params objectForKey:@"directPath"]) {
            [queryBuilder withDirectPath:(NSString*)[params objectForKey:@"directPath"]];
        }
        if ([params objectForKey:@"resolution"]) {
            [queryBuilder withResolution:[[params objectForKey:@"resolution"] integerValue]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionHeatMaps with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionHeatMaps fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatJourneyPatternPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageLonLatJourneyPatternPointsRequestBuilder *queryBuilder = [api newCoverageLonLatJourneyPatternPointsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatJourneyPatternPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatJourneyPatternPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatJourneyPatternPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageLonLatJourneyPatternPointsIdRequestBuilder *queryBuilder = [api newCoverageLonLatJourneyPatternPointsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatJourneyPatternPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatJourneyPatternPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriJourneyPatternPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageLonLatUriJourneyPatternPointsRequestBuilder *queryBuilder = [api newCoverageLonLatUriJourneyPatternPointsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriJourneyPatternPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriJourneyPatternPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriJourneyPatternPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageLonLatUriJourneyPatternPointsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriJourneyPatternPointsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriJourneyPatternPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriJourneyPatternPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionJourneyPatternPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageRegionJourneyPatternPointsRequestBuilder *queryBuilder = [api newCoverageRegionJourneyPatternPointsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionJourneyPatternPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionJourneyPatternPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionJourneyPatternPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageRegionJourneyPatternPointsIdRequestBuilder *queryBuilder = [api newCoverageRegionJourneyPatternPointsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionJourneyPatternPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionJourneyPatternPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriJourneyPatternPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageRegionUriJourneyPatternPointsRequestBuilder *queryBuilder = [api newCoverageRegionUriJourneyPatternPointsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriJourneyPatternPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriJourneyPatternPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriJourneyPatternPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternPointsApi *api = [self.sdk journeyPatternPointsApi];
        CoverageRegionUriJourneyPatternPointsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriJourneyPatternPointsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriJourneyPatternPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriJourneyPatternPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatJourneyPatterns:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageLonLatJourneyPatternsRequestBuilder *queryBuilder = [api newCoverageLonLatJourneyPatternsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatJourneyPatterns with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatJourneyPatterns fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatJourneyPatternsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageLonLatJourneyPatternsIdRequestBuilder *queryBuilder = [api newCoverageLonLatJourneyPatternsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatJourneyPatternsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatJourneyPatternsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriJourneyPatterns:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageLonLatUriJourneyPatternsRequestBuilder *queryBuilder = [api newCoverageLonLatUriJourneyPatternsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriJourneyPatterns with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriJourneyPatterns fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriJourneyPatternsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageLonLatUriJourneyPatternsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriJourneyPatternsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriJourneyPatternsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriJourneyPatternsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionJourneyPatterns:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageRegionJourneyPatternsRequestBuilder *queryBuilder = [api newCoverageRegionJourneyPatternsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionJourneyPatterns with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionJourneyPatterns fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionJourneyPatternsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageRegionJourneyPatternsIdRequestBuilder *queryBuilder = [api newCoverageRegionJourneyPatternsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionJourneyPatternsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionJourneyPatternsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriJourneyPatterns:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageRegionUriJourneyPatternsRequestBuilder *queryBuilder = [api newCoverageRegionUriJourneyPatternsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriJourneyPatterns with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriJourneyPatterns fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriJourneyPatternsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneyPatternsApi *api = [self.sdk journeyPatternsApi];
        CoverageRegionUriJourneyPatternsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriJourneyPatternsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriJourneyPatternsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriJourneyPatternsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneysApi *api = [self.sdk journeysApi];
        CoverageLonLatJourneysRequestBuilder *queryBuilder = [api newCoverageLonLatJourneysRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"to"]) {
            [queryBuilder withTo:(NSString*)[params objectForKey:@"to"]];
        }
        if ([params objectForKey:@"datetime"]) {
            [queryBuilder withDatetime:(NSString*)[params objectForKey:@"datetime"]];
        }
        if ([params objectForKey:@"datetimeRepresents"]) {
            [queryBuilder withDatetimeRepresents:(NSString*)[params objectForKey:@"datetimeRepresents"]];
        }
        if ([params objectForKey:@"maxNbTransfers"]) {
            [queryBuilder withMaxNbTransfers:[[params objectForKey:@"maxNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"minNbTransfers"]) {
            [queryBuilder withMinNbTransfers:[[params objectForKey:@"minNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"firstSectionMode"]) {
            [queryBuilder withFirstSectionMode:(NSArray*)[params objectForKey:@"firstSectionMode"]];
        }
        if ([params objectForKey:@"lastSectionMode"]) {
            [queryBuilder withLastSectionMode:(NSArray*)[params objectForKey:@"lastSectionMode"]];
        }
        if ([params objectForKey:@"maxDurationToPt"]) {
            [queryBuilder withMaxDurationToPt:[[params objectForKey:@"maxDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxWalkingDurationToPt"]) {
            [queryBuilder withMaxWalkingDurationToPt:[[params objectForKey:@"maxWalkingDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBikeDurationToPt"]) {
            [queryBuilder withMaxBikeDurationToPt:[[params objectForKey:@"maxBikeDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBssDurationToPt"]) {
            [queryBuilder withMaxBssDurationToPt:[[params objectForKey:@"maxBssDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxCarDurationToPt"]) {
            [queryBuilder withMaxCarDurationToPt:[[params objectForKey:@"maxCarDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"walkingSpeed"]) {
            [queryBuilder withWalkingSpeed:[[params objectForKey:@"walkingSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bikeSpeed"]) {
            [queryBuilder withBikeSpeed:[[params objectForKey:@"bikeSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bssSpeed"]) {
            [queryBuilder withBssSpeed:[[params objectForKey:@"bssSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"carSpeed"]) {
            [queryBuilder withCarSpeed:[[params objectForKey:@"carSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"allowedId"]) {
            [queryBuilder withAllowedId:(NSArray*)[params objectForKey:@"allowedId"]];
        }
        if ([params objectForKey:@"disruptionActive"]) {
            [queryBuilder withDisruptionActive:(NSNumber*)[params objectForKey:@"disruptionActive"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"maxDuration"]) {
            [queryBuilder withMaxDuration:[[params objectForKey:@"maxDuration"] integerValue]];
        }
        if ([params objectForKey:@"wheelchair"]) {
            [queryBuilder withWheelchair:(NSNumber*)[params objectForKey:@"wheelchair"]];
        }
        if ([params objectForKey:@"travelerType"]) {
            [queryBuilder withTravelerType:(NSString*)[params objectForKey:@"travelerType"]];
        }
        if ([params objectForKey:@"directPath"]) {
            [queryBuilder withDirectPath:(NSString*)[params objectForKey:@"directPath"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"isJourneySchedules"]) {
            [queryBuilder withIsJourneySchedules:(NSNumber*)[params objectForKey:@"isJourneySchedules"]];
        }
        if ([params objectForKey:@"minNbJourneys"]) {
            [queryBuilder withMinNbJourneys:[[params objectForKey:@"minNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"maxNbJourneys"]) {
            [queryBuilder withMaxNbJourneys:[[params objectForKey:@"maxNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneysApi *api = [self.sdk journeysApi];
        CoverageRegionJourneysRequestBuilder *queryBuilder = [api newCoverageRegionJourneysRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"to"]) {
            [queryBuilder withTo:(NSString*)[params objectForKey:@"to"]];
        }
        if ([params objectForKey:@"datetime"]) {
            [queryBuilder withDatetime:(NSString*)[params objectForKey:@"datetime"]];
        }
        if ([params objectForKey:@"datetimeRepresents"]) {
            [queryBuilder withDatetimeRepresents:(NSString*)[params objectForKey:@"datetimeRepresents"]];
        }
        if ([params objectForKey:@"maxNbTransfers"]) {
            [queryBuilder withMaxNbTransfers:[[params objectForKey:@"maxNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"minNbTransfers"]) {
            [queryBuilder withMinNbTransfers:[[params objectForKey:@"minNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"firstSectionMode"]) {
            [queryBuilder withFirstSectionMode:(NSArray*)[params objectForKey:@"firstSectionMode"]];
        }
        if ([params objectForKey:@"lastSectionMode"]) {
            [queryBuilder withLastSectionMode:(NSArray*)[params objectForKey:@"lastSectionMode"]];
        }
        if ([params objectForKey:@"maxDurationToPt"]) {
            [queryBuilder withMaxDurationToPt:[[params objectForKey:@"maxDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxWalkingDurationToPt"]) {
            [queryBuilder withMaxWalkingDurationToPt:[[params objectForKey:@"maxWalkingDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBikeDurationToPt"]) {
            [queryBuilder withMaxBikeDurationToPt:[[params objectForKey:@"maxBikeDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBssDurationToPt"]) {
            [queryBuilder withMaxBssDurationToPt:[[params objectForKey:@"maxBssDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxCarDurationToPt"]) {
            [queryBuilder withMaxCarDurationToPt:[[params objectForKey:@"maxCarDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"walkingSpeed"]) {
            [queryBuilder withWalkingSpeed:[[params objectForKey:@"walkingSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bikeSpeed"]) {
            [queryBuilder withBikeSpeed:[[params objectForKey:@"bikeSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bssSpeed"]) {
            [queryBuilder withBssSpeed:[[params objectForKey:@"bssSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"carSpeed"]) {
            [queryBuilder withCarSpeed:[[params objectForKey:@"carSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"allowedId"]) {
            [queryBuilder withAllowedId:(NSArray*)[params objectForKey:@"allowedId"]];
        }
        if ([params objectForKey:@"disruptionActive"]) {
            [queryBuilder withDisruptionActive:(NSNumber*)[params objectForKey:@"disruptionActive"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"maxDuration"]) {
            [queryBuilder withMaxDuration:[[params objectForKey:@"maxDuration"] integerValue]];
        }
        if ([params objectForKey:@"wheelchair"]) {
            [queryBuilder withWheelchair:(NSNumber*)[params objectForKey:@"wheelchair"]];
        }
        if ([params objectForKey:@"travelerType"]) {
            [queryBuilder withTravelerType:(NSString*)[params objectForKey:@"travelerType"]];
        }
        if ([params objectForKey:@"directPath"]) {
            [queryBuilder withDirectPath:(NSString*)[params objectForKey:@"directPath"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"isJourneySchedules"]) {
            [queryBuilder withIsJourneySchedules:(NSNumber*)[params objectForKey:@"isJourneySchedules"]];
        }
        if ([params objectForKey:@"minNbJourneys"]) {
            [queryBuilder withMinNbJourneys:[[params objectForKey:@"minNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"maxNbJourneys"]) {
            [queryBuilder withMaxNbJourneys:[[params objectForKey:@"maxNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)journeys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        JourneysApi *api = [self.sdk journeysApi];
        JourneysRequestBuilder *queryBuilder = [api newJourneysRequestBuilder];

        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"to"]) {
            [queryBuilder withTo:(NSString*)[params objectForKey:@"to"]];
        }
        if ([params objectForKey:@"datetime"]) {
            [queryBuilder withDatetime:(NSString*)[params objectForKey:@"datetime"]];
        }
        if ([params objectForKey:@"datetimeRepresents"]) {
            [queryBuilder withDatetimeRepresents:(NSString*)[params objectForKey:@"datetimeRepresents"]];
        }
        if ([params objectForKey:@"maxNbTransfers"]) {
            [queryBuilder withMaxNbTransfers:[[params objectForKey:@"maxNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"minNbTransfers"]) {
            [queryBuilder withMinNbTransfers:[[params objectForKey:@"minNbTransfers"] integerValue]];
        }
        if ([params objectForKey:@"firstSectionMode"]) {
            [queryBuilder withFirstSectionMode:(NSArray*)[params objectForKey:@"firstSectionMode"]];
        }
        if ([params objectForKey:@"lastSectionMode"]) {
            [queryBuilder withLastSectionMode:(NSArray*)[params objectForKey:@"lastSectionMode"]];
        }
        if ([params objectForKey:@"maxDurationToPt"]) {
            [queryBuilder withMaxDurationToPt:[[params objectForKey:@"maxDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxWalkingDurationToPt"]) {
            [queryBuilder withMaxWalkingDurationToPt:[[params objectForKey:@"maxWalkingDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBikeDurationToPt"]) {
            [queryBuilder withMaxBikeDurationToPt:[[params objectForKey:@"maxBikeDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxBssDurationToPt"]) {
            [queryBuilder withMaxBssDurationToPt:[[params objectForKey:@"maxBssDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"maxCarDurationToPt"]) {
            [queryBuilder withMaxCarDurationToPt:[[params objectForKey:@"maxCarDurationToPt"] integerValue]];
        }
        if ([params objectForKey:@"walkingSpeed"]) {
            [queryBuilder withWalkingSpeed:[[params objectForKey:@"walkingSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bikeSpeed"]) {
            [queryBuilder withBikeSpeed:[[params objectForKey:@"bikeSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"bssSpeed"]) {
            [queryBuilder withBssSpeed:[[params objectForKey:@"bssSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"carSpeed"]) {
            [queryBuilder withCarSpeed:[[params objectForKey:@"carSpeed"] doubleValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"allowedId"]) {
            [queryBuilder withAllowedId:(NSArray*)[params objectForKey:@"allowedId"]];
        }
        if ([params objectForKey:@"disruptionActive"]) {
            [queryBuilder withDisruptionActive:(NSNumber*)[params objectForKey:@"disruptionActive"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"maxDuration"]) {
            [queryBuilder withMaxDuration:[[params objectForKey:@"maxDuration"] integerValue]];
        }
        if ([params objectForKey:@"wheelchair"]) {
            [queryBuilder withWheelchair:(NSNumber*)[params objectForKey:@"wheelchair"]];
        }
        if ([params objectForKey:@"travelerType"]) {
            [queryBuilder withTravelerType:(NSString*)[params objectForKey:@"travelerType"]];
        }
        if ([params objectForKey:@"directPath"]) {
            [queryBuilder withDirectPath:(NSString*)[params objectForKey:@"directPath"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"isJourneySchedules"]) {
            [queryBuilder withIsJourneySchedules:(NSNumber*)[params objectForKey:@"isJourneySchedules"]];
        }
        if ([params objectForKey:@"minNbJourneys"]) {
            [queryBuilder withMinNbJourneys:[[params objectForKey:@"minNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"maxNbJourneys"]) {
            [queryBuilder withMaxNbJourneys:[[params objectForKey:@"maxNbJourneys"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK journeys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK journeys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatLineGroups:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageLonLatLineGroupsRequestBuilder *queryBuilder = [api newCoverageLonLatLineGroupsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatLineGroups with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatLineGroups fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatLineGroupsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageLonLatLineGroupsIdRequestBuilder *queryBuilder = [api newCoverageLonLatLineGroupsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatLineGroupsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatLineGroupsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriLineGroups:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageLonLatUriLineGroupsRequestBuilder *queryBuilder = [api newCoverageLonLatUriLineGroupsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriLineGroups with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriLineGroups fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriLineGroupsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageLonLatUriLineGroupsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriLineGroupsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriLineGroupsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriLineGroupsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionLineGroups:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageRegionLineGroupsRequestBuilder *queryBuilder = [api newCoverageRegionLineGroupsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionLineGroups with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionLineGroups fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionLineGroupsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageRegionLineGroupsIdRequestBuilder *queryBuilder = [api newCoverageRegionLineGroupsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionLineGroupsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionLineGroupsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriLineGroups:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageRegionUriLineGroupsRequestBuilder *queryBuilder = [api newCoverageRegionUriLineGroupsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriLineGroups with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriLineGroups fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriLineGroupsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        CoverageRegionUriLineGroupsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriLineGroupsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriLineGroupsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriLineGroupsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)lineGroups:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineGroupsApi *api = [self.sdk lineGroupsApi];
        LineGroupsRequestBuilder *queryBuilder = [api newLineGroupsRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK lineGroups with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK lineGroups fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionLineReports:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineReportsApi *api = [self.sdk lineReportsApi];
        CoverageRegionLineReportsRequestBuilder *queryBuilder = [api newCoverageRegionLineReportsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionLineReports with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionLineReports fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriLineReports:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LineReportsApi *api = [self.sdk lineReportsApi];
        CoverageRegionUriLineReportsRequestBuilder *queryBuilder = [api newCoverageRegionUriLineReportsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriLineReports with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriLineReports fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatLines:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageLonLatLinesRequestBuilder *queryBuilder = [api newCoverageLonLatLinesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatLines with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatLines fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatLinesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageLonLatLinesIdRequestBuilder *queryBuilder = [api newCoverageLonLatLinesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatLinesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatLinesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriLines:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageLonLatUriLinesRequestBuilder *queryBuilder = [api newCoverageLonLatUriLinesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriLines with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriLines fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriLinesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageLonLatUriLinesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriLinesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriLinesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriLinesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionLines:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageRegionLinesRequestBuilder *queryBuilder = [api newCoverageRegionLinesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionLines with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionLines fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionLinesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageRegionLinesIdRequestBuilder *queryBuilder = [api newCoverageRegionLinesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionLinesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionLinesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriLines:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageRegionUriLinesRequestBuilder *queryBuilder = [api newCoverageRegionUriLinesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriLines with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriLines fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriLinesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        CoverageRegionUriLinesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriLinesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriLinesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriLinesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)lines:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        LinesApi *api = [self.sdk linesApi];
        LinesRequestBuilder *queryBuilder = [api newLinesRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK lines with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK lines fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatNetworks:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageLonLatNetworksRequestBuilder *queryBuilder = [api newCoverageLonLatNetworksRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatNetworks with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatNetworks fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatNetworksId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageLonLatNetworksIdRequestBuilder *queryBuilder = [api newCoverageLonLatNetworksIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatNetworksId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatNetworksId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriNetworks:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageLonLatUriNetworksRequestBuilder *queryBuilder = [api newCoverageLonLatUriNetworksRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriNetworks with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriNetworks fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriNetworksId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageLonLatUriNetworksIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriNetworksIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriNetworksId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriNetworksId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionNetworks:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageRegionNetworksRequestBuilder *queryBuilder = [api newCoverageRegionNetworksRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionNetworks with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionNetworks fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionNetworksId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageRegionNetworksIdRequestBuilder *queryBuilder = [api newCoverageRegionNetworksIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionNetworksId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionNetworksId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriNetworks:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageRegionUriNetworksRequestBuilder *queryBuilder = [api newCoverageRegionUriNetworksRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriNetworks with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriNetworks fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriNetworksId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        CoverageRegionUriNetworksIdRequestBuilder *queryBuilder = [api newCoverageRegionUriNetworksIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriNetworksId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriNetworksId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)networks:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NetworksApi *api = [self.sdk networksApi];
        NetworksRequestBuilder *queryBuilder = [api newNetworksRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK networks with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK networks fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatArrivals:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextArrivalsApi *api = [self.sdk nextArrivalsApi];
        CoverageLonLatArrivalsRequestBuilder *queryBuilder = [api newCoverageLonLatArrivalsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatArrivals with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatArrivals fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriArrivals:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextArrivalsApi *api = [self.sdk nextArrivalsApi];
        CoverageLonLatUriArrivalsRequestBuilder *queryBuilder = [api newCoverageLonLatUriArrivalsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriArrivals with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriArrivals fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionArrivals:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextArrivalsApi *api = [self.sdk nextArrivalsApi];
        CoverageRegionArrivalsRequestBuilder *queryBuilder = [api newCoverageRegionArrivalsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionArrivals with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionArrivals fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriArrivals:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextArrivalsApi *api = [self.sdk nextArrivalsApi];
        CoverageRegionUriArrivalsRequestBuilder *queryBuilder = [api newCoverageRegionUriArrivalsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriArrivals with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriArrivals fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatDepartures:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextDeparturesApi *api = [self.sdk nextDeparturesApi];
        CoverageLonLatDeparturesRequestBuilder *queryBuilder = [api newCoverageLonLatDeparturesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatDepartures with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatDepartures fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriDepartures:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextDeparturesApi *api = [self.sdk nextDeparturesApi];
        CoverageLonLatUriDeparturesRequestBuilder *queryBuilder = [api newCoverageLonLatUriDeparturesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriDepartures with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriDepartures fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionDepartures:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextDeparturesApi *api = [self.sdk nextDeparturesApi];
        CoverageRegionDeparturesRequestBuilder *queryBuilder = [api newCoverageRegionDeparturesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionDepartures with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionDepartures fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriDepartures:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        NextDeparturesApi *api = [self.sdk nextDeparturesApi];
        CoverageRegionUriDeparturesRequestBuilder *queryBuilder = [api newCoverageRegionUriDeparturesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriDepartures with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriDepartures fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPhysicalModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageLonLatPhysicalModesRequestBuilder *queryBuilder = [api newCoverageLonLatPhysicalModesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPhysicalModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPhysicalModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPhysicalModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageLonLatPhysicalModesIdRequestBuilder *queryBuilder = [api newCoverageLonLatPhysicalModesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPhysicalModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPhysicalModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPhysicalModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageLonLatUriPhysicalModesRequestBuilder *queryBuilder = [api newCoverageLonLatUriPhysicalModesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPhysicalModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPhysicalModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPhysicalModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageLonLatUriPhysicalModesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriPhysicalModesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPhysicalModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPhysicalModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPhysicalModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageRegionPhysicalModesRequestBuilder *queryBuilder = [api newCoverageRegionPhysicalModesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPhysicalModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPhysicalModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPhysicalModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageRegionPhysicalModesIdRequestBuilder *queryBuilder = [api newCoverageRegionPhysicalModesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPhysicalModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPhysicalModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPhysicalModes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageRegionUriPhysicalModesRequestBuilder *queryBuilder = [api newCoverageRegionUriPhysicalModesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPhysicalModes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPhysicalModes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPhysicalModesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PhysicalModesApi *api = [self.sdk physicalModesApi];
        CoverageRegionUriPhysicalModesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriPhysicalModesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPhysicalModesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPhysicalModesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPlaces:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesApi *api = [self.sdk placesApi];
        CoverageLonLatPlacesRequestBuilder *queryBuilder = [api newCoverageLonLatPlacesRequestBuilder];

        if ([params objectForKey:@"q"]) {
            [queryBuilder withQ:(NSString*)[params objectForKey:@"q"]];
        }
        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"adminUri"]) {
            [queryBuilder withAdminUri:(NSArray*)[params objectForKey:@"adminUri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"shape"]) {
            [queryBuilder withShape:(NSString*)[params objectForKey:@"shape"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPlaces with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPlaces fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPlaces:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesApi *api = [self.sdk placesApi];
        CoverageRegionPlacesRequestBuilder *queryBuilder = [api newCoverageRegionPlacesRequestBuilder];

        if ([params objectForKey:@"q"]) {
            [queryBuilder withQ:(NSString*)[params objectForKey:@"q"]];
        }
        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"adminUri"]) {
            [queryBuilder withAdminUri:(NSArray*)[params objectForKey:@"adminUri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"shape"]) {
            [queryBuilder withShape:(NSString*)[params objectForKey:@"shape"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPlaces with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPlaces fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)places:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesApi *api = [self.sdk placesApi];
        PlacesRequestBuilder *queryBuilder = [api newPlacesRequestBuilder];

        if ([params objectForKey:@"q"]) {
            [queryBuilder withQ:(NSString*)[params objectForKey:@"q"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"adminUri"]) {
            [queryBuilder withAdminUri:(NSArray*)[params objectForKey:@"adminUri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"from"]) {
            [queryBuilder withFrom:(NSString*)[params objectForKey:@"from"]];
        }
        if ([params objectForKey:@"shape"]) {
            [queryBuilder withShape:(NSString*)[params objectForKey:@"shape"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK places with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK places fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coordLonLatPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoordLonLatPlacesNearbyRequestBuilder *queryBuilder = [api newCoordLonLatPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coordLonLatPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coordLonLatPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coordsLonLatPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoordsLonLatPlacesNearbyRequestBuilder *queryBuilder = [api newCoordsLonLatPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coordsLonLatPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coordsLonLatPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoverageLonLatPlacesNearbyRequestBuilder *queryBuilder = [api newCoverageLonLatPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoverageLonLatUriPlacesNearbyRequestBuilder *queryBuilder = [api newCoverageLonLatUriPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoverageRegionPlacesNearbyRequestBuilder *queryBuilder = [api newCoverageRegionPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPlacesNearby:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PlacesNearbyApi *api = [self.sdk placesNearbyApi];
        CoverageRegionUriPlacesNearbyRequestBuilder *queryBuilder = [api newCoverageRegionUriPlacesNearbyRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPlacesNearby with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPlacesNearby fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPoiTypes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageLonLatPoiTypesRequestBuilder *queryBuilder = [api newCoverageLonLatPoiTypesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPoiTypes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPoiTypes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPoiTypesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageLonLatPoiTypesIdRequestBuilder *queryBuilder = [api newCoverageLonLatPoiTypesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPoiTypesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPoiTypesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPoiTypes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageLonLatUriPoiTypesRequestBuilder *queryBuilder = [api newCoverageLonLatUriPoiTypesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPoiTypes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPoiTypes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPoiTypesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageLonLatUriPoiTypesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriPoiTypesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPoiTypesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPoiTypesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPoiTypes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageRegionPoiTypesRequestBuilder *queryBuilder = [api newCoverageRegionPoiTypesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPoiTypes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPoiTypes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPoiTypesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageRegionPoiTypesIdRequestBuilder *queryBuilder = [api newCoverageRegionPoiTypesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPoiTypesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPoiTypesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPoiTypes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageRegionUriPoiTypesRequestBuilder *queryBuilder = [api newCoverageRegionUriPoiTypesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPoiTypes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPoiTypes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPoiTypesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoiTypesApi *api = [self.sdk poiTypesApi];
        CoverageRegionUriPoiTypesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriPoiTypesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPoiTypesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPoiTypesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPois:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageLonLatPoisRequestBuilder *queryBuilder = [api newCoverageLonLatPoisRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPois with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPois fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPoisId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageLonLatPoisIdRequestBuilder *queryBuilder = [api newCoverageLonLatPoisIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPoisId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPoisId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPois:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageLonLatUriPoisRequestBuilder *queryBuilder = [api newCoverageLonLatUriPoisRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPois with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPois fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriPoisId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageLonLatUriPoisIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriPoisIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriPoisId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriPoisId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPois:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageRegionPoisRequestBuilder *queryBuilder = [api newCoverageRegionPoisRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPois with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPois fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPoisId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageRegionPoisIdRequestBuilder *queryBuilder = [api newCoverageRegionPoisIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPoisId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPoisId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPois:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageRegionUriPoisRequestBuilder *queryBuilder = [api newCoverageRegionUriPoisRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPois with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPois fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriPoisId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PoisApi *api = [self.sdk poisApi];
        CoverageRegionUriPoisIdRequestBuilder *queryBuilder = [api newCoverageRegionUriPoisIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }
        if ([params objectForKey:@"bssStands"]) {
            [queryBuilder withBssStands:(NSNumber*)[params objectForKey:@"bssStands"]];
        }
        if ([params objectForKey:@"addPoiInfos"]) {
            [queryBuilder withAddPoiInfos:(NSArray*)[params objectForKey:@"addPoiInfos"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriPoisId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriPoisId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatPtObjects:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PtobjectsApi *api = [self.sdk ptobjectsApi];
        CoverageLonLatPtObjectsRequestBuilder *queryBuilder = [api newCoverageLonLatPtObjectsRequestBuilder];

        if ([params objectForKey:@"q"]) {
            [queryBuilder withQ:(NSString*)[params objectForKey:@"q"]];
        }
        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"adminUri"]) {
            [queryBuilder withAdminUri:(NSArray*)[params objectForKey:@"adminUri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatPtObjects with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatPtObjects fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionPtObjects:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        PtobjectsApi *api = [self.sdk ptobjectsApi];
        CoverageRegionPtObjectsRequestBuilder *queryBuilder = [api newCoverageRegionPtObjectsRequestBuilder];

        if ([params objectForKey:@"q"]) {
            [queryBuilder withQ:(NSString*)[params objectForKey:@"q"]];
        }
        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"type"]) {
            [queryBuilder withType:(NSArray*)[params objectForKey:@"type"]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"adminUri"]) {
            [queryBuilder withAdminUri:(NSArray*)[params objectForKey:@"adminUri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionPtObjects with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionPtObjects fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriRouteSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RouteSchedulesApi *api = [self.sdk routeSchedulesApi];
        CoverageLonLatUriRouteSchedulesRequestBuilder *queryBuilder = [api newCoverageLonLatUriRouteSchedulesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriRouteSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriRouteSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriRouteSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RouteSchedulesApi *api = [self.sdk routeSchedulesApi];
        CoverageRegionUriRouteSchedulesRequestBuilder *queryBuilder = [api newCoverageRegionUriRouteSchedulesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriRouteSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriRouteSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)routeSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RouteSchedulesApi *api = [self.sdk routeSchedulesApi];
        RouteSchedulesRequestBuilder *queryBuilder = [api newRouteSchedulesRequestBuilder];

        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK routeSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK routeSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatRoutes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageLonLatRoutesRequestBuilder *queryBuilder = [api newCoverageLonLatRoutesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatRoutes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatRoutes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatRoutesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageLonLatRoutesIdRequestBuilder *queryBuilder = [api newCoverageLonLatRoutesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatRoutesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatRoutesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriRoutes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageLonLatUriRoutesRequestBuilder *queryBuilder = [api newCoverageLonLatUriRoutesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriRoutes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriRoutes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriRoutesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageLonLatUriRoutesIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriRoutesIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriRoutesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriRoutesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionRoutes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageRegionRoutesRequestBuilder *queryBuilder = [api newCoverageRegionRoutesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionRoutes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionRoutes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionRoutesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageRegionRoutesIdRequestBuilder *queryBuilder = [api newCoverageRegionRoutesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionRoutesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionRoutesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriRoutes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageRegionUriRoutesRequestBuilder *queryBuilder = [api newCoverageRegionUriRoutesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriRoutes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriRoutes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriRoutesId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        CoverageRegionUriRoutesIdRequestBuilder *queryBuilder = [api newCoverageRegionUriRoutesIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriRoutesId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriRoutesId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)routes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        RoutesApi *api = [self.sdk routesApi];
        RoutesRequestBuilder *queryBuilder = [api newRoutesRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK routes with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK routes fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionStatus:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StatusApi *api = [self.sdk statusApi];
        CoverageRegionStatusRequestBuilder *queryBuilder = [api newCoverageRegionStatusRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionStatus with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionStatus fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatStopAreas:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageLonLatStopAreasRequestBuilder *queryBuilder = [api newCoverageLonLatStopAreasRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatStopAreas with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatStopAreas fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatStopAreasId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageLonLatStopAreasIdRequestBuilder *queryBuilder = [api newCoverageLonLatStopAreasIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatStopAreasId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatStopAreasId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriStopAreas:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageLonLatUriStopAreasRequestBuilder *queryBuilder = [api newCoverageLonLatUriStopAreasRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriStopAreas with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriStopAreas fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriStopAreasId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageLonLatUriStopAreasIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriStopAreasIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriStopAreasId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriStopAreasId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionStopAreas:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageRegionStopAreasRequestBuilder *queryBuilder = [api newCoverageRegionStopAreasRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionStopAreas with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionStopAreas fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionStopAreasId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageRegionStopAreasIdRequestBuilder *queryBuilder = [api newCoverageRegionStopAreasIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionStopAreasId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionStopAreasId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriStopAreas:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageRegionUriStopAreasRequestBuilder *queryBuilder = [api newCoverageRegionUriStopAreasRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriStopAreas with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriStopAreas fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriStopAreasId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        CoverageRegionUriStopAreasIdRequestBuilder *queryBuilder = [api newCoverageRegionUriStopAreasIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriStopAreasId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriStopAreasId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)stopAreas:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopAreasApi *api = [self.sdk stopAreasApi];
        StopAreasRequestBuilder *queryBuilder = [api newStopAreasRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK stopAreas with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK stopAreas fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatStopPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageLonLatStopPointsRequestBuilder *queryBuilder = [api newCoverageLonLatStopPointsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatStopPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatStopPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatStopPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageLonLatStopPointsIdRequestBuilder *queryBuilder = [api newCoverageLonLatStopPointsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatStopPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatStopPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriStopPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageLonLatUriStopPointsRequestBuilder *queryBuilder = [api newCoverageLonLatUriStopPointsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriStopPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriStopPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriStopPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageLonLatUriStopPointsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriStopPointsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriStopPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriStopPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionStopPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageRegionStopPointsRequestBuilder *queryBuilder = [api newCoverageRegionStopPointsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionStopPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionStopPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionStopPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageRegionStopPointsIdRequestBuilder *queryBuilder = [api newCoverageRegionStopPointsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionStopPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionStopPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriStopPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageRegionUriStopPointsRequestBuilder *queryBuilder = [api newCoverageRegionUriStopPointsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriStopPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriStopPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriStopPointsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        CoverageRegionUriStopPointsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriStopPointsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriStopPointsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriStopPointsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)stopPoints:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopPointsApi *api = [self.sdk stopPointsApi];
        StopPointsRequestBuilder *queryBuilder = [api newStopPointsRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"originalId"]) {
            [queryBuilder withOriginalId:(NSString*)[params objectForKey:@"originalId"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK stopPoints with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK stopPoints fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriStopSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopSchedulesApi *api = [self.sdk stopSchedulesApi];
        CoverageLonLatUriStopSchedulesRequestBuilder *queryBuilder = [api newCoverageLonLatUriStopSchedulesRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriStopSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriStopSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriStopSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopSchedulesApi *api = [self.sdk stopSchedulesApi];
        CoverageRegionUriStopSchedulesRequestBuilder *queryBuilder = [api newCoverageRegionUriStopSchedulesRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriStopSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriStopSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)stopSchedules:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        StopSchedulesApi *api = [self.sdk stopSchedulesApi];
        StopSchedulesRequestBuilder *queryBuilder = [api newStopSchedulesRequestBuilder];

        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }
        if ([params objectForKey:@"fromDatetime"]) {
            [queryBuilder withFromDatetime:(NSString*)[params objectForKey:@"fromDatetime"]];
        }
        if ([params objectForKey:@"untilDatetime"]) {
            [queryBuilder withUntilDatetime:(NSString*)[params objectForKey:@"untilDatetime"]];
        }
        if ([params objectForKey:@"duration"]) {
            [queryBuilder withDuration:[[params objectForKey:@"duration"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"maxDateTimes"]) {
            [queryBuilder withMaxDateTimes:[[params objectForKey:@"maxDateTimes"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"calendar"]) {
            [queryBuilder withCalendar:(NSString*)[params objectForKey:@"calendar"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"dataFreshness"]) {
            [queryBuilder withDataFreshness:(NSString*)[params objectForKey:@"dataFreshness"]];
        }
        if ([params objectForKey:@"itemsPerSchedule"]) {
            [queryBuilder withItemsPerSchedule:[[params objectForKey:@"itemsPerSchedule"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK stopSchedules with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK stopSchedules fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionTrafficReports:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TrafficReportApi *api = [self.sdk trafficReportApi];
        CoverageRegionTrafficReportsRequestBuilder *queryBuilder = [api newCoverageRegionTrafficReportsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionTrafficReports with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionTrafficReports fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriTrafficReports:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TrafficReportApi *api = [self.sdk trafficReportApi];
        CoverageRegionUriTrafficReportsRequestBuilder *queryBuilder = [api newCoverageRegionUriTrafficReportsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriTrafficReports with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriTrafficReports fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatTrips:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageLonLatTripsRequestBuilder *queryBuilder = [api newCoverageLonLatTripsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatTrips with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatTrips fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatTripsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageLonLatTripsIdRequestBuilder *queryBuilder = [api newCoverageLonLatTripsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatTripsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatTripsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriTrips:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageLonLatUriTripsRequestBuilder *queryBuilder = [api newCoverageLonLatUriTripsRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriTrips with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriTrips fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriTripsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageLonLatUriTripsIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriTripsIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriTripsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriTripsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionTrips:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageRegionTripsRequestBuilder *queryBuilder = [api newCoverageRegionTripsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionTrips with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionTrips fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionTripsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageRegionTripsIdRequestBuilder *queryBuilder = [api newCoverageRegionTripsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionTripsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionTripsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriTrips:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageRegionUriTripsRequestBuilder *queryBuilder = [api newCoverageRegionUriTripsRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriTrips with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriTrips fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriTripsId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        TripsApi *api = [self.sdk tripsApi];
        CoverageRegionUriTripsIdRequestBuilder *queryBuilder = [api newCoverageRegionUriTripsIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriTripsId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriTripsId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriVehicleJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageLonLatUriVehicleJourneysRequestBuilder *queryBuilder = [api newCoverageLonLatUriVehicleJourneysRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriVehicleJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriVehicleJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatUriVehicleJourneysId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageLonLatUriVehicleJourneysIdRequestBuilder *queryBuilder = [api newCoverageLonLatUriVehicleJourneysIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatUriVehicleJourneysId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatUriVehicleJourneysId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatVehicleJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageLonLatVehicleJourneysRequestBuilder *queryBuilder = [api newCoverageLonLatVehicleJourneysRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatVehicleJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatVehicleJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageLonLatVehicleJourneysId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageLonLatVehicleJourneysIdRequestBuilder *queryBuilder = [api newCoverageLonLatVehicleJourneysIdRequestBuilder];

        if ([params objectForKey:@"lat"]) {
            [queryBuilder withLat:[[params objectForKey:@"lat"] doubleValue]];
        }
        if ([params objectForKey:@"lon"]) {
            [queryBuilder withLon:[[params objectForKey:@"lon"] doubleValue]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageLonLatVehicleJourneysId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageLonLatVehicleJourneysId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriVehicleJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageRegionUriVehicleJourneysRequestBuilder *queryBuilder = [api newCoverageRegionUriVehicleJourneysRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriVehicleJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriVehicleJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionUriVehicleJourneysId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageRegionUriVehicleJourneysIdRequestBuilder *queryBuilder = [api newCoverageRegionUriVehicleJourneysIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"uri"]) {
            [queryBuilder withUri:(NSString*)[params objectForKey:@"uri"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionUriVehicleJourneysId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionUriVehicleJourneysId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionVehicleJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageRegionVehicleJourneysRequestBuilder *queryBuilder = [api newCoverageRegionVehicleJourneysRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionVehicleJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionVehicleJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)coverageRegionVehicleJourneysId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        CoverageRegionVehicleJourneysIdRequestBuilder *queryBuilder = [api newCoverageRegionVehicleJourneysIdRequestBuilder];

        if ([params objectForKey:@"region"]) {
            [queryBuilder withRegion:(NSString*)[params objectForKey:@"region"]];
        }
        if ([params objectForKey:@"id"]) {
            [queryBuilder withId:(NSString*)[params objectForKey:@"id"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK coverageRegionVehicleJourneysId with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK coverageRegionVehicleJourneysId fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}
- (void)vehicleJourneys:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if ([params isKindOfClass:[NSNull class]] || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        VehicleJourneysApi *api = [self.sdk vehicleJourneysApi];
        VehicleJourneysRequestBuilder *queryBuilder = [api newVehicleJourneysRequestBuilder];

        if ([params objectForKey:@"externalCode"]) {
            [queryBuilder withExternalCode:(NSString*)[params objectForKey:@"externalCode"]];
        }
        if ([params objectForKey:@"startPage"]) {
            [queryBuilder withStartPage:[[params objectForKey:@"startPage"] integerValue]];
        }
        if ([params objectForKey:@"count"]) {
            [queryBuilder withCount:[[params objectForKey:@"count"] integerValue]];
        }
        if ([params objectForKey:@"depth"]) {
            [queryBuilder withDepth:[[params objectForKey:@"depth"] integerValue]];
        }
        if ([params objectForKey:@"forbiddenId"]) {
            [queryBuilder withForbiddenId:(NSArray*)[params objectForKey:@"forbiddenId"]];
        }
        if ([params objectForKey:@"forbiddenUris"]) {
            [queryBuilder withForbiddenUris:(NSArray*)[params objectForKey:@"forbiddenUris"]];
        }
        if ([params objectForKey:@"headsign"]) {
            [queryBuilder withHeadsign:(NSString*)[params objectForKey:@"headsign"]];
        }
        if ([params objectForKey:@"showCodes"]) {
            [queryBuilder withShowCodes:(NSNumber*)[params objectForKey:@"showCodes"]];
        }
        if ([params objectForKey:@"odtLevel"]) {
            [queryBuilder withOdtLevel:(NSString*)[params objectForKey:@"odtLevel"]];
        }
        if ([params objectForKey:@"distance"]) {
            [queryBuilder withDistance:[[params objectForKey:@"distance"] integerValue]];
        }
        if ([params objectForKey:@"since"]) {
            [queryBuilder withSince:(NSString*)[params objectForKey:@"since"]];
        }
        if ([params objectForKey:@"until"]) {
            [queryBuilder withUntil:(NSString*)[params objectForKey:@"until"]];
        }
        if ([params objectForKey:@"disableGeojson"]) {
            [queryBuilder withDisableGeojson:(NSNumber*)[params objectForKey:@"disableGeojson"]];
        }
        if ([params objectForKey:@"filter"]) {
            [queryBuilder withFilter:(NSString*)[params objectForKey:@"filter"]];
        }

        [queryBuilder rawGetWithCompletion:^(NSString *results, NSError *error) {
            if (error == nil) {
                NSLog(@"SDK vehicleJourneys with query %@", [queryBuilder makeUrl]);
                NSData *jsonData = [results dataUsingEncoding:NSUTF8StringEncoding];
                if (jsonData != nil) {
                    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsonResults];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            } else {
                NSLog(@"SDK vehicleJourneys fail with query %@", [queryBuilder makeUrl]);
                NSDictionary *userInfo = @{
                    @"NSLocalizedDescriptionKey" : [error localizedDescription]
                };
                NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:[error code] userInfo:userInfo];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
}

@end
