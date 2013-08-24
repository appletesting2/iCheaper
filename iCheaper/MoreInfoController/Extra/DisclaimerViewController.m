//
//  DisclaimerViewController.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DisclaimerViewController.h"

#define kDisclaimerText @"免责声明\n\n您正在使用的应用由TaoTao开发或拥有。Apple不承担该程序任何方面的任何责任，包括但不限于其性能、知识产权、支持、服务、收费及内容。\n\n任何TaoTao手机客户端的手机品牌合作商，如Apple, AppStore，并不因合作获得TaoTao手机客户端的知识产权，也非TaoTao手机客户端的赞助商，因TaoTao手机客户端侵犯了任何第三方知识产权的，TaoTao承担相应的法律责任。\n\nTaoTao对于任何包含、经由或连接、下载或从任何与有关本网站所获得的任何内容、信息或广告，不声明或保证其正确性或可靠性；并且对于用户经本网站上的内容、广告、展示而购买、取得的任何产品、信息或资料，TaoTao不负保证责任。用户自行负担使用本网站的风险。\n\nTaoTao有权但无义务，改善或更正本网站任何部分之任何疏漏、错误。"

@interface DisclaimerViewController ()

@end

@implementation DisclaimerViewController

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
    
    [self setupDisclaimersTextView];
    
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup part

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"免责声明" output:&titleLabel];
    navigationTitleLabel = titleLabel;
    
    NavigationItemBackButton *leftBarItem = [[NavigationItemBackButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 28.0f, 28.0f)];
    [leftBarItem addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
    
}

- (void)setupDisclaimersTextView
{
    disclaimers = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kContentHeight)];
    disclaimers.editable = NO;
    disclaimers.textColor = [UIColor darkGrayColor];
    disclaimers.font = [UIFont systemFontOfSize:16.0f];
    disclaimers.text = kDisclaimerText;
    [self.view addSubview:disclaimers];
}

#pragma mark - event part

- (void)goBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
