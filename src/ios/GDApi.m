
#import "GDApi.h"
#import <Cordova/CDV.h>
#import "GDLogger.h"

@implementation GDApi

Boolean apiInitialized = false;

- (void)init:(CDVInvokedUrlCommand*)command{
  CDVPluginResult* pluginResult = nil;
  NSString* gameId = [command.arguments objectAtIndex:0];
  NSString* regId = [command.arguments objectAtIndex:1];

  if(!apiInitialized){

    [GDLogger debug:true];
    [GDLogger init:gameId andWithRegId:regId andWithIsPlugin:true];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Api is isApiInitialized succesfully."];
    apiInitialized = true;
  }
  else{
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Api is already isApiInitialized."] ;
  }

  [self.commandDelegate sendPluginResult:pluginResult
  callbackId:command.callbackId];
}

- (void)showBanner:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;

    if(apiInitialized){
        [GDLogger showBanner:true];
    }
    else{
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Api is not initialized.Firstly call 'init'."] ;

    }

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:command.callbackId];

}

- (void)addTestDevice:(CDVInvokedUrlCommand*)command{
  CDVPluginResult* pluginResult = nil;

  if(apiInitialized){
     NSString* testDeviceId = [command.arguments objectAtIndex:0];
     [GDLogger addTestDevice:testDeviceId];
  }
  else{
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Api is not initialized.Firstly call 'init'."] ;
  }

  [self.commandDelegate sendPluginResult:pluginResult
  callbackId:command.callbackId];

}

- (void)setAdListener:(CDVInvokedUrlCommand*)command{

  CDVPluginResult* pluginResult = nil;

  if(apiInitialized){

  }
  else{
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Api is not initialized.Firstly call 'init'."] ;

  }

  [self.commandDelegate sendPluginResult:pluginResult
  callbackId:command.callbackId];

}




@end
