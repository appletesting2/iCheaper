//
//  ViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "ViewController+Datasource.h"

static NSString *kSearchCouponCell = @"SearchCouponCell";

@implementation ViewController (Datasource)

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == kNormalTableViewTag) {
        return [self.couponsArray count];
    }
    return [self.searchCouponsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCouponCell = @"CouponCell";
    
    CouponCell *cell;
    Coupons *coupon;
    
    if (tableView.tag == kNormalTableViewTag)
    {
        cell = (CouponCell *)[tableView dequeueReusableCellWithIdentifier:kCouponCell];
        if (cell == nil)
        {
            cell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCouponCell];
        }
        
        if (indexPath.row < self.couponsArray.count)
        {
            coupon = self.couponsArray[indexPath.row];
        }
    }
    else
    {
        cell = (CouponCell *)[tableView dequeueReusableCellWithIdentifier:kSearchCouponCell];
        if (cell == nil)
        {
            cell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSearchCouponCell];
        }
        
        if (indexPath.row < self.couponsArray.count)
        {
            coupon = self.searchCouponsArray[indexPath.row];
        }
    }

    if (coupon == nil)
    {
        return nil;
    }
    
    [cell setTitleText:coupon.title];
    [cell setSubTitleText:coupon.description];
    [cell setDownloadCount:coupon.download_count];
    [cell setDistanceLabelText:coupon.distance];
    
    if ([coupon.categories count] > 0 && [coupon.regions count] > 0) {
        [cell setCategoryText:[NSString stringWithFormat:@"%@ %@", coupon.categories[0], coupon.regions[0]]];
    }
    
    if (![coupon businessLogoImageIsEmpty])
    {
        [cell setLogoImage:coupon.businessLogoImage];
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
                    [cell setLogoImage:business.s_photo_url];
                }
            }];
        }
    }
    
    return cell;
}

@end
