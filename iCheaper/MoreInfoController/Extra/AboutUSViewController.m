//
//  AboutUSViewController.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "AboutUSViewController.h"

#define kAboutUSText @"一起探讨技术,请发邮件至angeltwb@me.com,谢谢 \n\nTaoTao"

@interface AboutUSViewController ()

@end

@implementation AboutUSViewController

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
    [self setupAboutUsTextView];
    
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
    [[ToolKit sharedInstance] setNavigationController:self title:@"关于我们" output:&titleLabel];
    navigationTitleLabel = titleLabel;
    
    NavigationItemBackButton *leftBarItem = [[NavigationItemBackButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 28.0f, 28.0f)];
    [leftBarItem addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
}

- (void)setupAboutUsTextView
{
    aboutUsTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kContentHeight)];
    aboutUsTextView.editable = NO;
    aboutUsTextView.textColor = [UIColor darkGrayColor];
    aboutUsTextView.font = [UIFont systemFontOfSize:16.0f];
    aboutUsTextView.text = kAboutUSText;
    aboutUsTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.view addSubview:aboutUsTextView];
}

#pragma mark - event part

- (void)goBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
