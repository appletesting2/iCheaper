//
//  RetrieveData.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "RetrieveData.h"
#import "DPConstants.h"
#import "DPAPI.h"
#import "SBJson.h"
#import <CommonCrypto/CommonDigest.h>
#import "AppDelegate.h"
#import "AFAppDotNetAPIClient.h"
#import "AFJSONRequestOperation.h"
#import "FilterCondition.h"

#define kVisitFailureCountMax (5)

@implementation RetrieveData
{
    NSArray *urlArray;
    NSArray *paramsArray;
    
    NSInteger index;
}

+ (instancetype)sharedInstance
{
	static id instance;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	
	return instance;
}

- (id)init
{
    urlArray = [NSArray arrayWithObjects:
                @"v1/coupon/find_coupons",
                @"v1/coupon/get_single_coupon",
                @"v1/business/find_businesses",
                @"v1/business/get_single_business",
                @"v1/metadata/get_regions_with_coupons",
                @"v1/metadata/get_categories_with_coupons",
                @"v1/business/find_businesses_by_coordinate",
                nil];
    
    // This array may be not useful.
    paramsArray = [NSArray arrayWithObjects:
                   @"?city=%@&latitude=%f&longitude=%f&radius=%d&region=%@&keyword=%@&category=%@&limit=%d&page=%d&sort=%d",    // All coupons parameters
                   @"?coupon_id=177822",
                   @"?city=北京&region=海淀区&category=火锅&has_coupon=1&sort=2&limit=20",
                   @"?business_id=%d",
                   @"?",
                   @"?",
                   @"?",
                   nil];
    
    return [super init];
}

- (BOOL)retrieveCouponsWithBlock:(void (^)(NSArray *coupons, NSError *error))block;
{    
    /*
     *  Split joint parameter.
     *  All:?city=%@&limit=%d&page=%d&sort=%d&latitude=%f&longitude=%f&radius=%d&region=%@&keyword=%@&category=%@
     */
    __block BOOL ret = NO;
    NSString *strParameter;
    NSString *subCategoryName = nil;
    FilterCondition *fc = [FilterCondition sharedInstance];
    
    // necessary param
    strParameter = [NSString stringWithFormat:@"?city=%@&limit=%d&page=%d&sort=%d", [fc city], [fc limit], [fc page], [fc sort]];
    // extra param
    if ([fc hasDistanceParam] && [fc isDistanceOn]) {
        strParameter = [strParameter stringByAppendingFormat:@"&latitude=%f&longitude=%f&radius=%d", [fc latitude], [fc longitude], [fc radius]];
    }
    
    if ([fc hasRegionParam]) {
        strParameter = [strParameter stringByAppendingFormat:@"&region=%@", [fc region]];
    }
    
    if ([fc hasKeywordParam]) {
        strParameter = [strParameter stringByAppendingFormat:@"&keyword=%@", [fc keyword]];
    }
    
    if ([fc hasCategoryParam]) {
        strParameter = [strParameter stringByAppendingFormat:@"&category=%@", [fc category]];
    }
    
    if ([fc hasSubCategory])
    {
        subCategoryName = [fc subCategory];
    }
    
    NSLog(@"strParameter = %@", strParameter);
    
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[find_coupons_index]] stringByAppendingString:strParameter];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    NSLog(@"urlString = %@", urlString);
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {
//         NSLog(@"JSON = %@", JSON);
         
         NSArray *couponsArray = [JSON valueForKeyPath:@"coupons"];
         NSMutableArray *mutableCoupons = [NSMutableArray arrayWithCapacity:[couponsArray count]];
         for (NSDictionary *attributes in couponsArray)
         {
             Coupons *coupon = [[Coupons alloc] initWithAttributes:attributes];
             
             if (subCategoryName && ![subCategoryName isEqualToString:@""])
             {
                 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", subCategoryName];
                 NSArray *results = [coupon.categories filteredArrayUsingPredicate:predicate];
                 
                 if ([results count] > 0)
                 {
                    [mutableCoupons addObject:coupon];
                 }
             }
             else
             {
                 [mutableCoupons addObject:coupon];
             }
         }
         
         NSInteger page = fc.page;
         NSLog(@"self.failureCount = %d", self.failureCount);
         if ((subCategoryName && ![subCategoryName isEqualToString:@""])
             && (mutableCoupons.count == 0 && self.failureCount < kVisitFailureCountMax))
         {
             fc.page = page + 1;
             self.failureCount++;
             [self retrieveCouponsWithBlock:block];
         }
         
         if (block) {
             block([NSArray arrayWithArray:mutableCoupons], nil);
             ret = YES;
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    
    return ret;
}

- (BOOL)retrieveCoupon:(NSUInteger)couponID WithBlock:(void (^)(Coupons *coupon, NSError *error))block;
{
    /*
     *  Split joint parameter.
     *  All:http://api.dianping.com/v1/coupon/get_single_coupon?coupon_id=177822&appkey=[appkey]&sign=[signature]
     */
    
    __block BOOL ret = NO;
    NSString *strParameter;
    
    // necessary param
    strParameter = [NSString stringWithFormat:@"?coupon_id=%d", couponID];
    
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[get_single_coupon_index]] stringByAppendingString:strParameter];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    //    NSLog(@"urlString = %@", urlString);
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         //         NSLog(@"JSON = %@", JSON);
         
         NSArray *couponsArray = [JSON valueForKeyPath:@"coupons"];
         NSMutableArray *mutableCoupons = [NSMutableArray arrayWithCapacity:[couponsArray count]];
         for (NSDictionary *attributes in couponsArray) {
             
             Coupons *coupon = [[Coupons alloc] initWithAttributes:attributes];
             [mutableCoupons addObject:coupon];
         }
         
         if (block) {
             if ([mutableCoupons count] > 0) {
                 block(mutableCoupons[0], nil);
                 ret = YES;
             }
             
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    
    return ret;
}

- (BOOL)retrieveNearBusinessesWithBlock:(void (^)(NSArray *businesses, NSError *error))block
{
    /*
     *  Split joint parameter.
     *  All:http://api.dianping.com/v1/business/find_businesses_by_coordinate?latitude=31.2204200000392&longitude=121.41163000018&category=美食&has_coupon=1&sort=7&limit=1&appkey=[appkey]&sign=[signature]
     */
    __block BOOL ret = NO;
    NSString *strParameter;
    FilterCondition *fc = [FilterCondition sharedInstance];
    
    // necessary param
    if (![fc hasDistanceParam])
    {
        return NO;
    }
    
    strParameter = [NSString stringWithFormat:@"?has_coupon=1&sort=%d&limit=%d", [fc nearCouponSort], [fc limit]];
    
    strParameter = [strParameter stringByAppendingFormat:@"&latitude=%f&longitude=%f&radius=%d", [fc latitude], [fc longitude], [fc radius]];
    
    if ([fc hasKeywordParam]) {
        strParameter = [strParameter stringByAppendingFormat:@"&keyword=%@", [fc keyword]];
    }
    
    if ([fc hasCategoryParam]) {
        strParameter = [strParameter stringByAppendingFormat:@"&category=%@", [fc category]];
    }
    
    NSLog(@"strParameter = %@", strParameter);
    
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[find_businesses_by_coordinate]] stringByAppendingString:strParameter];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    NSLog(@"urlString = %@", urlString);
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         //         NSLog(@"JSON = %@", JSON);
         
         NSArray *couponsArray = [JSON valueForKeyPath:@"businesses"];
         NSMutableArray *mutableCoupons = [NSMutableArray arrayWithCapacity:[couponsArray count]];
         for (NSDictionary *attributes in couponsArray) {
             Businesses *business = [[Businesses alloc] initWithAttributes:attributes];
             [mutableCoupons addObject:business];
         }
         
         if (block) {
             block([NSArray arrayWithArray:mutableCoupons], nil);
             ret = YES;
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    
    return ret;
}

- (BOOL)retrieveCategoriesWithBlock:(void (^)(NSArray *categories, NSError *error))block
{
    //    get_categories_with_coupons
    __block BOOL ret = NO;
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[get_categories_with_coupons]] stringByAppendingString:paramsArray[get_categories_with_coupons]];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         NSArray *categoriesArray = [JSON valueForKeyPath:@"categories"];
         NSMutableArray *mutableCategories = [NSMutableArray arrayWithCapacity:[categoriesArray count]];
         
         for (NSDictionary *attributes in categoriesArray) {
             
             Categories *category = [[Categories alloc] initWithAttributes:attributes];
             [mutableCategories addObject:category];
         }
         
         if (block) {
             block([NSArray arrayWithArray:mutableCategories], nil);
             ret = YES;
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    return ret;
}

- (BOOL)retrieveCitiesWithBlock:(void (^)(NSArray *cities, NSError *error))block
{
    // retrieve cities
    __block BOOL ret = NO;
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[get_regions_with_coupons]] stringByAppendingString:paramsArray[get_regions_with_coupons]];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    //    NSLog(@"urlString = %@", urlString);
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         //         NSLog(@"JSON = %@", JSON);
         
         NSArray *citiesArray = [JSON valueForKeyPath:@"cities"];
         NSMutableArray *mutableCities = [NSMutableArray arrayWithCapacity:[citiesArray count]];
         
         for (NSDictionary *attributes in citiesArray) {
             
             Cities *city = [[Cities alloc] initWithAttributes:attributes];
             [mutableCities addObject:city];
         }
         
         if (block) {
             block([NSArray arrayWithArray:mutableCities], nil);
             ret = YES;
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    return ret;
}

- (BOOL)retrieveBusiness:(NSUInteger)businessID WithBlock:(void (^)(Businesses *business, NSError *error))block
{
    __block BOOL ret = NO;
    NSString *paramString = [NSString stringWithFormat:paramsArray[get_single_business], businessID];
    NSString *fullURL = [[kDPAPIDomain stringByAppendingString:urlArray[get_single_business]] stringByAppendingString:paramString];
    NSString *urlString = [[self class] serializeURL:fullURL params:nil];
    
    [[AFAppDotNetAPIClient sharedClient] getPath:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON)
     {         
         NSArray *businessesArray = [JSON valueForKeyPath:@"businesses"];
         NSMutableArray *mutableBusinesses = [NSMutableArray arrayWithCapacity:[businessesArray count]];
         for (NSDictionary *attributes in businessesArray) {
             Businesses *business = [[Businesses alloc] initWithAttributes:attributes];
             [mutableBusinesses addObject:business];
         }
         
         if (block) {
             if ([mutableBusinesses count] > 0) {
                 block(mutableBusinesses[0], nil);
                 ret = YES;
             }
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) {
             block([NSArray array], error);
         }
     }];
    
    return ret;
}

#pragma mark - private method.

+ (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
		
		if ([elements count] <= 1) {
			return nil;
		}
		
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params
{
	NSURL* parsedURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:[self parseQueryString:[parsedURL query]]];
	if (params) {
		[paramsDic setValuesForKeysWithDictionary:params];
	}
	
	NSMutableString *signString = [NSMutableString stringWithString:[[AppDelegate instance] appKey]];
	NSMutableString *paramsString = [NSMutableString stringWithFormat:@"appkey=%@", [[AppDelegate instance] appKey]];
	NSArray *sortedKeys = [[paramsDic allKeys] sortedArrayUsingSelector: @selector(compare:)];
	for (NSString *key in sortedKeys) {
		[signString appendFormat:@"%@%@", key, [paramsDic objectForKey:key]];
		[paramsString appendFormat:@"&%@=%@", key, [paramsDic objectForKey:key]];
	}
	[signString appendString:[[AppDelegate instance] appSecret]];
	unsigned char digest[CC_SHA1_DIGEST_LENGTH];
	NSData *stringBytes = [signString dataUsingEncoding: NSUTF8StringEncoding];
	if (CC_SHA1([stringBytes bytes], [stringBytes length], digest)) {
		/* SHA-1 hash has been calculated and stored in 'digest'. */
		NSMutableString *digestString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH];
		for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
			unsigned char aChar = digest[i];
			[digestString appendFormat:@"%02X", aChar];
		}
		[paramsString appendFormat:@"&sign=%@", [digestString uppercaseString]];
		return [NSString stringWithFormat:@"%@://%@%@?%@", [parsedURL scheme], [parsedURL host], [parsedURL path], [paramsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	} else {
		return nil;
	}
}

@end
