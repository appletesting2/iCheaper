//
//  TabBarController.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TabBarController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "SelectCategoriesViewController.h"
#import "FilterConditionViewController.h"
#import "NearCouponsFCViewController.h"

#import "ViewController.h"
#import "NearCouponsController.h"
#import "MyCouponsController.h"
#import "MoreInfoController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupTabBarSkin];
    
    [self setupTabBarControllerContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - setup part.

- (void)setupTabBarSkin
{
    UIImage *tabBackground = [[UIImage imageNamed:@"TabBg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UITabBar appearance] setBackgroundImage:tabBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage imageNamed:@"TabSelected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10.0f, 0, 10.0f)]];
}

- (void)setupTabBarControllerContent
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                kTabBarTitleColor, UITextAttributeTextColor,
                                //                                [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.9], UITextAttributeTextShadowColor,
                                //                                [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
                                //                                [UIFont boldSystemFontOfSize:12.0f], UITextAttributeFont,
                                nil];
    
    UITabBarItem *allCoupons = [[UITabBarItem alloc] initWithTitle:@"全部优惠" image:nil tag:kTabBarItemFirstTag];
    [allCoupons setTitleTextAttributes:dictionary forState:UIControlStateNormal];
    [allCoupons setFinishedSelectedImage:[UIImage imageNamed:@"TabSearchSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"TabSearch.png"]];
    
    UITabBarItem *nearCoupons = [[UITabBarItem alloc] initWithTitle:@"最近" image:nil tag:kTabBarItemSecondTag];
    [nearCoupons setTitleTextAttributes:dictionary forState:UIControlStateNormal];
    [nearCoupons setFinishedSelectedImage:[UIImage imageNamed:@"TabCheckinSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"TabCheckin.png"]];
    
    UITabBarItem *myCoupons = [[UITabBarItem alloc] initWithTitle:@"我的收藏" image:nil tag:kTabBarItemThirdTag];
    [myCoupons setTitleTextAttributes:dictionary forState:UIControlStateNormal];
    [myCoupons setFinishedSelectedImage:[UIImage imageNamed:@"TabMeSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"TabMe.png"]];
    
    UITabBarItem *moreInfo = [[UITabBarItem alloc] initWithTitle:@"更多" image:nil tag:kTabBarItemFourthTag];
    [moreInfo setTitleTextAttributes:dictionary forState:UIControlStateNormal];
    [moreInfo setFinishedSelectedImage:[UIImage imageNamed:@"TabMoreSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"TabMore.png"]];
    
    /*
     * First
     *
     */
    // left - category
    SelectCategoriesViewController *categoryController = [[SelectCategoriesViewController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navCategory = [[NavigationController alloc] initWithRootViewController:categoryController];
    
    // center - coupons
    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    NavigationController *navController = [[NavigationController alloc] initWithRootViewController:viewController];
    
    // right - filter conditions
    FilterConditionViewController *filterConditionController = [[FilterConditionViewController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navFilterCondition = [[NavigationController alloc] initWithRootViewController:filterConditionController];
    
    self.panelViewController = [[JASidePanelController alloc] init];
    self.panelViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    self.panelViewController.centerPanel = navController;
    self.panelViewController.leftPanel = navCategory;
    self.panelViewController.rightPanel = navFilterCondition;
    self.panelViewController.tabBarItem = allCoupons;
    
    /*
     * Second
     */
    // left - category
    SelectCategoriesViewController *categoryController2 = [[SelectCategoriesViewController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navCategory2 = [[NavigationController alloc] initWithRootViewController:categoryController2];
    
    // center
    NearCouponsController *nearCouponsController = [[NearCouponsController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navNearCoupons = [[NavigationController alloc] initWithRootViewController:nearCouponsController];
    
    // right
    NearCouponsFCViewController *nearCouponsFCController = [[NearCouponsFCViewController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navNearFCCoupons = [[NavigationController alloc] initWithRootViewController:nearCouponsFCController];
    
    
    self.panelNearCouponViewController = [[JASidePanelController alloc] init];
    self.panelNearCouponViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    self.panelNearCouponViewController.centerPanel = navNearCoupons;
    self.panelNearCouponViewController.leftPanel = navCategory2;
    self.panelNearCouponViewController.rightPanel = navNearFCCoupons;
    self.panelNearCouponViewController.tabBarItem = nearCoupons;
    

//    navNearCoupons.tabBarItem = nearCoupons;
    /*
     * Third
     */
    self.myCouponsController = [[MyCouponsController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navMyCoupons = [[NavigationController alloc] initWithRootViewController:self.myCouponsController];
    navMyCoupons.tabBarItem = myCoupons;
    
    /*
     * Fourth
     */
    self.moreInfoController = [[MoreInfoController alloc] initWithNibName:nil bundle:nil];
    NavigationController *navMoreInfo = [[NavigationController alloc] initWithRootViewController:self.moreInfoController];
    navMoreInfo.tabBarItem = moreInfo;
    
    self.viewControllers = @[self.panelViewController, self.panelNearCouponViewController, navMyCoupons, navMoreInfo];
}

@end
