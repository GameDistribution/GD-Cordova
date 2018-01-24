#import <Cordova/CDV.h>
#import "GDAdDelegate.h"

@interface GDApi : CDVPlugin <AdDelegate>

- (void)init:(CDVInvokedUrlCommand*)command;
- (void)showBanner:(CDVInvokedUrlCommand*)command;
- (void)enableTestAds:(CDVInvokedUrlCommand*)command;
- (void)setAdListener:(CDVInvokedUrlCommand*)command;

@end
