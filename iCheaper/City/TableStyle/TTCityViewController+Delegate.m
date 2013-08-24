//
//  TTCityViewController+Delegate.m
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCityViewController+Delegate.h"

@implementation TTCityViewController (Delegate)
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // save region.
    [fc setRegion:kGetDistrictName(indexPath)];
    [fc setCity:sortedCityKeys[indexPath.section]];
    [self.delegate selectedCityName:kGetDistrictName(indexPath)];
    [self closeCitySetting:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 45.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TTTableViewHeaderView *headerView = [[TTTableViewHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 30.0f)];
    headerView.delegate = self;
    [headerView setTitleText:[[supportCities objectAtIndex:section] city_name]];
    [headerView setTitleImage:@"icon_ticket.png"];
    return headerView;
}

#pragma mark - SelectCityInHeaderDelegate

- (void)selectCityInHeader:(NSString *)cityName
{
    // clear region
    [fc setRegion:@""];
    // save city
    [fc setCity:cityName];
    
    [self.delegate selectedCityName:cityName];
    [self closeCitySetting:nil];
}

@end
