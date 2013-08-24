//
//  ViewController.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RetrieveData.h"
#import "CouponCell.h"
#import "Coupons.h"
#import "SelectNearCouponsPickerContentView.h"
#import "TTCityViewController.h"
#import "NavigationItemButton.h"
#import "EGORefreshTableHeaderView.h"
#import "MBProgressHUD.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "TTTableViewFooterLoadMore.h"
#import "FilterCondition.h"


#define kFirstLoadingPageNumber (1)
#define kTableViewAfterDelayLoadingInterval (0.01f)
#define kTableViewAfterDelayLoadingInterval5 (0.05f)

#define kExpandTableViewLimit (20.0f)

typedef NS_ENUM(NSInteger, UITableViewTag) {
    kNormalTableViewTag = 110,
    kSearchBarTableViewTag
};

@interface ViewController : UIViewController
{
    UILabel *navigationTitleLabel;
    NavigationItemButton *leftBarItem;
    NavigationItemButton *rightBarItem;
    EGORefreshTableHeaderView *refreshHeaderView;
	
	//  Reloading var should really be your tableviews datasource
	//  Putting it here for demo purposes
	BOOL isReloading;
    
    FilterCondition *fc;
    
    // had loaded how many pages.
    NSUInteger currentPageNumber;
    NSUInteger searchPageNumber;
    
    // load more. this parameter don't looks like useful.
    BOOL isLoadMoreDone;
    
    CLLocationManager *mLocationManager;
    
    CGFloat previousOffsetY;
    BOOL isContentViewExpand;
}

@property (nonatomic, strong) UITableView *contentTableView;
@property (nonatomic, strong) NSMutableArray *couponsArray;
@property (nonatomic, strong) NSMutableArray *searchCouponsArray;
@property (nonatomic, strong) NSMutableArray *supportCities;

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDC;

@property (nonatomic, strong) TTTableViewFooterLoadMore *loadMore;
@property (nonatomic, strong) TTTableViewFooterLoadMore *searchLoadMore;

//@property (strong, nonatomic) MBProgressHUD* initialAppHud;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

- (void)updateCoupons:(UITableView *)tableView;
- (void)loadMoreCoupons:(UITableView *)tableView;

- (void)setupClearPageNumber;


@end
