//
//  UIViewController+ShareIntance.h
//  iCheaper
//
//  Created by twb on 13-6-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TTUIManager.h"

@interface UIViewController (ShareIntance)

- (AppDelegate *) appDelegate;

- (TTUIManager *)UIManager;

- (void) showProgressWithLabel:(NSString *) label task:(void (^)(void)) task completion:(void (^)(void)) completion;
- (void) showProgressWithLabel2:(NSString *) label task:(void (^)(void)) task completion:(void (^)(void)) completion;

@end
