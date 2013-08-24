//
//  Businesses.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Businesses : NSObject

//@property (nonatomic, assign) NSUInteger auto_id;
@property (nonatomic, assign) NSUInteger business_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *branch_name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSMutableArray *regions;
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, assign) NSUInteger avg_rating;
@property (nonatomic, strong) NSString *rating_img_url;
@property (nonatomic, strong) NSString *rating_s_img_url;
@property (nonatomic, assign) NSUInteger product_grade;
@property (nonatomic, assign) NSUInteger decoration_grade;
@property (nonatomic, assign) NSUInteger service_grade;
@property (nonatomic, assign) NSUInteger review_count;
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, strong) NSString *business_url;
@property (nonatomic, strong) NSString *photo_url;
@property (nonatomic, strong) NSString *s_photo_url;
@property (nonatomic, assign) NSUInteger has_coupon;
@property (nonatomic, assign) NSUInteger coupon_id;
@property (nonatomic, strong) NSString *coupon_description;
@property (nonatomic, strong) NSString *coupon_url;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
