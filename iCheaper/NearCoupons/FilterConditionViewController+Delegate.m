//
//  FilterConditionViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FilterConditionViewController+Delegate.h"


@implementation FilterConditionViewController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [filterRowHeightArray[indexPath.section] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FilterConditionSectionHeader *sectionHeader = [[FilterConditionSectionHeader alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 50.0f)];
    sectionHeader.delegate = self;
    [sectionHeader setSectionTitle:filterSectionArray[section]];
    if (section == kRADIUS)
    {
        [sectionHeader setSectionSwitch:NO];
    }
    return sectionHeader;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == kSORT)
    {
        // because index from 1 to 5.
        [fc setSort:indexPath.row + 1];
        
        // send Notification
        NotificationBody *notificationBody = [[NotificationBody alloc] init];
        notificationBody.tag = kNotificationBodyFromSortToUpdateCoupons;
        notificationBody.body = @(indexPath.row + 1);    // only notification to update coupons.
        [NotificationBody postUpdateCouponsWithNotificationBody:notificationBody];
        
        for (NSUInteger i = 0; i < [sortStringArray count]; i++) {
            NSIndexPath *ip = [NSIndexPath indexPathForRow:(i) inSection:indexPath.section];
            SelectSortCell *sortCell = (SelectSortCell *)[tableView cellForRowAtIndexPath:ip];
            if (i == indexPath.row) {
                [sortCell setAccessoryType:UITableViewCellAccessoryCheckmark];
                continue;
            }
            [sortCell setAccessoryType:UITableViewCellAccessoryNone];
        }
        
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else if (indexPath.section == kRADIUS)
    {
        // do something in cell.
    }
    else if (indexPath.section == kREGION)
    {
        if (![[TTCheckNetwork sharedInstance] networkIsOK])
        {
            // show tips : network is not regular.
            [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
            return;
        }
        
        TTCityViewController *cityController = [[TTCityViewController alloc] initWithNibName:nil bundle:nil];
        cityController.delegate = self;
        NavigationController *nav = [[NavigationController alloc] initWithRootViewController:cityController];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }
}

#pragma mark - FCSectionSwitchValueChangedDelegate

- (void)sectionSwitchChanged:(BOOL)isOn
{
    // retrieve cell
    SelectDistanceCell *cell = (SelectDistanceCell *)[conditionTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:kRADIUS]];
    [fc setIsDistanceOn:isOn];
    [cell setDistanceEnable:isOn];
}

//
#pragma mark - TTSelectCityDelegate
- (void)selectedCityName:(NSString *)cityName
{
    SelectRegionCell *regionCell = (SelectRegionCell *)[conditionTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:kREGION]];
    [regionCell setRegionTitleLabelText:cityName];
    
    // notification main right bar button item. send Notification
    NotificationBody *notificationBody = [[NotificationBody alloc] init];
    notificationBody.tag = kNotificationBodyFromFilterConditionToUpdateCities;
    notificationBody.body = [fc getAreaText];    // only notification to update cities.
    [NotificationBody postUpdateCouponsWithNotificationBody:notificationBody];
}

@end
