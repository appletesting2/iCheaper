//
//  KFCListCell.m
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCListCell.h"


#define kKFCImagePaddingX (5.0f)
#define kKFCImagePaddingY (18.0f)
#define kKFCImageWidth (95.0f)
#define kKFCImageHeight (63.5f)

#define kKFCTitlePaddingX (10.0f + kKFCImageWidth)
#define kKFCTitlePaddingY (5.0f)
#define kKFCTitleWidth (220.0f)
#define kKFCTitleHeight (40.0f)

#define kKFCPricePaddingX (10.0f + kKFCImageWidth)
#define kKFCPricePaddingY (50.0f)
#define kKFCPriceWidth (220.0f)
#define kKFCPriceHeight (20.0f)

#define kKFCExpirePaddingX (10.0f + kKFCImageWidth)
#define kKFCExpirePaddingY (75.0f)
#define kKFCExpireWidth (220.0f)
#define kKFCExpireHeight (20.0f)

@implementation KFCListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
        bgView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:0.9f];
        self.selectedBackgroundView = bgView;
        
        [self setupKfcImageView];
        [self setupKfcTitleLabel];
        [self setupKfcPriceLabel];
        [self setupKfcExpireLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part

- (void)setupKfcImageView
{
    kfcImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kKFCImagePaddingX, kKFCImagePaddingY, kKFCImageWidth, kKFCImageHeight)];
    [self.contentView addSubview:kfcImageView];
}

- (void)setupKfcTitleLabel
{
    kfcTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kKFCTitlePaddingX, kKFCTitlePaddingY, kKFCTitleWidth, kKFCTitleHeight)];
    kfcTitleLabel.backgroundColor = [UIColor clearColor];
    kfcTitleLabel.textColor = [UIColor darkGrayColor];
    kfcTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    kfcTitleLabel.numberOfLines = 0;
    [self.contentView addSubview:kfcTitleLabel];
}

- (void)setupKfcPriceLabel
{
    kfcPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kKFCPricePaddingX, kKFCPricePaddingY, kKFCPriceWidth, kKFCPriceHeight)];
    kfcPriceLabel.backgroundColor = [UIColor clearColor];
    kfcPriceLabel.textColor = [UIColor orangeColor];
    kfcPriceLabel.font = [UIFont systemFontOfSize:14.0f];
    kfcPriceLabel.numberOfLines = 0;
    [self.contentView addSubview:kfcPriceLabel];
}

- (void)setupKfcExpireLabel
{
    kfcExpireLabel = [[UILabel alloc] initWithFrame:CGRectMake(kKFCExpirePaddingX, kKFCExpirePaddingY, kKFCExpireWidth, kKFCExpireHeight)];
    kfcExpireLabel.backgroundColor = [UIColor clearColor];
    kfcExpireLabel.textColor = [UIColor lightGrayColor];
    kfcExpireLabel.font = [UIFont systemFontOfSize:14.0f];
    kfcExpireLabel.numberOfLines = 0;
    [self.contentView addSubview:kfcExpireLabel];
}

#pragma mark - set part

- (void)setKfcImage:(NSString *)imageString
{
    [[ToolKit sharedInstance] setImage:kfcImageView url:imageString];
//    [kfcImageView setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil];
//    kfcImageView.image = [UIImage imageNamed:imageString];
}

-  (void)setKfcTitle:(NSString *)title
{
    kfcTitleLabel.text = title;
}

- (void)setKfcPrice:(NSString *)price
{
    kfcPriceLabel.text = price;
}

- (void)setKfcExpire:(NSString *)date
{
    kfcExpireLabel.text = date;
}


@end
