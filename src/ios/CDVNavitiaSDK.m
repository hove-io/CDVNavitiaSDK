#import "CDVNavitiaSDK.h"
#import <Cordova/CDV.h>

@implementation CDVNavitiaSDK

- (void)init:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token == nil || [token length] == 0) {
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
    
    NSDictionary* params = [command.arguments objectAtIndex:0];

    if (params == nil || [params count] == 0) {
        CDVPluginResult* pluginResult = nil;
        NSString* errorMessage = @"Wrong parameters";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
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
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:results];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
        errorCallback:^(ResourceRequestError *sdkError)
        {
            //RCTLogInfo(@"SDK places fail");
            NSDictionary *userInfo = @{
                @"NSLocalizedDescriptionKey" : sdkError.message
            };
            NSError *error = [NSError errorWithDomain:@"NavitiaSDK" code:sdkError.httpStatusCode userInfo:userInfo];
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:sdkError.message];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    }
}

@end
