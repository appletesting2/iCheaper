//
//  Database.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "Database.h"

#define kCityTableSql @"CREATE TABLE IF NOT EXISTS [Coupons] (\
[auto_id] INTEGER PRIMARY KEY AUTOINCREMENT,\
[cityname] VARCHAR(80) NOT NULL,\
[regions] VARCHAR(100) NOT NULL,\
[updatetimestamp] INTEGER DEFAULT (strftime('%s','now')-strftime('%s','2013-01-06 15:15:06')),\
[adddate] VARCHAR DEFAULT (date('now'))\
);"



#define kCouponTableSql @"CREATE TABLE IF NOT EXISTS [Coupons] (\
[auto_id] INTEGER PRIMARY KEY AUTOINCREMENT,\
[coupon_id] INTEGER NOT NULL,\
[title] VARCHAR(80) NOT NULL,\
[description] VARCHAR(500) NOT NULL,\
[regions] VARCHAR(200) NOT NULL,\
[categories] VARCHAR(500) NOT NULL,\
[download_count] INTEGER,\
[publish_date] VARCHAR(100),\
[expiration_date] VARCHAR(100),\
[distance] INTEGER DEFAULT 0,\
[coupon_url] VARCHAR(200),\
[businesses] VARCHAR(800),\
[isFavorite] BOOL DEFAULT 0,\
[isAddToPassbook] BOOL DEFAULT 0,\
[updatetimestamp] INTEGER DEFAULT (strftime('%s','now')-strftime('%s','2013-01-06 15:15:06')),\
[adddate] VARCHAR DEFAULT (date('now'))\
);"

#define kBusinessTableSql @"CREATE TABLE IF NOT EXISTS [Businesses] (\
[auto_id] INTEGER PRIMARY KEY AUTOINCREMENT,\
[business_id] INTEGER NOT NULL,\
[name] VARCHAR(80) NOT NULL,\
[branch_name] VARCHAR(80),\
[address] VARCHAR(120),\
[telephone] VARCHAR(20),\
[city] VARCHAR(20),\
[regions] VARCHAR(100),\
[categories] VARCHAR(100),\
[latitude] DECIMAL,\
[longitude] DECIMAL,\
[avg_rating] INTEGER NOT NULL,\
[rating_img_url] VARCHAR(100),\
[rating_s_img_url] VARCHAR(100),\
[product_grade] INTEGER,\
[decoration_grade] INTEGER,\
[service_grade] INTEGER,\
[review_count] INTEGER,\
[distance] INTEGER,\
[business_url] VARCHAR(100),\
[photo_url] VARCHAR(100),\
[s_photo_url] VARCHAR(100),\
[has_coupon] INTEGER,\
[coupon_id] INTEGER,\
[coupon_description] VARCHAR(100),\
[coupon_url] VARCHAR(100),\
[updatetimestamp] INTEGER DEFAULT (strftime('%s','now')-strftime('%s','2013-01-06 15:15:06')),\
[adddate] VARCHAR DEFAULT (date('now'))\
);"


@implementation Database
+ (void)createTable
{
    FMDatabase *db = [FMDatabase databaseWithPath:kDatabasePath];
    [db open];
    [db beginTransaction];
    [db executeUpdate:kCouponTableSql];
    [db executeUpdate:kBusinessTableSql];
    [db commit];
    [db close];
}
@end
