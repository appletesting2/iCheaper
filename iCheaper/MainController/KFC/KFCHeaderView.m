//
//  KFCHeaderView.m
//  iCheaper
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCHeaderView.h"

@implementation KFCHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupHeaderImageView];
    }
    return self;
}

- (void)setupHeaderImageView
{
    headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 80.0f)];
    headerImageView.image = [UIImage imageNamed:@"index_top.jpg"];
    [self addSubview:headerImageView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self action:@selector(handleTaps:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void) handleTaps:(UITapGestureRecognizer*)paramSender
{
    [self.delegate PartnerTap];
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
