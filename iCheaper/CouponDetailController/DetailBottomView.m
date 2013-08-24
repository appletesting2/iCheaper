//
//  DetailBottomView.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailBottomView.h"

@implementation DetailBottomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupSeparateLine];
        
        [self setupSendMessageButton];
        
        [self setupRetrieveCouponsButton];
    }
    return self;
}

#pragma mark - setup part

- (void)setupSeparateLine
{
    UIImageView *separateLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kCouponDetailBottomLineheight)];
    separateLineImage.image = [UIImage imageNamed:@"menu-shadow.png"];
    [self addSubview:separateLineImage];
}

- (void)setupRetrieveCouponsButton
{
    self.retrieveCouponButton = [[UIButton alloc] initWithFrame:CGRectMake(kCouponDetailBottomViewButtonPaddingX, kCouponDetailBottomViewButtonPaddingY, kCouponDetailBottomViewButtonWidth, kCouponDetailBottomViewButtonHeight)];
    
//    NSLog(@"retrieveCouponButton.frame = %f %f %f %f", self.retrieveCouponButton.frame.origin.x, self.retrieveCouponButton.frame.origin.y, self.retrieveCouponButton.frame.size.width, self.retrieveCouponButton.frame.size.height);
    
    //    self.bookingFromInternet.center = self.center;
    [self.retrieveCouponButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [self.retrieveCouponButton setTitle:@"添加至Passbook" forState:UIControlStateNormal];
    [self.retrieveCouponButton setBackgroundImage:[[UIImage imageNamed:@"big-btn-pink.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateNormal];
    [self.retrieveCouponButton setBackgroundImage:[[UIImage imageNamed:@"big-btn-pink-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateHighlighted];
    [self.retrieveCouponButton addTarget:self action:@selector(retrieveCoupon:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.retrieveCouponButton];
}

- (void)setupSendMessageButton
{
    self.sendMessageButton = [[UIButton alloc] initWithFrame:CGRectMake(kCouponDetailBottomViewSendMsgButtonPaddingX, kCouponDetailBottomViewSendMsgButtonPaddingY, kCouponDetailBottomViewSendMsgButtonWidth, kCouponDetailBottomViewSendMsgButtonHeight)];
    [self.sendMessageButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [self.sendMessageButton setTitle:@"发送到手机" forState:UIControlStateNormal];
    [self.sendMessageButton setBackgroundImage:[[UIImage imageNamed:@"big-btn-green.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateNormal];
//    [self.sendMessageButton setBackgroundImage:[[UIImage imageNamed:@"big-btn-pink-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateHighlighted];
    [self.sendMessageButton addTarget:self action:@selector(sendMSG:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendMessageButton];
}

#pragma mark - event part

- (void)retrieveCoupon:(UIButton *)sender
{
    [_delegate RetrieveCoupons];
}

- (void)sendMSG:(UIButton *)sender
{
    [_delegate SendMessage];
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
