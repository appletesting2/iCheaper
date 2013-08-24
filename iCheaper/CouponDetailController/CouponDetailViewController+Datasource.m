//
//  CouponDetailViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "CouponDetailViewController+Datasource.h"

@implementation CouponDetailViewController (Datasource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [businessArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kDetailCouponCellTop = @"CouponDetailCellTop";
    static NSString *kDetailCouponCellCenter = @"CouponDetailCellCenter";
    static NSString *kDetailCouponCellBottom = @"CouponDetailCellBottom";
    
    DetailCouponCell *couponCell;
    
    if (indexPath.row == 0)
    {
        couponCell = [tableView dequeueReusableCellWithIdentifier:kDetailCouponCellTop];
        if (couponCell == nil)
        {
            couponCell = [[DetailCouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDetailCouponCellTop];
        }
    }
    else if (indexPath.row == [businessArray count] - 1)
    {
        couponCell = [tableView dequeueReusableCellWithIdentifier:kDetailCouponCellBottom];
        if (couponCell == nil)
        {
            couponCell = [[DetailCouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDetailCouponCellBottom];
        }
    }
    else
    {
        couponCell = [tableView dequeueReusableCellWithIdentifier:kDetailCouponCellCenter];
        if (couponCell == nil)
        {
            couponCell = [[DetailCouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDetailCouponCellCenter];
        }
    }
    
    [couponCell setTitleLabelText:[businessArray[indexPath.row] valueForKeyPath:@"name"]];
    [couponCell setAddressLabelText:[businessArray[indexPath.row] valueForKeyPath:@"url"]];
    
    return couponCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"适合商户";
    }
    return nil;
}

@end
