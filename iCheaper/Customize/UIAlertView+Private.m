//
//  UIAlertView+Private.m
//  iCheaper
//
//  Created by twb on 13-6-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "UIAlertView+Private.h"

@implementation UIAlertView (Private)

+ (void)showTitle:(NSString *)title Content:(NSString *)content
{
    [[[UIAlertView alloc] initWithTitle:title message:content delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}

@end
