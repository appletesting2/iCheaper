//
//  DetailCouponFooterView.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailCouponFooterView.h"

@implementation DetailCouponFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupTipLabel];
    }
    return self;
}

- (void)setupTipLabel
{
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, kScreenWidth - 30.0f, 40.0f)];
    tipLabel.numberOfLines = 0;
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.font = [UIFont systemFontOfSize:12.0f];
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.text = @"除特殊注明外,本优惠不能与其他优惠同时享受";
    [self addSubview:tipLabel];
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
