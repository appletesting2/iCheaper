//
//  MoreInfoController.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MoreInfoController.h"
#import "MoreInfoController+Delegate.h"
#import "MoreInfoController+Datasource.h"

@interface MoreInfoController ()

@end

@implementation MoreInfoController

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
    
    [self setupContentArray];
    
    [self setupNavigationBar];
    
    [self setupTableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part.

- (void)setupContentArray
{
    self.contentArray = @[@[@"意见反馈", @"免责声明", @"关于我们"], @[@"打分鼓励"], @[@"版本 1.3"]];
}

- (void)setupTableView
{
    self.moreInfoTableView = [[UITableView alloc] initWithFrame:CGRectMake(kMoreInfoTableViewPaddingX, kMoreInfoTableViewPaddingY, kMoreInfoTableViewWidth, kMoreInfoTableViewHeight) style:UITableViewStyleGrouped];
    self.moreInfoTableView.backgroundView = nil;
    self.moreInfoTableView.backgroundColor = [UIColor whiteColor];
    self.moreInfoTableView.delegate = self;
    self.moreInfoTableView.dataSource = self;
//    [self.moreInfoTableView registerClass:[MoreInfoCell class] forCellReuseIdentifier:kMoreInfoCellTop];
//    [self.moreInfoTableView registerClass:[MoreInfoCell class] forCellReuseIdentifier:kMoreInfoCellCenter];
//    [self.moreInfoTableView registerClass:[MoreInfoCell class] forCellReuseIdentifier:kMoreInfoCellBottom];
//    [self.moreInfoTableView registerClass:[MoreInfoCell class] forCellReuseIdentifier:kMoreInfoCellSingle];
    [self.view addSubview:self.moreInfoTableView];
}

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"更多" output:&titleLabel];
    navigationTitleLabel = titleLabel;
}

@end
