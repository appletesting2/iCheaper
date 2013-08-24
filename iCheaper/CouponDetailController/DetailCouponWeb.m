//
//  DetailCouponWeb.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailCouponWeb.h"

@implementation DetailCouponWeb

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupCouponWebInfo];
    }
    return self;
}

#pragma mark - setup part.

- (void)setupCouponWebInfo
{
    couponWebInfo = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kCouponDetailWebViewWidth, kCouponDetailWebViewHeight)];
    couponWebInfo.userInteractionEnabled = YES;
    couponWebInfo.delegate = self;
    [self addSubview:couponWebInfo];
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicator setCenter:self.center];
//    activityIndicator.color = [UIColor darkGrayColor];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [couponWebInfo addSubview:activityIndicator];
}

#pragma mark - event part.

- (void)setCouponWebURL:(NSString *)urlString
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [couponWebInfo loadRequest:request];
    });
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
    [activityIndicator removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
