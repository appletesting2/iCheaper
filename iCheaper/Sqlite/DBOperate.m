//
//  DBOperate.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DBOperate.h"
#import "Database.h"
#import "Coupons.h"
#import "Businesses.h"

#define kCityTableArgs @"cityname, regions "
#define kCouponTableArgs @"coupon_id, title, description, regions, categories, download_count, publish_date, expiration_date, distance, coupon_url, businesses "
#define kBusinessTableArgs @"business_id, name, branch_name, address, telephone, city, regions, categories, latitude, longitude, avg_rating, rating_img_url, rating_s_img_url, product_grade, decoration_grade, service_grade, review_count,  distance, business_url, photo_url, s_photo_url, has_coupon, coupon_id, coupon_description, coupon_url "

@implementation DBOperate

+ (void)saveBusinessesData:(NSArray *)data
{
    if ([data count] == 0) {
        //
        NSLog(@"saveShopsData: Parameter data is nil");
        return;
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:kDatabasePath];
    if (![db open]) {
        NSLog(@"saveShopsData open database failure.");
    }
    
    for (Businesses *business in data) {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@(%@) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", kBusinessTableName, kBusinessTableArgs];
        
        [db executeUpdate:sql, @(business.business_id), business.name, business.branch_name, business.regions, business.categories, business.latitude, business.longitude, @(business.avg_rating), business.rating_img_url, business.rating_s_img_url, @(business.product_grade), @(business.decoration_grade), @(business.service_grade), @(business.review_count), @(business.distance), business.business_url, business.photo_url, business.s_photo_url, @(business.has_coupon), @(business.coupon_id), business.coupon_description, business.coupon_url];
    }
    
    [db close];
}

+ (void)saveCouponsData:(NSArray *)data
{
    if ([data count] == 0) {
        //
        NSLog(@"saveShopsData: Parameter data is nil");
        return;
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:kDatabasePath];
    if (![db open]) {
        NSLog(@"saveShopsData open database failure.");
    }
    
    for (Coupons *coupon in data) {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@(%@) VALUES(?,?,?,?,?,?,?,?,?,?,?)", kCouponTableName, kCouponTableArgs];
        
        [db executeUpdate:sql, @(coupon.coupon_id), coupon.title, coupon.description, coupon.regions, coupon.categories, @(coupon.download_count), coupon.publish_date, coupon.expiration_date, @(coupon.distance), coupon.coupon_url, coupon.businesses];
    }
    
    [db close];
}

+ (NSMutableArray *)readCouponsFromDB
{
    FMDatabase *db = [FMDatabase databaseWithPath:kDatabasePath];
    if (![db open]) {
        NSLog(@"readRecommendDataFromDB open database failure.");
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    NSString *sql = [NSString stringWithFormat:@"Select * from %@", kCouponTableName];
//    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [db executeQuery:sql];
    while ([rs next]) {
        
        Coupons *coupon = [[Coupons alloc] initWithAttributes:[rs resultDictionary]];
        [array addObject:coupon];
    }
    
    [db close];
    
    return array;
}

@end
