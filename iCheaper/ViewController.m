//
//  ViewController.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Datasource.h"
#import "ViewController+Delegate.h"
#import "UIViewController+ShareIntance.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - system part.

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupFilterCondition];
    
    [self setupCategory];
    
    [self setupLocationManager];
    
    [self setupClearPageNumber];
    
    [self setupClearKeyword];
    
    [self registerNotification];
    
    [self setupContentTableView];
    
    // retrieve data.
    [self retrieveCoupons];
    
    [self setupNavigationItem];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self resetContent];
    
    [self setMapViewAvailable:YES];
    
    // custom cell selected bg image.
    [UIView animateWithDuration:0.5f animations:^{
        CouponCell *cell = (CouponCell *)[_contentTableView cellForRowAtIndexPath:[_contentTableView indexPathForSelectedRow]];
        [cell setCustomBGViewAlpha:0.0f];
    }];
}

- (void)viewDidDisappear:(BOOL)animated;  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
{
    [super viewDidDisappear:animated];
    [self setMapViewAvailable:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part.

- (void)setupLocationManager
{
    // location.
    if (!CLLocationManager.locationServicesEnabled) {
        NSLog(@"CLLocationManager disable.");
    }
    mLocationManager = [[CLLocationManager alloc] init];
    mLocationManager.distanceFilter = [fc radius];
    mLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
}

- (void)setupContentTableView
{
    _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, kNavigationBarShadowOffsetY, kScreenWidth, kContentHeight)];
    _contentTableView.tag = kNormalTableViewTag;
//    [_contentTableView registerClass:[CouponCell class] forCellReuseIdentifier:kCouponCell];
    _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentTableView.backgroundColor = [UIColor whiteColor];
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    
    [self.view addSubview:_contentTableView];
    
    // refresh view relate...
    if (refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame: CGRectMake(0.0f, -_contentTableView.contentSize.height, kScreenWidth, _contentTableView.contentSize.height)];
        //        NSLog(@"%@", NSStringFromCGRect( view.frame ));
		view.delegate = self;
		[_contentTableView addSubview:view];
		refreshHeaderView = view;
	}
	
	//  update the last update date
	[refreshHeaderView refreshLastUpdatedDate];
    
    // Create a search bar
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(kSearchBarPaddingX, kSearchBarPaddingY, kSearchBarWidth, kSearchBarHeight)];
	self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchBar.keyboardType = UIKeyboardTypeDefault;
    self.searchBar.placeholder = NSLocalizedString(@"Main.Searbar.placeholder", nil);//@"输入优惠券名、商户名等";
    
//    self.searchBar.tintColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
	self.searchBar.delegate = self;
	_contentTableView.tableHeaderView = self.searchBar;
	
	// Create the search display controller
	self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchDC.searchResultsTableView.tag = kSearchBarTableViewTag;
	self.searchDC.searchResultsDataSource = self;
	self.searchDC.searchResultsDelegate = self;
    self.searchDC.delegate = self;
}

- (void)resetContent
{
    self.contentTableView.frame = CGRectMake(0.0f, kNavigationBarShadowOffsetY, kScreenWidth, kContentHeight);
}

- (void)setupNavigationItem
{
    // title    
    NSString *title = [[ToolKit sharedInstance] retrieveSortStringTitleArray][[fc sort] - 1];
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:title output:&titleLabel];
    navigationTitleLabel = titleLabel;

    // left
    leftBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 32.0f)];
    if (![fc hasCategoryParam])
    {
        [leftBarItem setButtonTitle:kDefaultAllCategoryChannel];
    }
    else
    {
        [leftBarItem setButtonTitle:[fc category]];
    }
    [leftBarItem addTarget:self action:@selector(selectCategory:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
    
    // right
    rightBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 32.0f)];
    [rightBarItem setButtonTitle:[fc getAreaText]];
    [rightBarItem addTarget:self action:@selector(selectFilterConditions:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

- (void)setupClearPageNumber
{
    // first time, load first page.
    currentPageNumber = kFirstLoadingPageNumber;
    searchPageNumber = kFirstLoadingPageNumber;
    [fc setPage:currentPageNumber];
}

- (void)setupCategory
{
    [fc setCategory:@""];
    [fc setSubCategory:@""];
}

- (void)setupClearKeyword
{
    [fc setKeyword:@""];
}

#pragma mark - event part.

- (void)setMapViewAvailable:(BOOL)isAvailAble
{
    if (isAvailAble) {
        mLocationManager.delegate = self;
        [mLocationManager startUpdatingLocation];
    }else{
        [mLocationManager stopUpdatingLocation];
        mLocationManager.delegate = nil;
    }
}

- (void)registerNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:kNotificationUpdateCoupons object:nil];
}

- (void)unregisterNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationUpdateCoupons object:nil];
}

- (void)handleNotification:(NSNotification *)notification
{
    if (![[notification object] isKindOfClass:[NotificationBody class]]) {
        return;
    }
    
    NotificationBody *notificationBody = [notification object];
    
    if (notificationBody.tag == kNotificationBodyFromCategoryToUpdateCoupons)
    {
        [leftBarItem setButtonTitle:notificationBody.body];
    
        // update coupons.
        [self autoPullDownRefresh];
    }
    else if (notificationBody.tag == kNotificationBodyFromFilterConditionToUpdateCoupons)
    {
        // only update coupons.
        [self autoPullDownRefresh];
    }
    else if (notificationBody.tag == kNotificationBodyFromSortToUpdateCoupons)
    {
        if (![notificationBody.body isKindOfClass:[NSNumber class]])
        {
            return;
        }
        
        NSString *title = [[ToolKit sharedInstance] retrieveSortStringTitleArray][[fc sort] - 1];
        if (navigationTitleLabel != nil)
        {
            [navigationTitleLabel setText:title];
        }
        
        // update coupons.
        [self autoPullDownRefresh];
    }
    else if (notificationBody.tag == kNotificationBodyFromFilterConditionToUpdateCities)
    {
        if (![notificationBody.body isKindOfClass:[NSString class]])
        {
            return;
        }
        
        [rightBarItem setButtonTitle:notificationBody.body];
    }
}

- (void)autoPullDownRefresh
{
    [self.contentTableView setContentOffset:CGPointMake(0.0f, -75.0f) animated:YES];
    [refreshHeaderView performSelector:@selector(egoRefreshScrollViewDidEndDragging:) withObject:self.contentTableView afterDelay:0.5f];
}

- (void)updateCoupons:(UITableView *)tableView
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        // show tips : network is not regular.
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
    }
    else
    {
        [self showProgressWithLabel:@"正在载入..." task:^{
            [self updateCouponsFromRemote:tableView];
        } completion:^{
            
        }];
    }
}

- (void)updateCouponsFromRemote:(UITableView *)tableView
{
    // first remove error tip view , assumed it exists.
    [NetworkNotRegular removeFromSuperView];
    
    [fc setPage:kFirstLoadingPageNumber];
    isLoadMoreDone = NO;
    [[RetrieveData sharedInstance] retrieveCouponsWithBlock:^(NSArray *coupons, NSError *error) {
        
        if (error == nil)
        {
            if (tableView.tag == kNormalTableViewTag)
            {
                if (self.couponsArray != nil)
                {
                    // firstly release current cache data.
                    self.couponsArray = nil;
                }
                
                self.couponsArray = [NSMutableArray arrayWithArray:coupons];
                NSLog(@"self.couponsArray count = %d", [self.couponsArray count]);
                [self.contentTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval];
            }
            else
            {
                if (self.searchCouponsArray != nil)
                {
                    // firstly release current cache data.
                    self.searchCouponsArray = nil;
                }
                
                self.searchCouponsArray = [NSMutableArray arrayWithArray:coupons];
                NSLog(@"self.searchCouponsArray count = %d", [self.couponsArray count]);
                [self.searchDC.searchResultsTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval];
            }
            
            // clear keyword.
            [fc setKeyword:@""];
        }
    }];
}

- (void)loadMoreCoupons:(UITableView *)tableView
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        // network is not regular tip.
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    else
    {
        if (tableView.tag == kNormalTableViewTag)
        {
            [fc setPage:++currentPageNumber];
        }
        else
        {
            [fc setPage:++searchPageNumber];
        }
        
        [[RetrieveData sharedInstance] setFailureCount:0];
        [[RetrieveData sharedInstance] retrieveCouponsWithBlock:^(NSArray *coupons, NSError *error) {
            
            if (error == nil)
            {
                TTTableViewFooterLoadMore *footLoadMore;
                if (tableView.tag == kNormalTableViewTag)
                {
                    footLoadMore = (TTTableViewFooterLoadMore *)_contentTableView.tableFooterView;
                }
                else
                {
                    footLoadMore = (TTTableViewFooterLoadMore *)self.searchDC.searchResultsTableView.tableFooterView;
                }
                
                if ([coupons count] == 0)
                {                    
                    [footLoadMore setFooterFinish];
                    isLoadMoreDone = YES;
                }
                else
                {
                    [footLoadMore setFooterLoading];
                    
                    // reload tableview data.
                    if (tableView.tag == kNormalTableViewTag)
                    {
                        // assumed first loading, Assert...
                        NSAssert(self.couponsArray != nil, @"self.couponsArray is nil");
                        
                        
                        for (Coupons *c in coupons)
                        {
                            NSArray *results = [self.couponsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.coupon_id == %d", c.coupon_id]];
                            if (results.count > 0)
                            {
                                continue;
                            }
                            [self.couponsArray addObject:c];
                        }
                        
//                        [self.couponsArray addObjectsFromArray:coupons];
                        
                        [_contentTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval];
                        [fc setPage:currentPageNumber];
                    }
                    else
                    {
                        // assumed first loading, Assert...
                        NSAssert(self.searchCouponsArray != nil, @"self.searchCouponsArray is nil");
                        
                        for (Coupons *c in coupons)
                        {
                            NSArray *results = [self.searchCouponsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.coupon_id == %d", c.coupon_id]];
                            if (results.count > 0)
                            {
                                continue;
                            }
                            [self.searchCouponsArray addObject:c];
                        }
                        
//                        [self.searchCouponsArray addObjectsFromArray:coupons];
                        
                        [self.searchDC.searchResultsTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval];
                        [fc setPage:searchPageNumber];
                    }
                }
            }
        }];
    }
}

- (void)retrieveCoupons
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        if (_couponsArray == nil) {
            _couponsArray = [DBOperate readCouponsFromDB];
        }
//        [self setupContentTableView];
        [self.contentTableView reloadData];
        
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        
        [NetworkNotRegular createInView:self.contentTableView];
    }
    else
    {
        [self showProgressWithLabel:@"正在载入..." task:^{
            [self loadCouponsFromRemote];
        } completion:^{
            
        }];
    }

}

- (void)loadCouponsFromRemote
{
    [[RetrieveData sharedInstance] retrieveCouponsWithBlock:^(NSArray *coupons, NSError *error) {
        if (error == nil)
        {
            if (_couponsArray == nil) {
                _couponsArray = [NSMutableArray arrayWithArray:coupons];
            }
            
            if (error == nil) {
                [DBOperate saveCouponsData:coupons];
            }
            
//            [self setupContentTableView];
//                hud.hidden = YES;
//            [self.contentTableView reloadData];
            [self.contentTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval5];
            
            currentPageNumber = kFirstLoadingPageNumber;
            searchPageNumber = kFirstLoadingPageNumber;
            isLoadMoreDone = NO;
        }
    }];
}

- (void)selectFilterConditions:(id)sender
{
    [self.sidePanelController showRightPanelAnimated:YES];
}

- (void)selectCategory:(id)sender
{
    [self.sidePanelController showLeftPanelAnimated:YES];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource
{
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	isReloading = YES;
	
}

- (void)doneLoadingTableViewData
{
	//  model should call this when its done loading
	isReloading = NO;
	[refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_contentTableView];
	
}

//#pragma mark - Motion event.
//
//- (BOOL)canBecomeFirstResponder
//{
//    return YES;
//}
//
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (UIEventSubtypeMotionShake == motion)
//    {
//        if (!isReloading)
//        {
//            // shake to update coupons.
//            [self autoPullDownRefresh];
//        }
//    }
//}
//
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//
//}
//
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//
//}

@end
