//
//  Cities.h
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject

@property (nonatomic, strong) NSString *city_name;
@property (nonatomic, strong) NSMutableArray *districts;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
