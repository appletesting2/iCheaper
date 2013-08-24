//
//  FilterConditionViewController.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FilterConditionViewController.h"
#import "FilterConditionViewController+Datasource.h"
#import "FilterConditionViewController+Delegate.h"

@interface FilterConditionViewController ()

@end

@implementation FilterConditionViewController

#pragma mark - setup part.

- (void)setupSortStringArray
{
    sortStringArray = [[ToolKit sharedInstance] retrieveSortStringArray];
}

- (void)setupFilterSectionArray
{    
//    filterSectionArray = @[@"所在区域", @"关键词", @"搜索半径", @"结果排序"];
    filterSectionArray = @[@"所在区域", @"搜索半径", @"结果排序"];
}

- (void)setupFilterRowHeightArray
{
//    filterRowHeightArray = @[@(40.0f), @(40.0f), @(60.0f), @(40.0f)];
    filterRowHeightArray = @[@(40.0f), @(60.0f), @(40.0f)];
}

- (void)setupFilterRowsInSection
{
//    filterRowsInSection = @[@(1), @(1), @(1), @(5)];
    filterRowsInSection = @[@(1), @(1), @(5)];
}

- (void)setupConditionTableView
{
    conditionTableView = [[UITableView alloc] initWithFrame:CGRectMake(kCouponSelectConditionTableViewPaddingX, kCouponSelectConditionTableViewPaddingY, kCouponSelectConditionTableViewWidth, kCouponSelectConditionTableViewHeight) style:UITableViewStyleGrouped];
    conditionTableView.backgroundView = nil;
    conditionTableView.backgroundColor = [UIColor whiteColor];
    conditionTableView.showsVerticalScrollIndicator = NO;
    conditionTableView.delegate = self;
    conditionTableView.dataSource = self;
//    [conditionTableView registerClass:[SelectRegionCell class] forCellReuseIdentifier:kSelectRegionCell];
//    [conditionTableView registerClass:[SelectDistanceCell class] forCellReuseIdentifier:kSelectDistanceCell];
//    [conditionTableView registerClass:[SelectSortCell class] forCellReuseIdentifier:kSelectSortCellTop];
//    [conditionTableView registerClass:[SelectSortCell class] forCellReuseIdentifier:kSelectSortCellCenter];
//    [conditionTableView registerClass:[SelectSortCell class] forCellReuseIdentifier:kSelectSortCellBottom];
    
//    [conditionTableView registerClass:[SelectKeywordCell class] forCellReuseIdentifier:kSelectKeywordCell];
    [self.view addSubview:conditionTableView];
    
//    // add gesture to hide keyboard
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
//    [conditionTableView addGestureRecognizer:tapGesture];
}

- (void)setupBarButtonItem
{
    // title
    [[ToolKit sharedInstance] setNavigationController:self title:@"筛选"];
    
    // right
    NavigationItemButton *rightBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 65.0f, 32.0f)];
    [rightBarItem setButtonTitle:@"返回&重载"];
    [rightBarItem addTarget:self action:@selector(backReloadCoupons:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

#pragma mark - event part.

//- (void)handleTapGesture:(UITapGestureRecognizer *)sender
//{
//    [self.view resignFirstResponder];
//}

- (void)backReloadCoupons:(id)sender
{
    // send Notification
    NotificationBody *notificationBody = [[NotificationBody alloc] init];
    notificationBody.tag = kNotificationBodyFromFilterConditionToUpdateCoupons;
    notificationBody.body = nil;    // only notification to update coupons.
    [NotificationBody postUpdateCouponsWithNotificationBody:notificationBody];
    
    [self.sidePanelController showCenterPanelAnimated:YES];
}

#pragma mark - system part.

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupFilterCondition];
    
    // set related value of table cell.
    [self setupSortStringArray];
    
    [self setupFilterSectionArray];
    
    [self setupFilterRowHeightArray];
    
    [self setupFilterRowsInSection];
    
    [self setupConditionTableView];
    
    [self setupBarButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
