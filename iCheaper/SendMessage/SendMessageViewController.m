//
//  SendMessageViewController.m
//  iCheaper
//
//  Created by twb on 13-4-16.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SendMessageViewController.h"

@interface SendMessageViewController ()

@end

@implementation SendMessageViewController

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
    
    [self setupWebInfo];
    
}

#pragma mark - setup part.

- (void)setupBarButtonItem
{
    // title
    [[ToolKit sharedInstance] setNavigationController:self title:@"发送到手机"];
    
    // left
    NavigationItemButton *leftBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 32.0f)];
    [leftBarItem setButtonTitle:@"关闭"];
    [leftBarItem addTarget:self action:@selector(closeSendMessage:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
}

- (void)setupWebInfo
{
    UIWebView *couponWebInfo = [[UIWebView alloc] initWithFrame:CGRectMake(kSendMessageViewPaddingX, kSendMessageViewPaddingY, kSendMessageViewWidth, KSendMessageViewHeight)];
    [couponWebInfo loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.webUrl]]];
    couponWebInfo.delegate = self;
    [self.view addSubview:couponWebInfo];
    
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:self.webUrl]];
//    [client getPath:nil parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        UIWebView *couponWebInfo = [[UIWebView alloc] initWithFrame:CGRectMake(kSendMessageViewPaddingX, kSendMessageViewPaddingY, kSendMessageViewWidth, KSendMessageViewHeight)];
//        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        [couponWebInfo loadHTMLString:responseString baseURL:nil];
//        
//        loadWebViewHud.hidden = YES;
//        
//        [self.view addSubview:couponWebInfo];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        loadWebViewHud.hidden = YES;
//    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.loadWebViewHud = [[MBProgressHUD alloc] initWithView:self.view];
//    self.loadWebViewHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.loadWebViewHud.labelText = @"正在载入...";
    self.loadWebViewHud.removeFromSuperViewOnHide = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.loadWebViewHud.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.loadWebViewHud.hidden = YES;
}

#pragma mark - event part.

- (void)closeSendMessage:(UIButton *)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
