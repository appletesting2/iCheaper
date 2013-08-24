//
//  TTCityViewController.m
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCityViewController.h"
#import "TTCityViewController+DataSource.h"
#import "TTCityViewController+Delegate.h"
#import "TTCityHeaderView.h"
#import "RetrieveData.h"

@interface TTCityViewController ()

@end

@implementation TTCityViewController

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
    
    [self setupBarButtonItem];
    
    [self setupFilterCondition];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupCityData];
}

#pragma mark - setup part.

- (void)setupBarButtonItem
{
    // title
    [[ToolKit sharedInstance] setNavigationController:self title:@"请选择支持的城区"];
    
    // left
    UIButton *leftBarItem = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 32.0f)];
    [leftBarItem.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [leftBarItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBarItem setTitle:@"关闭" forState:UIControlStateNormal];
    [leftBarItem setBackgroundImage:[[UIImage imageNamed:@"header-txt-btn.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateNormal];
    [leftBarItem setBackgroundImage:[[UIImage imageNamed:@"header-txt-btn-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateHighlighted];
    [leftBarItem addTarget:self action:@selector(closeCitySetting:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

- (void)closeCitySetting:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupTableView
{
    cityTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, kNavigationBarShadowOffsetY, kScreenWidth, kCityTableViewHeight)];
    cityTableView.delegate = self;
    cityTableView.dataSource = self;
//    [cityTableView registerClass:[TTCityCell class] forCellReuseIdentifier:kCityCell];
//    [cityTableView setSeparatorColor:kCellSeparatorColor];
    [cityTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    cityTableView.showsVerticalScrollIndicator = NO;
//    [cityTableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bkg_light_tile-lg.png"]]];
    
    TTCityHeaderView *headerView = [[TTCityHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 50.0f)];
    if (self.currentCityName != nil) {
        [headerView setMyLocationCityText:self.currentCityName];
    }
    else{
        // default Shanghai.
        [headerView setMyLocationCityText:@"上海"];
    }
    
    cityTableView.tableHeaderView = headerView;
    
    [self.view addSubview:cityTableView];
}

- (void)setupCityData
{
    [[RetrieveData sharedInstance] retrieveCitiesWithBlock:^(NSArray *cities, NSError *error) {

        supportCities = cities;
        
        sortedCityKeys = [NSMutableArray arrayWithCapacity:0];
        for (Cities *city in cities) {
            [sortedCityKeys addObject:city.city_name];
        }
        
        [self setupTableView];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
