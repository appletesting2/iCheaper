//
//  TTCheckNetwork.m
//  TaoChen
//
//  Created by twb on 13-2-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCheckNetwork.h"
#import "Reachability.h"

@implementation TTCheckNetwork

+ (instancetype)sharedInstance
{
	static id instance;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	
	return instance;
}

- (BOOL)checkHostIsRegular
{
    hostReach = [Reachability reachabilityWithHostName:kAppHostAddress];
    //	[hostReach startNotifier];
    if ([hostReach currentReachabilityStatus] == NotReachable) {
        return NO;
    }
    return YES;
}

- (BOOL)checkInternetIsRegular
{
    internetReach = [Reachability reachabilityForInternetConnection];
    //	[hostReach startNotifier];
    if ([internetReach currentReachabilityStatus] == NotReachable) {
        return NO;
    }
    return YES;
}

- (BOOL)checkWifiIsRegular
{
    wifiReach = [Reachability reachabilityForLocalWiFi];
    //	[hostReach startNotifier];
    if ([wifiReach currentReachabilityStatus] == NotReachable) {
        return NO;
    }
    return YES;
}

- (BOOL)networkIsOK
{
    return [self checkInternetIsRegular] || [self checkWifiIsRegular];
}

@end
