//
//  ToolKit.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolKit : NSObject

// singleton for global shared functions.
+ (instancetype)sharedInstance;

- (NSArray *)retrieveSortStringArray;
- (NSArray *)retrieveSortStringTitleArray;
- (NSArray *)retrieveNearCouponsSortStringArray;
- (NSArray *)retrieveNearCouponsSortStringTitleArray;
- (NSArray *)retrieveCategories;

- (void)setNavigationController:(UIViewController *)v title:(NSString *)s output:(UILabel **)l;
- (void)setNavigationController:(UIViewController *)v title:(NSString *)s;
- (void)setNavController:(UIViewController *)v title:(NSString *)s output:(UIButton**)button;

- (void)setImage:(UIImageView *)image url:(NSString *)string;

- (void)showTipInView:(UIView *)v forText:(NSString *)text;
- (void)showTipInView:(UIView *)v forText:(NSString *)text afterDelay:(CGFloat)delay;

- (void)drawCellBottomLine:(CGFloat)height;

- (void)postErrorMessage:(NSString *)strTips;
- (void)postFinishMessage:(NSString *)strTips;

// tab bar controller show or hide.
- (void)hideTabBar:(UITabBarController *) tabbarcontroller;
- (void)showTabBar:(UITabBarController *) tabbarcontroller;

@end
