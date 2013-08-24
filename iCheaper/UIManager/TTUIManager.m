//
//  TTUIManager.m
//  iCheaper
//
//  Created by twb on 13-6-15.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTUIManager.h"
#import "TabBarController.h"
#import "MyCouponsController.h"
#import "MoreInfoController.h"
#import "JASidePanelController.h"
#import "CouponDetailViewController.h"
#import "PartnerViewController.h"

#import "Coupons.h"
#import "TTCheckNetwork.h"
#import "ToolKit.h"


@implementation TTUIManager
{
    TabBarController *_rootViewController;
}

- (id)init
{
    self = [super init];
    if (self)
    {
		_rootViewController = [[TabBarController alloc] initWithNibName:nil bundle:nil];
    }
    return self;
}

- (void)switchToViewController:(UIViewController *)vc animated:(BOOL) animated
{
	[_rootViewController setViewControllers:@[vc] animated:animated];
}

// Show Coupon Detail
- (void)showCouponDetailController:(Coupons *)coupon
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
    }
    
    CouponDetailViewController *detailController = [[CouponDetailViewController alloc] initWithNibName:nil bundle:nil];
    [detailController setCoupon:coupon];
    [detailController setFromTag:kFromMainController];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel setNavigationBarHidden:NO animated:NO];
    [[ToolKit sharedInstance] hideTabBar:_rootViewController.panelViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel pushViewController:detailController animated:YES];
}

- (void)exitCouponDetailController
{
    [[ToolKit sharedInstance] showTabBar:_rootViewController.panelViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel popViewControllerAnimated:YES];
}

// Show Near Coupon Detail
- (void)showNearCouponDetailController:(Coupons *)coupon
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
    }
    
    CouponDetailViewController *detailController = [[CouponDetailViewController alloc] initWithNibName:nil bundle:nil];
    [detailController setCoupon:coupon];
    [detailController setFromTag:kFromNearController];
    [(UINavigationController *)_rootViewController.panelNearCouponViewController.centerPanel setNavigationBarHidden:NO animated:NO];
    [[ToolKit sharedInstance] hideTabBar:_rootViewController.panelNearCouponViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelNearCouponViewController.centerPanel pushViewController:detailController animated:YES];
}

- (void)exitNearCouponDetailController
{
    [[ToolKit sharedInstance] showTabBar:_rootViewController.panelNearCouponViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelNearCouponViewController.centerPanel popViewControllerAnimated:YES];
}

// My Favorite Coupon Detail
- (void)showFavoriteCouponDetailController:(Coupons *)coupon
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
    }
    
    CouponDetailViewController *detailController = [[CouponDetailViewController alloc] initWithNibName:nil bundle:nil];
    [detailController setCoupon:coupon];
    [detailController setFromTag:kFromMyFavoriteController];
    [(UINavigationController *)_rootViewController.panelNearCouponViewController.centerPanel setNavigationBarHidden:NO animated:NO];
    [[ToolKit sharedInstance] hideTabBar:_rootViewController.panelNearCouponViewController.centerPanel.tabBarController];
    [_rootViewController.myCouponsController.navigationController pushViewController:detailController animated:YES];
}

- (void)exitFavoriteCouponDetailController
{
    [[ToolKit sharedInstance] showTabBar:_rootViewController.panelNearCouponViewController.centerPanel.tabBarController];
    [_rootViewController.myCouponsController.navigationController popViewControllerAnimated:YES];
}

// Partner
- (void)showPartnerController
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
//        return;
    }
    
    PartnerViewController *partners = [[PartnerViewController alloc] initWithNibName:nil bundle:nil];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel setNavigationBarHidden:NO animated:NO];
    [[ToolKit sharedInstance] hideTabBar:_rootViewController.panelViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel pushViewController:partners animated:YES];
}

- (void)exitPartnerController
{
    [[ToolKit sharedInstance] showTabBar:_rootViewController.panelViewController.centerPanel.tabBarController];
    [(UINavigationController *)_rootViewController.panelViewController.centerPanel popViewControllerAnimated:YES];
}


@end
