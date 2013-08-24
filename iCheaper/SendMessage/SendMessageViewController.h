//
//  SendMessageViewController.h
//  iCheaper
//
//  Created by twb on 13-4-16.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassSlot/PassSlot.h>
#import "AFHTTPClient.h"
#import "MBProgressHUD.h"
#import "NavigationItemButton.h"

@interface SendMessageViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic, strong) MBProgressHUD *loadWebViewHud;

@end
