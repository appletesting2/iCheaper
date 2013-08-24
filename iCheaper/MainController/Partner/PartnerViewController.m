//
//  PartnerViewController.m
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "PartnerViewController.h"
#import "PartnerViewController+Delegate.h"
#import "PartnerViewController+Datasource.h"
#import "UIViewController+ShareIntance.h"

@interface PartnerViewController ()

@end

@implementation PartnerViewController

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
    
    [self setupPartners];
    
    [self setupNavigationBar];
    
    [self setupMcdonaldsListTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part.

- (void)setupPartners
{
    partners = @[@{kPartnerImageKey: @"index_top.jpg"}, @{kPartnerImageKey: @"mc.png"}];
}

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"特别推荐商户" output:&titleLabel];
    navigationTitleLabel = titleLabel;
    
    NavigationItemBackButton *leftBarItem = [[NavigationItemBackButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 28.0f, 28.0f)];
    [leftBarItem addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
}


- (void)setupMcdonaldsListTableView
{
    PartnerTableView = [[UITableView alloc] initWithFrame:CGRectMake(kMcdonaldsTableViewPaddingX, kMcdonaldsTableViewPaddingY, kMcdonaldsTableViewWidth, kMcdonaldsTableViewHeight) style:UITableViewStyleGrouped];
    
    PartnerTableView.delegate = self;
    PartnerTableView.dataSource = self;
    PartnerTableView.backgroundView = nil;
    PartnerTableView.backgroundColor = [UIColor whiteColor];
//    [PartnerTableView registerClass:[PartnerCell class] forCellReuseIdentifier:kPartnerCellTop];
//    [PartnerTableView registerClass:[PartnerCell class] forCellReuseIdentifier:kPartnerCellBottom];
    
    [self.view addSubview:PartnerTableView];
}

#pragma mark - event part

- (void)goBack:(UIButton *)sender
{
    [self.UIManager exitPartnerController];
}

@end
