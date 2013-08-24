//
//  Businesses.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "Businesses.h"

@implementation Businesses
- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _business_id = [[attributes valueForKeyPath:@"business_id"] integerValue];
    _name = [attributes valueForKeyPath:@"name"];
    _branch_name = [attributes valueForKeyPath:@"branch_name"];
    _address = [attributes valueForKeyPath:@"address"];
    _telephone = [attributes valueForKeyPath:@"telephone"];
    _city = [attributes valueForKeyPath:@"city"];
    _regions = [attributes valueForKeyPath:@"regions"];
    _categories = [attributes valueForKeyPath:@"categories"];
    _latitude = [attributes valueForKeyPath:@"latitude"];
    _longitude = [attributes valueForKeyPath:@"longitude"];
    _avg_rating = [[attributes valueForKeyPath:@"avg_rating"] integerValue];
    _rating_img_url = [attributes valueForKeyPath:@"rating_img_url"];
    _rating_s_img_url = [attributes valueForKeyPath:@"rating_s_img_url"];
    _product_grade = [[attributes valueForKeyPath:@"product_grade"] integerValue];
    _decoration_grade = [[attributes valueForKeyPath:@"decoration_grade"] integerValue];
    _service_grade = [[attributes valueForKeyPath:@"service_grade"] integerValue];
    _review_count = [[attributes valueForKeyPath:@"review_count"] integerValue];
    _distance = [[attributes valueForKeyPath:@"distance"] integerValue];
    _business_url = [attributes valueForKeyPath:@"business_url"];
    _photo_url = [attributes valueForKeyPath:@"photo_url"];
    _s_photo_url = [attributes valueForKeyPath:@"s_photo_url"];
    _has_coupon = [[attributes valueForKeyPath:@"has_coupon"] integerValue];
    _coupon_id = [[attributes valueForKeyPath:@"coupon_id"] integerValue];
    _coupon_description = [attributes valueForKeyPath:@"coupon_description"];
    _coupon_url = [attributes valueForKeyPath:@"coupon_url"];
    
    return self;
}
@end
