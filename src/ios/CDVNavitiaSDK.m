#import "CDVNavitiaSDK.h"
#import <Cordova/CDV.h>

@implementation CDVNavitiaSDK

- (void)init:(CDVInvokeUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token == nil || [msg length] == 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } else {
        NavitiaConfiguration *conf = [[NavitiaConfiguration alloc] initWithToken:token];
        self.sdk = [[NavitiaSDK alloc] initWithConfiguration:conf];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endpoint_places:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if (params == nil || [params length] == 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } else {
        EndpointPlaces *places = [[self.sdk endpoints] places];
        EndpointRequestBuilderPlaces *queryBuilder = [places newRequestBuilder];

        for (NSString* key in params) {
            id value = [params objectForKey:key];
            if ([value isKindOfClass:[NSNumber class]]) {
                value = [value stringValue];
            }
            [queryBuilder addQueryParameterWithKey:key value:value];
        }

        [queryBuilder rawGetWithCallback: ^(NSDictionary *results)
        {
            //RCTLogInfo(@"SDK places with query %@", [queryBuilder getUrl]);
            resolve(results);
        }
        errorCallback:^(ResourceRequestError *sdkError)
        {
            //RCTLogInfo(@"SDK places fail");
            NSDictionary *userInfo = @{
                @"NSLocalizedDescriptionKey" : sdkError.message
            };
            NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:sdkError.httpStatusCode userInfo:userInfo];
            reject([@(sdkError.httpStatusCode) stringValue], sdkError.message, error);
        }];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end