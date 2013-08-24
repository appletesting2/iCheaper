//
//  FilterCondition.m
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FilterCondition.h"

#define kFilterConditionDefaultCity @"上海"
#define kFilterConditionDefaultCategory @""
#define kFilterConditionDefaultSubCategory @""
#define kFilterConditionDefaultSort 1
#define kFilterConditionDefaultNCSort 1
#define kFilterConditionDefaultLimit 20
#define kFilterConditionDefaultPage 1
#define kFilterConditionDefaultLatitude 0.0f
#define kFilterConditionDefaultLongitude 0.0f
#define kFilterConditionDefaultRadius 1000
#define kFilterConditionDefaultRegion @""
#define kFilterConditionDefaultKeyword @""

@implementation FilterCondition
@synthesize city = _city;
@synthesize category = _category;
@synthesize subCategory = _subCategory;
@synthesize sort = _sort;
@synthesize nearCouponSort = _nearCouponSort;
@synthesize limit = _limit;
@synthesize page = _page;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize radius = _radius;
@synthesize isDistanceOn = _isDistanceOn;
@synthesize region = _region;
@synthesize keyword = _keyword;

+ (instancetype)sharedInstance
{
	static id instance;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	
	return instance;
}

- (void)setCity:(NSString *)city
{
    _city = city;
    [[NSUserDefaults standardUserDefaults] setObject:city forKey:@"city"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)city
{
    NSString *city = [[NSUserDefaults standardUserDefaults] stringForKey:@"city"];
    if (city == nil || [city isEqualToString:@""]) {
        city = kFilterConditionDefaultCity;
    }
    return city;
}

- (void)setCategory:(NSString *)category
{
    _category = category;
    [[NSUserDefaults standardUserDefaults] setObject:category forKey:@"category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)category
{
    NSString *category = [[NSUserDefaults standardUserDefaults] stringForKey:@"category"];
    if (category == nil || [category isEqualToString:@""]) {
        category = kFilterConditionDefaultCategory;
    }
    return category;
}

- (void)setSubCategory:(NSString *)subCategory
{
    _subCategory = subCategory;
    [[NSUserDefaults standardUserDefaults] setObject:subCategory forKey:@"subCategory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)subCategory
{
    NSString *subCategory = [[NSUserDefaults standardUserDefaults] stringForKey:@"subCategory"];
    if (subCategory == nil || [subCategory isEqualToString:@""]) {
        subCategory = kFilterConditionDefaultCategory;
    }
    return subCategory;
}

- (void)setSort:(NSUInteger)sort
{
    _sort = sort;
    [[NSUserDefaults standardUserDefaults] setInteger:sort forKey:@"sort"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)sort
{
    NSUInteger sort = [[NSUserDefaults standardUserDefaults] integerForKey:@"sort"];
    if (sort == 0) {
        sort = kFilterConditionDefaultSort;
    }
    
    return sort;
}

- (void)setNearCouponSort:(NSUInteger)nearCouponSort
{
    _nearCouponSort = nearCouponSort;
    [[NSUserDefaults standardUserDefaults] setInteger:nearCouponSort forKey:@"ncsort"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)nearCouponSort
{
    NSUInteger sort = [[NSUserDefaults standardUserDefaults] integerForKey:@"ncsort"];
    if (sort == 0) {
        sort = kFilterConditionDefaultNCSort;
    }
    
    return sort;
}

- (void)setLimit:(NSUInteger)limit
{
    _limit = limit;
    [[NSUserDefaults standardUserDefaults] setInteger:limit forKey:@"limit"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)limit
{
    NSUInteger limit = [[NSUserDefaults standardUserDefaults] integerForKey:@"limit"];
    if (limit == 0) {
        limit = kFilterConditionDefaultLimit;
    }
    
    return limit;
}


- (void)setPage:(NSUInteger)page
{
    _page = page;
    [[NSUserDefaults standardUserDefaults] setInteger:page forKey:@"page"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)page
{
    NSUInteger page = [[NSUserDefaults standardUserDefaults] integerForKey:@"page"];
    if (page == 0) {
        page = kFilterConditionDefaultPage;
    }
    
    return page;
}

- (void)setLatitude:(CGFloat)latitude
{
    _latitude = latitude;
    [[NSUserDefaults standardUserDefaults] setFloat:latitude forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (CGFloat)latitude
{
    CGFloat latitude = [[NSUserDefaults standardUserDefaults] floatForKey:@"latitude"];
    if (latitude <= 0.0f) {
        latitude = kFilterConditionDefaultLatitude;
    }
    return latitude;
}

- (void)setLongitude:(CGFloat)longitude
{
    _longitude = longitude;
    [[NSUserDefaults standardUserDefaults] setFloat:longitude forKey:@"longitude"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (CGFloat)longitude
{
    CGFloat longitude = [[NSUserDefaults standardUserDefaults] floatForKey:@"longitude"];
    if (longitude <= 0.0f) {
        longitude = kFilterConditionDefaultLongitude;
    }
    return longitude;
}

- (void)setRadius:(NSUInteger)radius
{
    _radius = radius;
    [[NSUserDefaults standardUserDefaults] setInteger:radius forKey:@"radius"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)radius
{
    NSUInteger radius = [[NSUserDefaults standardUserDefaults] integerForKey:@"radius"];
    if (radius == 0) {
        radius = kFilterConditionDefaultRadius;
    }
    
    return radius;
}

- (void)setIsDistanceOn:(BOOL)isDistanceOn
{
    _isDistanceOn = isDistanceOn;
    [[NSUserDefaults standardUserDefaults] setBool:isDistanceOn forKey:@"DistanceOn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isDistanceOn
{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"DistanceOn"];
    return isOn;
}

- (void)setRegion:(NSString *)region
{
    _region = region;
    [[NSUserDefaults standardUserDefaults] setObject:region forKey:@"region"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)region
{
    NSString *region = [[NSUserDefaults standardUserDefaults] stringForKey:@"region"];
    if (region == nil || [region isEqualToString:@""]) {
        region = kFilterConditionDefaultRegion;
    }
    return region;
}

// main for display.
- (NSString *)getAreaText
{
    if ([self region] != nil && ![[self region] isEqualToString:@""])
    {
        return [self region];
    }
    else
    {
        return [self city];
    }
}


- (void)setKeyword:(NSString *)keyword
{
    _keyword = keyword;
    [[NSUserDefaults standardUserDefaults] setObject:keyword forKey:@"keyword"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)keyword
{
    NSString *keyword = [[NSUserDefaults standardUserDefaults] stringForKey:@"keyword"];
    if (keyword == nil || [keyword isEqualToString:@""]) {
        keyword = kFilterConditionDefaultKeyword;
    }
    return keyword;
}

#pragma mark - 

- (BOOL)hasDistanceParam
{
    if ([self latitude] == 0.0f || [self longitude] == 0.0f) {
        return NO;
    }
    return YES;
}

- (BOOL)hasRegionParam
{
    if ([self region] == nil || [[self region] isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (BOOL)hasKeywordParam
{
    if ([self keyword] == nil || [[self keyword] isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (BOOL)hasCategoryParam
{
    if ([self category] == nil || [[self category] isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (BOOL)hasSubCategory
{
    if ([self subCategory] == nil || [[self subCategory] isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

@end
