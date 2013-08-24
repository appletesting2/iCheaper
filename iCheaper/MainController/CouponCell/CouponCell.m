//
//  CouponCell.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "CouponCell.h"
#import "DownloadCountColor.h"

@implementation CouponCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self setupBackgroudView];
        
        [self setupLogoImageView];
        
        [self setupTitleLabel];
        
        [self setupSubTitleLabel];
        
        [self setupCategoryLabel];
        
        [self setupDownloadCountLabel];
        
        [self setupDistanceLabel];
        
        [self setupCellCouponShadow];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - custom background view part.

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    customBGView.alpha = 1.0f;
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    customBGView.alpha = 1.0f;
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    customBGView.alpha = 0.0f;
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    customBGView.alpha = 0.0f;
    [super touchesEnded:touches withEvent:event];
}

#pragma mark - setup part.

- (void)setupBackgroudView
{
    customBGView = [[UIView alloc] initWithFrame:CGRectMake(kCouponCellPadding, kCouponCellPadding, kScreenWidth - kCouponCellPadding * 2, kCouponCellHeight - kCouponCellPadding - kCouponCellShadowHeight)];
    customBGView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.5f];
    //    customBGView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.6f];
    customBGView.alpha = 0.0f;
    [self.contentView addSubview:customBGView];
}

- (void)setupLogoImageView
{
    logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kCouponCellLogoPaddingX, kCouponCellLogoPaddingY, kCouponCellLogoImageWidth, kCouponCellLogoImageHeight)];
//    [logoImageView setBackgroundColor:[UIColor colorWithWhite:0.9f alpha:1.0f]];
    logoImageView.image = [UIImage imageNamed:@"coupon_placeholder_default.png"];
    [self.contentView addSubview:logoImageView];
}

- (void)setupDownloadCountLabel
{
//    downloadBgView = [[UIView alloc] initWithFrame:CGRectMake(kCouponCellDownloadCountPaddingX, kCouponCellDownloadCountPaddingY, kCouponCellDownloadCountWidth, kCouponCellDownloadCountHeight)];
    
    downloadCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponCellDownloadCountLabelPaddingX, kCouponCellDownloadCountLabelPaddingY, kCouponCellDownloadCountLabelWidth, kCouponCellDownloadCountLabelHeight)];
    downloadCountLabel.backgroundColor = [UIColor clearColor];
    downloadCountLabel.textColor = [UIColor lightGrayColor];
//    downloadCountLabel.numberOfLines = 0;
    downloadCountLabel.textAlignment = NSTextAlignmentRight;
    downloadCountLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:downloadCountLabel];
}

- (void)setupTitleLabel
{
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponCellPadding * 2 + kCouponCellLogoImageWidth + kCouponCellLogoPaddingX, kCouponCellPadding, kScreenWidth - kCouponCellPadding * 3 - kCouponCellLogoImageWidth, kCouponCellTitleHeight)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor darkGrayColor];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [self.contentView addSubview:titleLabel];
}

- (void)setupSubTitleLabel
{
    subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponCellPadding * 2 + kCouponCellLogoImageWidth + kCouponCellLogoPaddingX, kCouponCellPadding + kCouponCellTitleHeight, kScreenWidth - kCouponCellPadding * 3 - kCouponCellLogoImageWidth - kCouponCellLogoPaddingX, kCouponCellSubTitleHeight)];
    subTitleLabel.backgroundColor = [UIColor clearColor];
    subTitleLabel.textColor = [UIColor orangeColor];
    subTitleLabel.numberOfLines = 0;
    subTitleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:subTitleLabel];
}

- (void)setupCategoryLabel
{
    categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponCellPadding * 2 + kCouponCellLogoImageWidth + kCouponCellLogoPaddingX, kCouponCellPadding + kCouponCellTitleHeight + kCouponCellSubTitleHeight, kCouponCellCategoryWidth, kCouponCellCategoryHeight)];
    categoryLabel.backgroundColor = [UIColor clearColor];
    categoryLabel.textColor = [UIColor lightGrayColor];
    //    categoryLabel = 0;
    categoryLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:categoryLabel];
}

- (void)setupDistanceLabel
{
    distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponCellDistanceLabelPaddingX, kCouponCellDistanceLabelPaddingY, kCouponCellDistanceLabelWidth, kCouponCellDistanceLabelHeight)];
    distanceLabel.backgroundColor = [UIColor colorWithWhite:0.8f alpha:0.85f];
    distanceLabel.textColor = [UIColor darkGrayColor];
    distanceLabel.textAlignment = NSTextAlignmentCenter;
    distanceLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    [self.contentView addSubview:distanceLabel];
}

- (void)setupCellCouponShadow
{
    UIImageView *couponShadow = [[UIImageView alloc] initWithFrame:CGRectMake(kCouponCellPadding, kCouponCellHeight - kCouponCellShadowHeight, kScreenWidth - kCouponCellPadding * 2, kCouponCellShadowHeight)];
    couponShadow.image = [UIImage imageNamed:@"coupon-shadow.png"];
    [self.contentView addSubview:couponShadow];
}


#pragma mark - event part.

- (void)setLogoImage:(NSString *)string
{
    [[ToolKit sharedInstance] setImage:logoImageView url:string];
}

- (void)setTitleText:(NSString *)text
{
    [titleLabel setText:text];
}

- (void)setSubTitleText:(NSString *)text
{
    [subTitleLabel setText:text];
}

- (void)setCategoryText:(NSString *)text
{
    [categoryLabel setText:text];
}

- (void)setDownloadCount:(NSUInteger)count
{
    [downloadCountLabel setText:[NSString stringWithFormat:@"已下载%d次", count]];
//    [downloadCountLabel setText:[NSString stringWithFormat:@"已下载\n%d\n次", count]];
    // set text color and background color.
//    [downloadCountLabel setTextColor:[DownloadCountColor getTextColorWithCount:count]];
//    [downloadBgView setBackgroundColor:[DownloadCountColor getBackgroundColorWithCount:count]];
}

- (void)setDistanceLabelText:(NSInteger)meter
{
    if (meter > 0)
    {
        [distanceLabel setHidden:NO];
        [distanceLabel setText:[NSString stringWithFormat:@"%d米", meter]];
    }
    else
    {
        [distanceLabel setHidden:YES];
        [distanceLabel setText:@""];
    }
}

- (void)setCustomBGViewAlpha:(CGFloat)alpha
{
    customBGView.alpha = alpha;
}

@end
