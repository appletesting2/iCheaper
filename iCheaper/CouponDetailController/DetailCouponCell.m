//
//  DetailCouponCell.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "DetailCouponCell.h"

@implementation DetailCouponCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [self setCellBackgroundViewWithReuseIdentifier:reuseIdentifier];
        
        [self setupTitleLabel];
        
//        [self setupAddressLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupTitleLabel
{
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 15.0f, 290.0f, 25.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:titleLabel];
}

- (void)setupAddressLabel
{
    addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 30.0f, 290.0f, 20.0f)];
    addressLabel.backgroundColor = [UIColor clearColor];
    addressLabel.font = [UIFont systemFontOfSize:13.0f];
    addressLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:addressLabel];
}

#pragma mark - event part.

- (void)setTitleLabelText:(NSString *)text
{
    [titleLabel setText:text];
}

- (void)setAddressLabelText:(NSString *)text
{
    [addressLabel setText:text];
}

- (void)setCellBackgroundViewWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"CouponDetailCellTop"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"CouponDetailCellCenter"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"CouponDetailCellBottom"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
}


@end
