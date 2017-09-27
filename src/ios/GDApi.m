
#import "GDApi.h"
#import <Cordova/CDV.h>

@implementation GDApi

- (void)init:(CDVInvokedUrlCommand*)command
{
  CDVPluginResult* pluginResult = nil;
  NSString* msg = [command.arguments objectAtIndex:0];

  if (msg == nil || [msg length] == 0) {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  } else {

    // initializing will be handled here...
  });

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
  }

  [self.commandDelegate sendPluginResult:pluginResult
callbackId:command.callbackId];
}

@end
