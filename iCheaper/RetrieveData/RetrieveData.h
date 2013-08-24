//
//  RetrieveData.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coupons.h"
#import "Businesses.h"
#import "Cities.h"
#import "Categories.h"

typedef NS_ENUM(NSInteger, RetrieveDataURLIndex)
{
    find_coupons_index = 0,
    get_single_coupon_index,
    find_businesses,
    get_single_business,
    get_regions_with_coupons,
    get_categories_with_coupons,
    find_businesses_by_coordinate
};

@interface RetrieveData : NSObject

@property (nonatomic, assign) NSInteger failureCount;

// singleton for global shared functions.
+ (instancetype)sharedInstance;

- (BOOL)retrieveCategoriesWithBlock:(void (^)(NSArray *categories, NSError *error))block;

- (BOOL)retrieveCitiesWithBlock:(void (^)(NSArray *cities, NSError *error))block;

- (BOOL)retrieveCouponsWithBlock:(void (^)(NSArray *coupons, NSError *error))block;
- (BOOL)retrieveCoupon:(NSUInteger)couponID WithBlock:(void (^)(Coupons *coupon, NSError *error))block;

- (BOOL)retrieveBusiness:(NSUInteger)businessID WithBlock:(void (^)(Businesses *business, NSError *error))block;
- (BOOL)retrieveNearBusinessesWithBlock:(void (^)(NSArray *businesses, NSError *))block;

@end
