//
//  TTUIManager.h
//  iCheaper
//
//  Created by twb on 13-6-15.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coupons;

@interface TTUIManager : NSObject

@property (nonatomic, readonly) UIViewController *rootViewController;

- (void)showCouponDetailController:(Coupons *)coupon;
- (void)exitCouponDetailController;

- (void)showNearCouponDetailController:(Coupons *)coupon;
- (void)exitNearCouponDetailController;

- (void)showFavoriteCouponDetailController:(Coupons *)coupon;
- (void)exitFavoriteCouponDetailController;

- (void)showPartnerController;
- (void)exitPartnerController;

@end
