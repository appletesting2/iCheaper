//
//  NotificationBody.m
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NotificationBody.h"

@implementation NotificationBody

+ (void)postUpdateCouponsWithNotificationBody:(NotificationBody *)body
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateCoupons object:body];
}

+ (void)postUpdateCategoriesWithNotificationBody:(NotificationBody *)body
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateCategorys object:body];
}

+ (void)postRetrieveCouponDescriptionWithNotificationBody:(NotificationBody *)body
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRetrieveCouponDescription object:body];
}

+ (void)postNearRetrieveCouponWithNotificationBody:(NotificationBody *)body
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNearRetrieveCoupon object:body];
}

@end
