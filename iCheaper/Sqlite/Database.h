//
//  Database.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

#define kCityTableName @"Cities"
#define kCouponTableName @"Coupons"
#define kBusinessTableName @"Businesses"

@interface Database : NSObject

+ (void)createTable;

@end
