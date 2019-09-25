/********* CordovaZohoDeskPortal.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <ZohoDeskPortalSDK/ZohoDeskPortalSDK.h>

@interface CordovaZohoDeskPortal : CDVPlugin {
    // Member variables go here.
}

- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)setUserToken:(CDVInvokedUrlCommand*)command;
- (void)removeUser:(CDVInvokedUrlCommand*)command;
- (void)startDeskHomeScreen:(CDVInvokedUrlCommand*)command;
- (void)startNewTicket:(CDVInvokedUrlCommand*)command;
- (void)startHelpCenter:(CDVInvokedUrlCommand*)command;
- (void)startCommunity:(CDVInvokedUrlCommand*)command;
- (void)startTickets:(CDVInvokedUrlCommand*)command;
- (void)startLiveChat:(CDVInvokedUrlCommand*)command;
@end

@implementation CordovaZohoDeskPortal

- (void)initialize:(CDVInvokedUrlCommand*)command{
    NSArray* arguments = command.arguments;
    if (arguments == nil) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arugument cannot be nil"] callbackId:command.callbackId];
        return;
    }
    ZDDataCenter dataCenter = ZDDataCenterUS;
    
    if ([arguments[2] isEqualToString:@"EU"]){
        dataCenter = ZDDataCenterEU;
    }else if ([arguments[2] isEqualToString:@"IN"]){
        dataCenter = ZDDataCenterIN;
    }else if ([arguments[2] isEqualToString:@"CN"]){
        dataCenter = ZDDataCenterCN;
    }else{
        dataCenter = ZDDataCenterUS;
    }
    
    ZDPortalConfiguration * config = [[ZDPortalConfiguration alloc]init];
    [ZohoDeskPortalSDK initializeSDK:arguments[0] appId:arguments[1] dataCenter:dataCenter configuration:config];
}

- (void)setUserToken:(CDVInvokedUrlCommand*)command{
    NSArray* arguments = command.arguments;
    if (arguments == nil) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arugument cannot be nil"] callbackId:command.callbackId];
        return;
    }
    if (![ZohoDeskPortalSDK isZDUserSignedIn]){
        [ZohoDeskPortalSDK setWithJwtUserIdentifier:arguments[0] onComplition:^{
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
        } onError:^(NSError * error) {
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.description] callbackId:command.callbackId];
        }];
    }else{
        //User already signed into SDK
    }
}

- (void)removeUser:(CDVInvokedUrlCommand*)command{
    
    [ZohoDeskPortalSDK logoutOnComplition:^{
        //User Logged out successfully
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    } onError:^(NSError * error) {
        //error while logging out user
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.description] callbackId:command.callbackId];
    }];
}

- (void)startDeskHomeScreen:(CDVInvokedUrlCommand*)command{
    ZDPortalConfiguration * config = [[ZDPortalConfiguration alloc]init];
    [ZohoDeskPortalSDK showHomePageWithController:self.viewController withConfiguration:config];
}

- (void)startNewTicket:(CDVInvokedUrlCommand*)command{
    [ZohoDeskPortalSDK addTicketWithController:self.viewController];
}

- (void)startHelpCenter:(CDVInvokedUrlCommand*)command{
    [ZohoDeskPortalSDK showHelpCenterWithController:self.viewController];
}

- (void)startCommunity:(CDVInvokedUrlCommand*)command{
    [ZohoDeskPortalSDK showCommunityWithController:self.viewController];
}

- (void)startTickets:(CDVInvokedUrlCommand*)command{
    [ZohoDeskPortalSDK ticketListWithController:self.viewController];
}

- (void)startLiveChat:(CDVInvokedUrlCommand*)command{
    [ZohoDeskPortalSDK showLiveChatWithController:self.viewController];
}

@end

