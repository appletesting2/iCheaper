//
//  Coupons.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coupons : NSObject

//@property (nonatomic, assign) NSUInteger auto_id;
@property (nonatomic, assign) NSUInteger coupon_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *activityDescription;
@property (nonatomic, strong) NSMutableArray *regions;
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, assign) NSUInteger download_count;
@property (nonatomic, strong) NSString *publish_date;
@property (nonatomic, strong) NSString *expiration_date;
@property (nonatomic, assign) NSUInteger distance;
@property (nonatomic, strong) NSString *coupon_url;
@property (nonatomic, strong) NSString *coupon_h5_url;
@property (nonatomic, strong) NSMutableArray *businesses;
@property (nonatomic, strong) NSString *businessLogoImage;  // Use for main page showing.

- (id)initWithAttributes:(NSDictionary *)attributes;

- (BOOL)businessLogoImageIsEmpty;

@end
