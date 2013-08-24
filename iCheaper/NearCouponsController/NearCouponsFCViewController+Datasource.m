//
//  NearCouponsFCViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NearCouponsFCViewController+Datasource.h"

@implementation NearCouponsFCViewController (Datasource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [filterSectionArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return filterSectionArray[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [filterRowsInSection[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kSelectNearCouponsDistanceCell = @"SelectDistanceCell";
    static NSString *kSelectNearCouponsSortCellTop = @"SelectSortNearCouponsCellTop";
    static NSString *kSelectSortNearCouponsCellCenter = @"SelectSortNearCouponsCellCenter";
    static NSString *kSelectSortNearCouponsCellBottom = @"SelectSortNearCouponsCellBottom";
    
    if (indexPath.section == kNearCouponsRadius)
    {
        SelectDistanceCell *distanceCell = [tableView dequeueReusableCellWithIdentifier:kSelectNearCouponsDistanceCell];
        if (distanceCell == nil)
        {
            distanceCell = [[SelectDistanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectNearCouponsDistanceCell];
        }
        return distanceCell;
    }
    else if (indexPath.section == kNearCouponsSort)
    {
        SelectSortCell *sortCell;
        if (indexPath.row == 0)
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectNearCouponsSortCellTop];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectNearCouponsSortCellTop];
            }
        }
        else if (indexPath.row == 6)
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectSortNearCouponsCellBottom];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectSortNearCouponsCellBottom];
            }
        }
        else
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectSortNearCouponsCellCenter];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectSortNearCouponsCellCenter];
            }
        }
        
        // default including check mark.
        if (indexPath.row == ([fc nearCouponSort] - 1))
        {
            [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
            [sortCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
        else
        {
            [sortCell setAccessoryType:UITableViewCellAccessoryNone];
        }
        
        [sortCell setSortTitleLabelText:sortStringArray[indexPath.row]];
        return sortCell;
    }
    
    return nil;
}


@end
