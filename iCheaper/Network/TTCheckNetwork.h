//
//  TTCheckNetwork.h
//  TaoChen
//
//  Created by twb on 13-2-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reachability;

@interface TTCheckNetwork : NSObject
{
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
}

// singleton for global shared functions.
+ (instancetype)sharedInstance;

- (BOOL)checkHostIsRegular;
- (BOOL)checkInternetIsRegular;
- (BOOL)checkWifiIsRegular;
- (BOOL)networkIsOK;

@end
