//
//  SelectDistanceCell.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectDistanceCell.h"


@implementation SelectDistanceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        [self setupSelectTipLabel];
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        
        [self setupFilterCondition];
        
        [self setupDistanceSlider];
        
        [self setupMinDistanceLabel];
        
        [self setupMaxDistanceLabel];
        
        [self setupCurDistanceLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

- (void)setupSelectTipLabel
{
    selectTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewTipLabelPaddingX, kCouponSelectNearPickerViewTipLabelPaddingY, kCouponSelectNearPickerViewTipLabelWidth, kCouponSelectNearPickerViewTipLabelHeight)];
    selectTipLabel.backgroundColor = [UIColor clearColor];
    selectTipLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    selectTipLabel.textAlignment = NSTextAlignmentCenter;
    selectTipLabel.textColor = [UIColor darkGrayColor];
    selectTipLabel.text = @"请选择范围";
    [self.contentView addSubview:selectTipLabel];
}

- (void)setupDistanceSlider
{
    distanceSlider = [[UISlider alloc] initWithFrame:CGRectMake(kFilterConditionDistanceSliderPaddingX, kFilterConditionDistanceSliderPaddingY, kFilterConditionDistanceSliderWidth, kFilterConditionDistanceSliderHeight)];
    // UIControlEventTouchUpInside
    [distanceSlider addTarget:self action:@selector(distanceSliderChanged:) forControlEvents:UIControlEventValueChanged];
    distanceSlider.minimumValue = 50.0f;
    distanceSlider.maximumValue = 5000.0f;
    distanceSlider.value = [fc radius];
    [self.contentView addSubview:distanceSlider];
}

- (void)setupMinDistanceLabel
{
    minDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFilterConditionDistanceMinLabelPaddingX, kFilterConditionDistanceMinLabelPaddingY, kFilterConditionDistanceMinLabelWidth, kFilterConditionDistanceMinLabelHeight)];
    minDistanceLabel.backgroundColor = [UIColor clearColor];
    minDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    minDistanceLabel.textAlignment = NSTextAlignmentCenter;
    minDistanceLabel.textColor = [UIColor lightGrayColor];
    minDistanceLabel.text = @"50米";
    [self.contentView addSubview:minDistanceLabel];
}

- (void)setupMaxDistanceLabel
{
    maxDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFilterConditionDistanceMaxLabelPaddingX, kFilterConditionDistanceMaxLabelPaddingY, kFilterConditionDistanceMaxLabelWidth, kFilterConditionDistanceMaxLabelHeight)];
    maxDistanceLabel.backgroundColor = [UIColor clearColor];
    maxDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    maxDistanceLabel.textAlignment = NSTextAlignmentCenter;
    maxDistanceLabel.textColor = [UIColor lightGrayColor];
    maxDistanceLabel.text = @"5000米";
    [self.contentView addSubview:maxDistanceLabel];
}

- (void)setupCurDistanceLabel
{
    curDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFilterConditionDistanceCurrentLabelPaddingX, kFilterConditionDistanceCurrentLabelPaddingY, kFilterConditionDistanceCurrentLabelWidth, kFilterConditionDistanceCurrentLabelHeight)];
    curDistanceLabel.backgroundColor = [UIColor clearColor];
    curDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    curDistanceLabel.textAlignment = NSTextAlignmentCenter;
    curDistanceLabel.textColor = [UIColor darkGrayColor];
    curDistanceLabel.text = [NSString stringWithFormat:@"距离%d米", [fc radius]];
    [self.contentView addSubview:curDistanceLabel];
}

#pragma mark - event part.

- (void)distanceSliderChanged:(UISlider *)sender
{
    NSString *distanceString = [NSString stringWithFormat:@"距离%.0f米", sender.value];
    [curDistanceLabel setText:distanceString];
    
    NSUInteger radius = sender.value;
    [fc setRadius:radius];
}

- (void)setDistanceEnable:(BOOL)enable
{
    distanceSlider.enabled = enable;
    if (enable)
    {
        curDistanceLabel.textColor = [UIColor darkGrayColor];
    }
    else
    {
        curDistanceLabel.textColor = [UIColor lightGrayColor];
    }
}

@end
