//
//  Coupons.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "Coupons.h"

@implementation Coupons

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
//    _auto_id = [[attributes valueForKeyPath:@"auto_id"] integerValue];
    _coupon_id = [[attributes valueForKeyPath:@"coupon_id"] integerValue];
    _title = [attributes valueForKeyPath:@"title"];
    _description = [attributes valueForKeyPath:@"description"];
    _regions = [attributes valueForKeyPath:@"regions"];
    _categories = [attributes valueForKeyPath:@"categories"];
    _download_count = [[attributes valueForKeyPath:@"download_count"] integerValue];
    _publish_date = [attributes valueForKeyPath:@"publish_date"];
    _expiration_date = [attributes valueForKeyPath:@"expiration_date"];
    _distance = [[attributes valueForKeyPath:@"distance"] integerValue];
    _coupon_url = [attributes valueForKeyPath:@"coupon_url"];
    _coupon_h5_url = [attributes valueForKeyPath:@"coupon_h5_url"];
    _businesses = [attributes valueForKeyPath:@"businesses"];
    
    // the value isn't got from remoted json, empty value for default.
    _businessLogoImage = @"";
    
    return self;
}

- (BOOL)businessLogoImageIsEmpty
{
    if (_businessLogoImage == nil || [_businessLogoImage isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

@end
