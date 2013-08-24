//
//  DetailCouponWeb.h
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCouponWeb : UIView <UIWebViewDelegate>
{
    UIWebView *couponWebInfo;
    UIActivityIndicatorView *activityIndicator;
}

- (void)setCouponWebURL:(NSString *)urlString;

@end
