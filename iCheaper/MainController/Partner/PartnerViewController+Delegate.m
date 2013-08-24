//
//  PartnerViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "PartnerViewController+Delegate.h"

@implementation PartnerViewController (Delegate)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        // KFC
        KFCListViewController *kfc = [[KFCListViewController alloc] initWithNibName:nil bundle:nil];
//        [[ToolKit sharedInstance] hideTabBar:self.tabBarController];
        [self.navigationController pushViewController:kfc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        // Mcdonalds
        McdonaldsViewController *mcdonalds = [[McdonaldsViewController alloc] initWithNibName:nil bundle:nil];
//        [[ToolKit sharedInstance] hideTabBar:self.tabBarController];
        [self.navigationController pushViewController:mcdonalds animated:YES];
    }
}
@end
