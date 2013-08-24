//
//  MyCouponsController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MyCouponsController+Delegate.h"
#import "UIViewController+ShareIntance.h"

@implementation MyCouponsController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return kMyCouponsTableViewCellHeight;
    return kCouponCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 45.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TTTableViewHeaderView *headerView = [[TTTableViewHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 30.0f)];
    [headerView setTitleText:[NSString stringWithFormat:@"我的收藏(%d)", [self.contentArray count]]];
    [headerView setTitleImage:@"icon_ticket.png"];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [self.UIManager showFavoriteCouponDetailController:self.contentArray[indexPath.row]];
    }
}

@end
