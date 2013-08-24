//
//  DetailTitleView.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailTitleView.h"

@implementation DetailTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self setupTitleLabel];
        
//        [self setupCommentLabel];
//        
//        [self setupCommentImage];
//        
//        [self setupCommentCountLabel];
        
        [self setupCouponDescriptionLabel];
    }
    return self;
}

#pragma mark - setup part.

- (void)setupCouponDescriptionLabel
{
    couponDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(kDetailHeaderCouponDescriptionLabelPaddingX, kDetailHeaderCouponDescriptionLabelPaddingY, kDetailHeaderCouponDescriptionLabelWidth, kDetailHeaderCouponDescriptionLabelHeight)];
//    couponDescriptionLabel.text = @"[南京东路]耐克旗舰店新年大礼包";
    couponDescriptionLabel.font = [UIFont systemFontOfSize:14.0f];
    couponDescriptionLabel.textColor = [UIColor darkGrayColor];
    couponDescriptionLabel.backgroundColor = [UIColor clearColor];
    couponDescriptionLabel.numberOfLines = 0;
    [self addSubview:couponDescriptionLabel];
}

#pragma mark - event part.

- (void)setCouponDescriptionLabelText:(NSString *)text
{
    [couponDescriptionLabel setText:text];
}

//- (void)setupTapGesture
//{
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
//    [self addGestureRecognizer:tapGesture];
//}

//- (void)setupTitleLabel
//{
//    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 320.0f, 20.0f)];
//    titleLabel.text = @"[南京东路]耐克旗舰店新年大礼包";
//    titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
//    titleLabel.textColor = [UIColor darkGrayColor];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    [self addSubview:titleLabel];
//}

//- (void)setupCommentLabel
//{
//    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 30.0f, 60.0f, 20.0f)];
//    commentLabel.text = @"总体评价:";
//    commentLabel.font = [UIFont systemFontOfSize:13.0f];
//    commentLabel.textColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
//    commentLabel.backgroundColor = [UIColor clearColor];
//    [self addSubview:commentLabel];
//}
//
//- (void)setupCommentImage
//{
//    // ShopStar30.png
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ShopStar30.png"]];
//    imageView.frame = CGRectMake(70.0f, 33.0f, 80.0f, 16.0f);
//    [self addSubview:imageView];
//}
//
//- (void)setupCommentCountLabel
//{
//    UILabel *commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(210.0f, 30.0f, 100.0f, 20.0f)];
//    commentCountLabel.text = @"评价数(10)";
//    commentCountLabel.font = [UIFont systemFontOfSize:13.0f];
//    commentCountLabel.textColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
//    commentCountLabel.backgroundColor = [UIColor clearColor];
//    commentCountLabel.textAlignment = NSTextAlignmentRight;
//    [self addSubview:commentCountLabel];
//}
//
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
