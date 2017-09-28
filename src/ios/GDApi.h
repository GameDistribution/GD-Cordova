#import <Cordova/CDV.h>

@interface GDApi : CDVPlugin

- (void)init:(CDVInvokedUrlCommand*)command;
- (void)showBanner:(CDVInvokedUrlCommand*)command;
- (void)addTestDevice:(CDVInvokedUrlCommand*)command;
- (void)setAdListener:(CDVInvokedUrlCommand*)command;

@end
