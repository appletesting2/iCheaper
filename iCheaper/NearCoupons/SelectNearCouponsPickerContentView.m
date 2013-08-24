//
//  SelectNearCouponsPickerContentView.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectNearCouponsPickerContentView.h"

@implementation SelectNearCouponsPickerContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupSelectTipLabel];
        
        [self setupDistanceSlider];
        
        [self setupMinDistanceLabel];
        
        [self setupMaxDistanceLabel];
        
        [self setupCurDistanceLabel];
        
//        [self setupConfirmButton];
    }
    return self;
}

#pragma mark - setup part

- (void)setupSelectTipLabel
{
    selectTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewTipLabelPaddingX, kCouponSelectNearPickerViewTipLabelPaddingY, kCouponSelectNearPickerViewTipLabelWidth, kCouponSelectNearPickerViewTipLabelHeight)];
    selectTipLabel.backgroundColor = [UIColor clearColor];
    selectTipLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    selectTipLabel.textAlignment = NSTextAlignmentCenter;
    selectTipLabel.textColor = [UIColor darkGrayColor];
    selectTipLabel.text = @"请选择范围";
    [self addSubview:selectTipLabel];
}

- (void)setupDistanceSlider
{
    distanceSlider = [[UISlider alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewSliderPaddingX, kCouponSelectNearPickerViewSliderPaddingY, kCouponSelectNearPickerViewSliderWidth, kCouponSelectNearPickerViewSliderHeight)];
    // UIControlEventTouchUpInside
    [distanceSlider addTarget:self action:@selector(distanceSliderChanged:) forControlEvents:UIControlEventValueChanged];
    distanceSlider.minimumValue = 50.0f;
    distanceSlider.maximumValue = 5000.0f;
    distanceSlider.value = 500.0f;
    [self addSubview:distanceSlider];
}

- (void)setupMinDistanceLabel
{
    minDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewMinLabelPaddingX, kCouponSelectNearPickerViewMinLabelPaddingY, kCouponSelectNearPickerViewMinLabelWidth, kCouponSelectNearPickerViewMinLabelHeight)];
    minDistanceLabel.backgroundColor = [UIColor clearColor];
    minDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    minDistanceLabel.textAlignment = NSTextAlignmentCenter;
    minDistanceLabel.textColor = [UIColor lightGrayColor];
    minDistanceLabel.text = @"50米";
    [self addSubview:minDistanceLabel];
}

- (void)setupMaxDistanceLabel
{
    maxDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewMaxLabelPaddingX, kCouponSelectNearPickerViewMaxLabelPaddingY, kCouponSelectNearPickerViewMaxLabelWidth, kCouponSelectNearPickerViewMaxLabelHeight)];
    maxDistanceLabel.backgroundColor = [UIColor clearColor];
    maxDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    maxDistanceLabel.textAlignment = NSTextAlignmentCenter;
    maxDistanceLabel.textColor = [UIColor lightGrayColor];
    maxDistanceLabel.text = @"5000米";
    [self addSubview:maxDistanceLabel];
}

- (void)setupCurDistanceLabel
{
    curDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kCouponSelectNearPickerViewCurrentLabelPaddingX, kCouponSelectNearPickerViewCurrentLabelPaddingY, kCouponSelectNearPickerViewCurrentLabelWidth, kCouponSelectNearPickerViewCurrentLabelHeight)];
    curDistanceLabel.backgroundColor = [UIColor clearColor];
    curDistanceLabel.font = [UIFont systemFontOfSize:12.0f];
    curDistanceLabel.textAlignment = NSTextAlignmentCenter;
    curDistanceLabel.textColor = [UIColor darkGrayColor];
    curDistanceLabel.text = @"距离500米";
    [self addSubview:curDistanceLabel];
}

- (void)setupConfirmButton
{
    confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(kCouponSelectNearConfirmButtonPaddingX, kCouponSelectNearConfirmButtonPaddingY, kCouponSelectNearConfirmButtonWidth, kCouponSelectNearConfirmButtonHeight)];
    confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [confirmButton setBackgroundImage:[[UIImage imageNamed:@"big-btn-green.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateNormal];
    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:confirmButton];
}

#pragma mark - event part.

- (void)distanceSliderChanged:(UISlider *)sender
{
    NSString *distanceString = [NSString stringWithFormat:@"距离%.0f米", sender.value];
    [curDistanceLabel setText:distanceString];
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
