//
//  NotificationBody.h
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

// Reload coupons notifications.
/*
 * Begin.
 */
#define kNotificationUpdateCoupons @"NotificationUpdateCoupons"
#define kNotificationUpdateCategorys @"NotificationUpdateCategorys"
#define kNotificationRetrieveCouponDescription @"NotificationRetrieveCouponDescription"
#define kNotificationNearRetrieveCoupon @"NotificationNearRetrieveCoupon"

typedef NS_ENUM(NSInteger, NotificationBodyTag)
{
    kNotificationBodyFromCategoryToUpdateCoupons = 10,
    kNotificationBodyFromFilterConditionToUpdateCoupons,
    kNotificationBodyFromSortToUpdateCoupons,
    kNotificationBodyFromFilterConditionToUpdateCities,
    kNotificationBodyFromNoNetworkToUpdateCategories,
    kNotificationRetrieveCouponDescriptionTag,
    kNotificationNearRetrieveCouponTag
};

/*
 * End.
 */

@interface NotificationBody : NSObject

@property (nonatomic, assign) NSUInteger tag;
@property (nonatomic, strong) id body;

+ (void)postUpdateCouponsWithNotificationBody:(NotificationBody *)body;
+ (void)postUpdateCategoriesWithNotificationBody:(NotificationBody *)body;
+ (void)postRetrieveCouponDescriptionWithNotificationBody:(NotificationBody *)body;
+ (void)postNearRetrieveCouponWithNotificationBody:(NotificationBody *)body;

@end
