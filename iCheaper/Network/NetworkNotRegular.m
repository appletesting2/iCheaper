//
//  NetworkNotRegular.m
//  iCheaper
//
//  Created by twb on 13-4-15.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NetworkNotRegular.h"

#define kNetworkNotRegularViewTag 500
#define kNetworkNotRegularAnimationInterval 0.5f

static NetworkNotRegular *nnr;

@implementation NetworkNotRegular

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupErrorTipLabel];
    
        [self setupErrorImageView];
        
        [self setupGesture];
    }
    return self;
}

+ (void)createInView:(UIView *)view
{
    if (view == nil) {
        return;
    }
    
    nnr = [[self alloc] initWithFrame:CGRectMake(kNetworkNotRegularPaddingX, kNetworkNotRegularPaddingY, kNetworkNotRegularWidth, kNetworkNotRegularHeight)];
    nnr.tag = kNetworkNotRegularViewTag;
    [view addSubview:nnr];
}

+ (void)removeFromSuperView
{
    // send notification. for example: update categories. e...g...
    [NotificationBody postUpdateCategoriesWithNotificationBody:nil];
    
    [nnr removeFromSuperview];
}

#pragma mark - setup part.

- (void)setupErrorTipLabel
{
    errorTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kNetworkNotRegularLabelPaddingX, kNetworkNotRegularLabelPaddingY, kNetworkNotRegularLabelWidth, kNetworkNotRegularLabelHeight)];
    errorTipLabel.backgroundColor = [UIColor clearColor];
    errorTipLabel.font = [UIFont systemFontOfSize:14.0f];
    errorTipLabel.textColor = [UIColor darkGrayColor];
//    errorTipLabel.shadowColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
//    errorTipLabel.shadowOffset = CGSizeMake(0.5f, 0.5f);
    errorTipLabel.text = @"404 网络OK后,下拉重试.";
    errorTipLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:errorTipLabel];
}

- (void)setupErrorImageView
{
    errorTipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kNetworkNotRegularImagePaddingX, kNetworkNotRegularImagePaddingY, kNetworkNotRegularImageWidth, kNetworkNotRegularImageHeight)];
//    errorTipImageView.backgroundColor = [UIColor orangeColor];
    errorTipImageView.image = [UIImage imageNamed:@"error-404.png"];
    [self addSubview:errorTipImageView];
}

- (void)setupGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - event part.

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
    [UIView animateWithDuration:kNetworkNotRegularAnimationInterval animations:^{
        errorTipImageView.transform = CGAffineTransformIdentity;
        errorTipImageView.transform = CGAffineTransformMakeTranslation(0.0f, 25.0f);
    }];
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
