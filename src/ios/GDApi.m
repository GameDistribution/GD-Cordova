
#import "GDApi.h"
#import <Cordova/CDV.h>
#import "GDLogger.h"
#import "GDAdDelegate.h"

@implementation GDApi

Boolean apiInitialized = false;
NSString *savedCommandId;

- (void)init:(CDVInvokedUrlCommand*)command{
  CDVPluginResult* pluginResult = nil;
  NSString* gameId = [command.arguments objectAtIndex:0];
  NSString* regId = [command.arguments objectAtIndex:1];

  if(!apiInitialized){

    apiInitialized = true;
    [GDLogger debug:true];
    [GDLogger init:gameId andWithRegId:regId];

  }
  else{
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Api is already initialized."] ;
  }

  [self.commandDelegate sendPluginResult:pluginResult
  callbackId:command.callbackId];
  savedCommandId = command.callbackId;
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

- (void)enableTestAds:(CDVInvokedUrlCommand*)command{
  CDVPluginResult* pluginResult = nil;

    [GDLogger enableTestAds];

}

- (void)setAdListener:(CDVInvokedUrlCommand*)command{

  CDVPluginResult* pluginResult = nil;

  [GDLogger addEventListener:self];

}

-(void) onBannerReceived:(GDAdDelegate*) sender withData:(NSData*) data{
    NSDictionary *adData = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"Banner received!");

    NSArray *keys = [NSArray arrayWithObjects:@"event",@"adType", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"BANNER_RECEIVED",@"interstitial", nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];
}

-(void) onBannerStarted:(GDAdDelegate*) sender{

    NSLog(@"Banner started!");

    NSArray *keys = [NSArray arrayWithObjects:@"event", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"BANNER_STARTED", nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];
}

-(void) onBannerClosed:(GDAdDelegate*) sender{
    NSLog(@"Banner closed!");

    NSArray *keys = [NSArray arrayWithObjects:@"event", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"BANNER_CLOSED", nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];

}
-(void) onBannerFailedToLoad:(GDAdDelegate*) sender withData:(NSData*) data{
    NSDictionary *adData = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"Banner failed to load!");

    NSArray *keys = [NSArray arrayWithObjects:@"event",@"message", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"BANNER_FAILED",adData[@"error"], nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];
}

-(void) onAPINotReady:(GDAdDelegate*) sender withData:(NSData*) data{
    NSDictionary *adData = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"API is not ready!");

    NSArray *keys = [NSArray arrayWithObjects:@"event",@"message", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"API_NOT_READY",adData[@"error"], nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];
}

-(void) onAPIReady:(GDAdDelegate*) sender{
    NSLog(@"API is ready!");

    NSArray *keys = [NSArray arrayWithObjects:@"event", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"API_IS_READY", nil];
    NSDictionary *myData = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myData] ;
    [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];

    [self.commandDelegate sendPluginResult:pluginResult
    callbackId:savedCommandId];
}



@end
