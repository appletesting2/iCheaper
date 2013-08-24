//
//  Cities.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "Cities.h"

@implementation Cities
- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _city_name = [attributes valueForKeyPath:@"city_name"];
    _districts = [attributes valueForKeyPath:@"districts"];
    
    return self;
}

@end
