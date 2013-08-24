//
//  MyCouponsController.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MyCouponsController.h"
#import "MyCouponsController+Delegate.h"
#import "MyCouponsController+Datasource.h"

@interface MyCouponsController ()

@end

@implementation MyCouponsController

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
    
    [self setupNavigationBar];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // custom cell selected bg image.
    [UIView animateWithDuration:0.5f animations:^{
        CouponCell *cell = (CouponCell *)[myCouponsTableView cellForRowAtIndexPath:[myCouponsTableView indexPathForSelectedRow]];
        [cell setCustomBGViewAlpha:0.0f];
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setupContentArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part.

- (void)setupContentArray
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    
    NSArray *couponsID = [[FavoriteCoupon sharedInstance] getCouponsID];
    
    if ([couponsID count] == 0) {
        self.contentArray = nil;
        [myCouponsTableView reloadData];
        return;
    }
    
    /*
     * New Method With NSPredicate
     *
     */
    
    // update my coupons
    
    /* couponsID: 1000 10001 10002
     * self.contentArray: 1000 10001
     * 10002 is needed.
     */
    NSMutableArray *coupons_id = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *filterContents = [NSMutableArray arrayWithCapacity:0];
    if (self.contentArray != nil)
    {
        for (Coupons *coupon in self.contentArray)
        {
            if ([[FavoriteCoupon sharedInstance] HasExistcouponID:@(coupon.coupon_id)])
            {
                [filterContents addObject:coupon];
                [coupons_id addObject:@(coupon.coupon_id)];
            }
        }
    }
    
    [self.contentArray removeAllObjects];
    self.contentArray = filterContents;
    
    NSArray *results = [couponsID filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (SELF in %@)", coupons_id]];
    NSLog(@"results = %@", results);

    for (NSNumber *couponID in results)
    {
        MBProgressHUD *mycouponHud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        mycouponHud.labelText = @"正在载入...";
        mycouponHud.removeFromSuperViewOnHide = YES;
        
        [[RetrieveData sharedInstance] retrieveCoupon:[couponID integerValue] WithBlock:^(Coupons *coupon, NSError *error) {
            if (error == nil && coupon != nil)
            {
//                NSLog(@"coupon = %@", coupon);
                               
                if (self.contentArray == nil)
                {
                    self.contentArray = [NSMutableArray arrayWithCapacity:0];
                }
                
                [self.contentArray addObject:coupon];
                
                [myCouponsTableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.01f];
            }
            
            [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        }];
    }
    
    if ([results count] == 0) {
        [myCouponsTableView reloadData];
    }
}

- (void)setupTableView
{
    myCouponsTableView = [[UITableView alloc] initWithFrame:CGRectMake(kMyCouponsTableViewPaddingX, kMyCouponsTableViewPaddingY, kMyCouponsTableViewWidth, kMyCouponsTableViewHeight) style:UITableViewStylePlain];
//    [myCouponsTableView registerClass:[CouponCell class] forCellReuseIdentifier:kMyCouponCellTop];
//    [myCouponsTableView registerClass:[CouponCell class] forCellReuseIdentifier:kMyCouponCellCenter];
//    [myCouponsTableView registerClass:[CouponCell class] forCellReuseIdentifier:kMyCouponCellBottom];
//    [myCouponsTableView registerClass:[CouponCell class] forCellReuseIdentifier:kMyCouponCellSingle];
    myCouponsTableView.delegate = self;
    myCouponsTableView.dataSource = self;
    myCouponsTableView.backgroundView = nil;
    myCouponsTableView.backgroundColor = [UIColor whiteColor];
    [myCouponsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
 
    // Announce Header View, for after there is ads.
    myCouponsTableView.tableHeaderView = [[AnnouceView alloc] initWithFrame:CGRectMake(kMyCouponsAnnounceHeaderViewPaddingX, kMyCouponsAnnounceHeaderViewPaddingY, kMyCouponsAnnounceHeaderViewWidth, kMyCouponsAnnounceHeaderViewHeight)];
    
    [self.view addSubview:myCouponsTableView];
}

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"我的收藏" output:&titleLabel];
    navigationTitleLabel = titleLabel;
}

@end
