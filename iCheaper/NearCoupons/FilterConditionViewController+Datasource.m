//
//  FilterConditionViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FilterConditionViewController+Datasource.h"

@implementation FilterConditionViewController (Datasource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [filterSectionArray count];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return filterSectionArray[section];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [filterRowsInSection[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kSelectDistanceCell = @"SelectDistanceCell";
    static NSString *kSelectSortCellTop = @"SelectSortCellTop";
    static NSString *kSelectSortCellCenter = @"SelectSortCellCenter";
    static NSString *kSelectSortCellBottom = @"SelectSortCellBottom";
    //static NSString *kSelectKeywordCell = @"SelectKeywordCell";
    static NSString *kSelectRegionCell = @"SelectRegionCell";
    
    if (indexPath.section == kREGION)
    {
//        SelectRegionCell *regionCell = [tableView dequeueReusableCellWithIdentifier:kSelectRegionCell forIndexPath:indexPath];
        SelectRegionCell *regionCell = [tableView dequeueReusableCellWithIdentifier:kSelectRegionCell];
        if (regionCell == nil)
        {
            regionCell = [[SelectRegionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectRegionCell];
        }
        
        // just for defualt city or district.        
        [regionCell setRegionTitleLabelText:[fc getAreaText]];
        
        return regionCell;
    }
//    else if (indexPath.section == kKEYWORD)
//    {
//        SelectKeywordCell *keywordCell = [tableView dequeueReusableCellWithIdentifier:kSelectKeywordCell forIndexPath:indexPath];
//        return keywordCell;
//    }
    else if (indexPath.section == kRADIUS)
    {
        SelectDistanceCell *distanceCell = [tableView dequeueReusableCellWithIdentifier:kSelectDistanceCell];
        if (distanceCell == nil)
        {
            distanceCell = [[SelectDistanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectDistanceCell];
        }
        [distanceCell setDistanceEnable:[fc isDistanceOn]];
        return distanceCell;
    }
    else if (indexPath.section == kSORT)
    {
        SelectSortCell *sortCell;
        if (indexPath.row == 0)
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectSortCellTop];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectSortCellTop];
            }
        }
        else if (indexPath.row == 4)
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectSortCellBottom];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectSortCellBottom];
            }
        }
        else
        {
            sortCell = [tableView dequeueReusableCellWithIdentifier:kSelectSortCellCenter];
            if (sortCell == nil)
            {
                sortCell = [[SelectSortCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectSortCellCenter];
            }
        }
        
        // default including check mark.
        if (indexPath.row == ([fc sort] - 1))
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
