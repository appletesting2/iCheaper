//
//  NearCouponsFCViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NearCouponsFCViewController+Delegate.h"

@implementation NearCouponsFCViewController (Delegate)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [filterRowHeightArray[indexPath.section] floatValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == kNearCouponsSort)
    {
        // because index from 1 to 5.
        [fc setNearCouponSort:indexPath.row + 1];
        
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
    else if (indexPath.section == kNearCouponsRadius)
    {
        // do something in cell.
    }
}
@end
