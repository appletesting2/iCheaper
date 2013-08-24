//
//  DownloadCountColor.h
//  iCheaper
//
//  Created by twb on 13-4-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadCountColor : NSObject

+ (UIColor *)getTextColorWithCount:(NSUInteger)count;
+ (UIColor *)getBackgroundColorWithCount:(NSUInteger)count;

@end
