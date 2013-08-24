//
//  MyCouponsController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MyCouponsController+Datasource.h"

@implementation MyCouponsController (Datasource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kMyCouponCellTop = @"MyCouponCellTop";
    static NSString *kMyCouponCellCenter = @"MyCouponCellCenter";
    static NSString *kMyCouponCellBottom = @"MyCouponCellBottom";
    //static NSString *kMyCouponCellSingle = @"MyCouponCellSingle";
    
    CouponCell *myCouponCell;
    Coupons *coupon = self.contentArray[indexPath.row];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            myCouponCell = [tableView dequeueReusableCellWithIdentifier:kMyCouponCellTop];
            if (myCouponCell == nil)
            {
                myCouponCell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCouponCellTop];
            }
        }
        else if (indexPath.row == [self.contentArray count] - 1)
        {
            myCouponCell = [tableView dequeueReusableCellWithIdentifier:kMyCouponCellBottom];
            if (myCouponCell == nil)
            {
                myCouponCell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCouponCellBottom];
            }
        }
        else
        {
            myCouponCell = [tableView dequeueReusableCellWithIdentifier:kMyCouponCellCenter];
            if (myCouponCell == nil)
            {
                myCouponCell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCouponCellCenter];
            }
        }
    }
    
    [myCouponCell setTitleText:coupon.title];
    [myCouponCell setSubTitleText:coupon.description];
    [myCouponCell setDownloadCount:coupon.download_count];
    [myCouponCell setDistanceLabelText:coupon.distance];
    
    if ([coupon.categories count] > 0 && [coupon.regions count] > 0) {
        [myCouponCell setCategoryText:[NSString stringWithFormat:@"%@ %@", coupon.categories[0], coupon.regions[0]]];
    }
    
    if (![coupon businessLogoImageIsEmpty])
    {
//        NSLog(@"businessLogoImage is not Empty");
        [myCouponCell setLogoImage:coupon.businessLogoImage];
    }
    else
    {
        if ([coupon.businesses count] > 0)
        {
            NSUInteger nBusinessID = [[coupon.businesses[0] valueForKeyPath:@"id"] integerValue];
            [[RetrieveData sharedInstance] retrieveBusiness:nBusinessID WithBlock:^(Businesses *business, NSError *error) {
                if (error == nil)
                {
                    coupon.businessLogoImage = business.s_photo_url;
                    [myCouponCell setLogoImage:business.s_photo_url];
                }
            }];
        }
    }
    
    return myCouponCell;
}
@end
