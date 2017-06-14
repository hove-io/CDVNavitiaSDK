#ifndef CDVNavitiaSDK_h
#define CDVNavitiaSDK_h

#import <Cordova/CDV.h>
#import <NavitiaSDK/NavitiaSDK-swift.h>

@interface CDVNavitiaSDK : CDVPlugin

@property (nonatomic, strong) NavitiaSDK *sdk;

- (void)init:(CDVInvokedUrlCommand*)command;
- (void)endpoint_places:(CDVInvokedUrlCommand*)command;

@end

#endif