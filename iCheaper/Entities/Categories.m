//
//  Categories.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "Categories.h"

@implementation Categories

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _category_name = [attributes valueForKeyPath:@"category_name"];
    
    return self;
}

@end
