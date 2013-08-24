//
//  Categories.h
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categories : NSObject

@property (nonatomic, strong) NSString *category_name;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
