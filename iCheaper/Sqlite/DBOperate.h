//
//  DBOperate.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLimitMax 10

@interface DBOperate : NSObject

+ (void)saveCouponsData:(NSArray *)data;
+ (void)saveBusinessesData:(NSArray *)data;

+ (NSMutableArray *)readCouponsFromDB;

@end
