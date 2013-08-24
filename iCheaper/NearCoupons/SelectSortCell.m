//
//  SelectSortCell.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectSortCell.h"

@implementation SelectSortCell

#pragma mark - system part.

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setCellBackgroundViewWithReuseIdentifier:reuseIdentifier];
        
        [self setupSortTitleLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupSortTitleLabel
{
    sortTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFilterConditionSortTitleLabelPaddingX, kFilterConditionSortTitleLabelPaddingY, kFilterConditionSortTitleLabelWidth, kFilterConditionSortTitleLabelHeight)];
    sortTitleLabel.textColor = [UIColor darkGrayColor];
    sortTitleLabel.font = [UIFont systemFontOfSize:15.0f];
    sortTitleLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:sortTitleLabel];
}

#pragma mark - event part.

- (void)setSortTitleLabelText:(NSString *)text
{
    [sortTitleLabel setText:text];
}

- (void)setCellBackgroundViewWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"SelectSortCellTop"] || [reuseIdentifier isEqualToString:@"SelectSortNearCouponsCellTop"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"SelectSortCellCenter"] || [reuseIdentifier isEqualToString:@"SelectSortNearCouponsCellCenter"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"SelectSortCellBottom"] || [reuseIdentifier isEqualToString:@"SelectSortNearCouponsCellBottom"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
}


@end
