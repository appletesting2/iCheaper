//
//  MyCouponsCell.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MyCouponsCell.h"

@implementation MyCouponsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setCellBackgroundViewWithReuseIdentifier:reuseIdentifier];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [self setupTitle];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupTitle
{
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, kScreenWidth - 20.0f, 20.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:15.0f];
    titleLabel.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:titleLabel];
}

- (void)setTitleString:(NSString *)string
{
    [titleLabel setText:string];
}

- (void)setCellBackgroundViewWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"MyCouponCellTop"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MyCouponCellCenter"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MyCouponCellBottom"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MyCouponCellSingle"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
}

@end
