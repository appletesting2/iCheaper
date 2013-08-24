//
//  TTTableViewFooterLoadMore.h
//  TaoChen
//
//  Created by twb on 13-2-22.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTableViewFooterLoadMore : UIView
{
    UIActivityIndicatorView *loadingAnimation;
    UILabel *loadingLabel;
}

- (void)setFooterLoading;
- (void)setFooterFinish;

- (void)setLoadingLabelText:(NSString *)text;

@end
