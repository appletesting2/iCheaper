//
//  FavoriteCoupon.m
//  iCheaper
//
//  Created by twb on 13-4-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FavoriteCoupon.h"


@implementation FavoriteCoupon

+ (instancetype)sharedInstance
{
	static id instance;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	
	return instance;
}

- (void)removeCoupon:(NSUInteger)couponID
{
    // assumed no exist, do nothing.
    if (![self HasExistcouponID:@(couponID)])
    {
        return;
    }
    
    // firstly get saved coupons ID
    coupons = [NSMutableArray arrayWithArray:[self getCouponsID]];
    
    [coupons removeObject:@(couponID)];
    
    [[NSUserDefaults standardUserDefaults] setObject:coupons forKey:kFavoriteCouponsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveCoupon:(NSUInteger)couponID
{
    // assumed exist, do nothing.
    if ([self HasExistcouponID:@(couponID)]) {
        return;
    }
    
    // firstly get saved coupons ID
    coupons = [NSMutableArray arrayWithArray:[self getCouponsID]];
    
    // assumed first save coupons ID.
    if (coupons == nil)
    {
        coupons = [NSMutableArray arrayWithCapacity:0];
    }
    
    [coupons addObject:@(couponID)];
    
    [[NSUserDefaults standardUserDefaults] setObject:coupons forKey:kFavoriteCouponsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSArray *)getCouponsID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kFavoriteCouponsKey];
}

- (BOOL)HasExistcouponID:(NSNumber *)couponID
{
    for (NSNumber *ID in [self getCouponsID])
    {
        if ([ID isEqualToNumber:couponID])
        {
            return YES;
        }
    }
    return NO;
}

@end
