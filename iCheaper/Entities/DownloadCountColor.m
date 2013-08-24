//
//  DownloadCountColor.m
//  iCheaper
//
//  Created by twb on 13-4-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DownloadCountColor.h"

@implementation DownloadCountColor

+ (UIColor *)getTextColorWithCount:(NSUInteger)count
{
//    if (count < 500)
//    {
//        return [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 1000 && count >= 500)
//    {
//        return [UIColor colorWithRed:0.4f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 2000 && count >= 1000)
//    {
//        return [UIColor colorWithRed:0.4f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 8000 && count >= 2000)
//    {
//        return [UIColor colorWithRed:0.3f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 15000 && count >= 8000)
//    {
//        return [UIColor colorWithRed:0.2f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 25000 && count >= 15000)
//    {
//        return [UIColor colorWithRed:0.1f green:0.5f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 50000 && count >= 25000)
//    {
//        return [UIColor colorWithRed:0.4f green:0.4f blue:0.5f alpha:1.0f];
//    }
//    else if (count < 100000 && count >= 50000)
//    {
//        return [UIColor colorWithRed:0.4f green:0.3f blue:0.5f alpha:1.0f];
//    }
//    else
//    {
//        return [UIColor colorWithRed:0.4f green:0.2f blue:0.5f alpha:1.0f];
//    }
    
    return [UIColor whiteColor];
}

+ (UIColor *)getBackgroundColorWithCount:(NSUInteger)count
{
    if (count < 500)
    {
        return [UIColor lightGrayColor];
    }
    else if (count < 1000 && count >= 500)
    {
        return [UIColor darkGrayColor];
    }
    else if (count < 2000 && count >= 1000)
    {
        return [UIColor orangeColor];
    }
    else if (count < 8000 && count >= 2000)
    {
        return [UIColor purpleColor];
    }
    else if (count < 15000 && count >= 8000)
    {
        return [UIColor colorWithWhite:0.2f alpha:1.0f];
    }
    else if (count < 25000 && count >= 15000)
    {
        return [UIColor brownColor];
    }
    else if (count < 50000 && count >= 25000)
    {
        return [UIColor magentaColor];
    }
    else if (count < 100000 && count >= 50000)
    {
        return [UIColor yellowColor];
    }
    else
    {
        return [UIColor redColor];
    }
}

@end
