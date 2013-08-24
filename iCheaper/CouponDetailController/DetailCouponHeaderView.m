//
//  DetailCouponHeaderView.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailCouponHeaderView.h"
#import "TFHpple.h"
#import "TFHppleElement.h"

#define kCouponPromoNodeName @"promo-txt"

@implementation DetailCouponHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupTipLabel];
        
        [self setupActiviyRules];
        
        [self setupValidDateLabel];
//        [self setupCouponWebInfo];
    }
    return self;
}

#pragma mark - setup part.

//- (void)setupCouponWebInfo
//{
//    couponWebInfo = [[UIWebView alloc] initWithFrame:CGRectMake(15.0f, 40.0f, kScreenWidth - 30.0f, 140.0f)];
//    couponWebInfo.delegate = self;
//    [self addSubview:couponWebInfo];
//}

- (void)setupTipLabel
{
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, kScreenWidth - 20.0f, 40.0f)];
    tipLabel.numberOfLines = 0;
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.font = [UIFont systemFontOfSize:14.0f];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.text = @"将此页直接展示或添加到Passbook均可使用";
    [self addSubview:tipLabel];
}

- (void)setupActiviyRules
{
    rulesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, kScreenWidth - 20.0f, 120.0f)];
    rulesLabel.numberOfLines = 0;
    rulesLabel.backgroundColor = [UIColor clearColor];
    rulesLabel.font = [UIFont systemFontOfSize:14.0f];
//    rulesLabel.textAlignment = NSTextAlignmentCenter;
    rulesLabel.textColor = [UIColor darkGrayColor];
    rulesLabel.text = @"正在获取,请稍等...";
    [self addSubview:rulesLabel];
    
}

- (void)setupValidDateLabel
{
    validDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 120.0f, kScreenWidth - 60.0f, 20.0f)];
    validDateLabel.numberOfLines = 0;
    validDateLabel.backgroundColor = [UIColor clearColor];
    validDateLabel.font = [UIFont systemFontOfSize:14.0f];
    validDateLabel.textColor = [UIColor orangeColor];
    [self addSubview:validDateLabel];
}

#pragma mark - event part.

- (void)setRulesLabelText:(NSString *)text
{
    [rulesLabel setText:text];
}

- (void)setRulesLabelTextFromH5:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:15.0f];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                                        NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            TFHpple *doc = [TFHpple hppleWithHTMLData:data];
            NSString *xpathString = [NSString stringWithFormat:@"//div[@class='%@']", kCouponPromoNodeName];
            
            TFHppleElement * e = [doc peekAtSearchWithXPathQuery:xpathString];
            
            if (e != nil)
            {
                NSString *content = [e.firstChild content];
                content = [content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                NotificationBody *body = [[NotificationBody alloc] init];
                body.body = content;
                body.tag = kNotificationRetrieveCouponDescriptionTag;
                [NotificationBody postRetrieveCouponDescriptionWithNotificationBody:body];
                [rulesLabel performSelectorOnMainThread:@selector(setText:) withObject:content waitUntilDone:NO];
            }
            else
            {
                NSString *errorString = @"无法获取优惠详细信息,请点击\"发送到手机\".";
                [rulesLabel performSelectorOnMainThread:@selector(setText:) withObject:errorString waitUntilDone:NO];
            }
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded.");
        }
        else if (error != nil)
        {
            NSLog(@"Error happened = %@", error);
            
        } }];
}

- (void)setValidDateLabelFromText:(NSString *)from toText:(NSString *)to
{
    NSString *validDateString = [NSString stringWithFormat:@"有效期: %@ 至 %@", from, to];
    [validDateLabel setText:validDateString];
}

//
//- (void)setCouponWebInfo:(NSString *)urlString
//{
//    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
//    [activityIndicator setCenter:couponWebInfo.center];
//    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
//    [couponWebInfo addSubview:activityIndicator];
//    
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    [couponWebInfo loadRequest:request];
//}
//
//#pragma mark - UIWebViewDelegate
//
//-(void)webViewDidStartLoad:(UIWebView *)webView
//{
//    [activityIndicator startAnimating];
//}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    [activityIndicator stopAnimating];
//    [activityIndicator removeFromSuperview];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
