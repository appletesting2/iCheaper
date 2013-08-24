//
//  AppDelegate.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPAPI.h"

@class Reachability;
@class TTUIManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>
{
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, nonatomic) DPAPI *dpapi;
@property (strong, nonatomic) NSString *appKey;
@property (strong, nonatomic) NSString *appSecret;

@property (strong, nonatomic) TTUIManager *UIManager;

+ (AppDelegate *)instance;

@end
