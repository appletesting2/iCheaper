//
//  SelectRegionCell.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectRegionCell.h"

@implementation SelectRegionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    
        [self setupRegionTitleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupRegionTitleLabel
{
    regionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFilterConditionRegionTitlePaddingX, kFilterConditionRegionTitlePaddingY, kFilterConditionRegionTitleWidth, kFilterConditionRegionTitleHeight)];
    regionTitleLabel.textColor = [UIColor darkGrayColor];
    regionTitleLabel.font = [UIFont systemFontOfSize:15.0f];
    regionTitleLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:regionTitleLabel];
}

#pragma mark - event part.

- (void)setRegionTitleLabelText:(NSString *)text
{
    [regionTitleLabel setText:text];
}

@end
