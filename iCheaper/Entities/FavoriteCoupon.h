//
//  FavoriteCoupon.h
//  iCheaper
//
//  Created by twb on 13-4-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kFavoriteCouponsKey @"FavoriteCouponsKey"

@interface FavoriteCoupon : NSObject
{
    // save coupon ID
    NSMutableArray *coupons;
}

// singleton for global shared functions.
+ (instancetype)sharedInstance;

- (void)removeCoupon:(NSUInteger)couponID;
- (void)saveCoupon:(NSUInteger)couponID;
- (NSArray *)getCouponsID;
- (BOOL)HasExistcouponID:(NSNumber *)couponID;

@end
