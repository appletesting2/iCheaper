//
//  DetailCouponHeaderView.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCouponHeaderView : UIView <UIWebViewDelegate>
//{
//    UIWebView *couponWebInfo;
//    UIActivityIndicatorView *activityIndicator;
//}
{
    UILabel *rulesLabel;
    UILabel *validDateLabel;
}

- (void)setRulesLabelText:(NSString *)text;
- (void)setRulesLabelTextFromH5:(NSString *)urlString;

- (void)setValidDateLabelFromText:(NSString *)from toText:(NSString *)to;

//- (void)setCouponWebInfo:(NSString *)urlString;

@end
