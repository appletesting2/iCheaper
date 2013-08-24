//
//  NearCouponsController.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NearCouponsController.h"
#import "NearCouponsController+Delegate.h"
#import "NearCouponsController+Datasource.h"
#import "UIViewController+ShareIntance.h"
#import "UIAlertView+Private.h"

@interface NearCouponsController ()

@end

@implementation NearCouponsController

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
    [self setupFilterCondition];
    
    [self setupSearchBar];
    
    [self setupContentView];
    
    [self setupNavigationBar];
    
    [self registerNotification];
    
    [self setupAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part.

- (void)setupSearchBar
{    
    // Create a search bar
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(kSearchBarPaddingX, kSearchBarPaddingY, kSearchBarWidth, kSearchBarHeight)];
	self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchBar.keyboardType = UIKeyboardTypeDefault;
    //@"输入商户名、地址、标签等";
    self.searchBar.placeholder = NSLocalizedString(@"Near.Searbar.placeholder", nil);
    //    self.searchBar.tintColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
	self.searchBar.delegate = self;
	[self.view addSubview:self.searchBar];
	
	// Create the search display controller
	self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//    self.searchDC.delegate = self;
}

- (void)setupFilterCondition
{
    fc = [[FilterCondition alloc] init];
}

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    NSString *title = [[ToolKit sharedInstance] retrieveNearCouponsSortStringTitleArray][[fc nearCouponSort] - 1];
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
    NavigationItemButton *rightBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 32.0f)];
    [rightBarItem setButtonTitle:@"筛选"];
    [rightBarItem addTarget:self action:@selector(selectFilterCondition:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
}

- (void)setupAnnotation
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        // show tips : network is not regular.       
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
    }
    else
    {
        [self showProgressWithLabel:@"正在载入..." task:^{
            [self loadNearCouponsFromRemote];
        } completion:^{
            
        }];
    }
}

- (void)setupContentView
{
    // normal side.
    nearShopMapView = [[TTNearShopMapView alloc] initWithFrame:CGRectMake(kNearCouponsViewPaddingX, kNearCouponsViewPaddingY, kNearCouponsViewWidth, KNearCouponsViewHeight)];
    [nearShopMapView setMapViewAvailable:YES];
    [self.view addSubview:nearShopMapView];
}

#pragma mark - event part.

- (void)loadNearCouponsFromRemote
{
    [[RetrieveData sharedInstance] retrieveNearBusinessesWithBlock:^(NSArray *businesses, NSError *error) {
        
        NSLog(@"error = %@", [error description]);
        
        if (error == nil)
        {
            
            couponsBusinesses = [NSMutableArray arrayWithArray:businesses];
            shopAnnotations = [NSMutableArray arrayWithCapacity:[couponsBusinesses count]];
            
            for (Businesses *business in couponsBusinesses)
            {
                CouponsAnnotation *shopAnnotation = [[CouponsAnnotation alloc] init];
                CLLocationCoordinate2D coor2D = CLLocationCoordinate2DMake([business.latitude floatValue], [business.longitude floatValue]);
                [shopAnnotation setCoordinate:coor2D];
                //                    NSLog(@"business.name = %@", business.name);
                //                    NSLog(@"business.coupon_description = %@", business.coupon_description);
                [shopAnnotation setTitle:business.name];
                [shopAnnotation setSubtitle:business.address];
                [shopAnnotation setTagID:business.coupon_id];
                [shopAnnotations addObject:shopAnnotation];
            }
            
            [nearShopMapView setShopAnnotations:shopAnnotations];
            
            // clear keyword.
            [fc setKeyword:@""];
        }
        
        if ([businesses count] == 0)
        {
            [UIAlertView showTitle:@"附近优惠" Content:@"附近没有您想要的优惠,试试其他的吧"];
        }
        
    }];
}

- (void)registerNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:kNotificationUpdateCoupons object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:kNotificationNearRetrieveCoupon object:nil];
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
        [self setupAnnotation];
    }
    else if (notificationBody.tag == kNotificationBodyFromFilterConditionToUpdateCoupons)
    {
        [self setupAnnotation];
    }
    else if (notificationBody.tag == kNotificationBodyFromSortToUpdateCoupons)
    {
        if (![notificationBody.body isKindOfClass:[NSNumber class]]) {
            return;
        }
        
        NSString *title = [[ToolKit sharedInstance] retrieveNearCouponsSortStringTitleArray][[fc nearCouponSort] - 1];
        if (navigationTitleLabel != nil)
        {
            [navigationTitleLabel setText:title];
        }
        
        [self setupAnnotation];
    }
    else if (notificationBody.tag == kNotificationNearRetrieveCouponTag)
    {
        if (![notificationBody.body isKindOfClass:[Coupons class]]) {
            return;
        }

        [self.UIManager showNearCouponDetailController:notificationBody.body];
//        [self.UIManager showCouponDetailController:notificationBody.body];
//        CouponDetailViewController *detailController = [[CouponDetailViewController alloc] initWithNibName:nil bundle:nil];
//        [detailController setCoupon:notificationBody.body];
//        [[ToolKit sharedInstance] hideTabBar:self.tabBarController];
//        [self.navigationController pushViewController:detailController animated:YES];
    }
}

- (void)selectCategory:(UIButton *)sender
{
    [self.sidePanelController showLeftPanelAnimated:YES];
}

- (void)selectFilterCondition:(UIButton *)sender
{
    [self.sidePanelController showRightPanelAnimated:YES];
}


@end
