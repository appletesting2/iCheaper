//
//  SelectCategoriesViewController.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectCategoriesViewController.h"
#import "SelectCategoriesViewController+Datasource.h"
#import "SelectCategoriesViewController+Delegate.h"

@interface SelectCategoriesViewController ()

@end

@implementation SelectCategoriesViewController

#pragma mark - setup part.

- (void)setupCategoryImageArray
{
    categoryImageArray = @[
                           @"CategoryIconID_0.png",
                           @"CategoryIconID_1.png",
                           @"CategoryIconID_2.png",
                           @"CategoryIconID_3.png",
                           @"CategoryIconID_5.png",
                           @"CategoryIconID_7.png",
                           @"CategoryIconID_8.png",
                           @"CategoryIconID_6.png",
                           @"CategoryIconID_4.png",
                           @"CategoryIconID_9.png",
                           @"CategoryIconID_10.png",
                           @"CategoryIconID_11.png",
                           @"CategoryIconID_12.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png",
                           @"CategoryIconID_none.png"
                           ];
}


- (void)setupCategories
{
    self.categoryList = [[ToolKit sharedInstance] retrieveCategories];
    self.expandList = [NSMutableArray arrayWithCapacity:0];
    
    for (NSInteger i = 0; i < self.categoryList.count; i++)
    {
        [self.expandList addObject:@(NO)];
    }
}

- (void)retrieveCategories
{
#if 1
    return;
#endif
    [[RetrieveData sharedInstance] retrieveCategoriesWithBlock:^(NSArray *categories, NSError *error) {
        if (error == nil)
        {
            if (categoryArray != nil)
            {
                // firstly remove categories.
                categoryArray = nil;
            }
            
            // default add all channels
            NSDictionary *allChannelDictionary = @{kCategoryNameKey: kDefaultAllCategoryChannel};
            Categories *allChannelCategory = [[Categories alloc] initWithAttributes:allChannelDictionary];
            
            categoryArray = [NSMutableArray arrayWithObject:allChannelCategory];
            [categoryArray addObjectsFromArray:categories];
            
            [self setupTableView];
        }
    }];
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

- (void)setupBarButtonItem
{
    // title
    [[ToolKit sharedInstance] setNavigationController:self title:@"选择频道"];
    
    // left
    NavigationItemButton *leftBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 32.0f)];
    [leftBarItem setButtonTitle:@"返回"];
    [leftBarItem addTarget:self action:@selector(closeCategorySelect:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
}

- (void)setupTableView
{
    if (categoriesTableView != nil)
    {
        [categoriesTableView reloadData];
    }
    else
    {
        categoriesTableView = [[ExpandableTableView alloc] initWithFrame:CGRectMake(kCouponSelectCategoryTableViewPaddingX, kCouponSelectCategoryTableViewPaddingY, kCouponSelectCategoryTableViewWidth, kCouponSelectCategoryTableViewHeight)];
        categoriesTableView.delegate = self;
        categoriesTableView.dataSource = self;
        [categoriesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        categoriesTableView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:categoriesTableView];
    }
}

#pragma mark - event part.

- (void)closeCategorySelect:(id)sender
{
    [self.sidePanelController showCenterPanelAnimated:YES];
}

- (void)registerUpdateCategories
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyUpdateCategories:) name:kNotificationUpdateCategorys object:nil];
}

- (void)unregisterUpdateCategories
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationUpdateCategorys object:nil];
}

- (void)notifyUpdateCategories:(NSNotification *)notification
{
    // only a notification, no need parameters.
    [self retrieveCategories];
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
    
    [self setupCategories];
    
    [self setupTableView];
    
    [self setupBarButtonItem];
    
    [self setupFilterCondition];
    
    [self setupCategoryImageArray];
    
    // use for from no network to having netwrok.
    [self registerUpdateCategories];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self retrieveCategories];
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
