//
//  FilterCondition.h
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultAllCategoryChannel @"全部频道"

@interface FilterCondition : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *subCategory;
@property (nonatomic, assign) NSUInteger sort;
@property (nonatomic, assign) NSUInteger nearCouponSort;
@property (nonatomic, assign) NSUInteger limit;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) NSUInteger radius;
@property (nonatomic, assign) BOOL isDistanceOn;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *keyword;

@property (nonatomic, assign) BOOL hasDistanceParam;
@property (nonatomic, assign) BOOL hasRegionParam;
@property (nonatomic, assign) BOOL hasKeywordParam;
@property (nonatomic, assign) BOOL hasCategoryParam;    // assumed no, stand for all category.
@property (nonatomic, assign) BOOL hasSubCategory;

// singleton for global shared functions.
+ (instancetype)sharedInstance;

- (NSString *)getAreaText;

@end
