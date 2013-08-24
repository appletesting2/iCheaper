//
//  TTMapSearchRange.m
//  TaoChen
//
//  Created by twb on 13-1-27.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTMapSearchRange.h"

@implementation TTMapSearchRange

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:0.7f];
        
        [self setupFilterCondition];
        
//        locationImage = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 25.0f, 20.0f, 20.0f)];
//        [self addSubview:locationImage];
        
        myLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 5.0f, 290.0f, 20.0f)];
        [myLocationLabel setBackgroundColor:[UIColor clearColor]];
        [myLocationLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [myLocationLabel setTextAlignment:NSTextAlignmentCenter];
//        [myLocationLabel setText:[NSString stringWithFormat:@"正在定位,请稍等...(默认查找半径:%d米)", kNearCouponsMapViewDefaultDistance]];
        [self addSubview:myLocationLabel];
        
        curDistance = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 5.0f, 320.0f, 20.0f)];
        [curDistance setBackgroundColor:[UIColor clearColor]];
        [curDistance setFont:[UIFont systemFontOfSize:13.0f]];
        [curDistance setTextAlignment:NSTextAlignmentCenter];
        [curDistance setText:[NSString stringWithFormat:@"距离%d米", [fc radius]]];
        [self addSubview:curDistance];
        
        minDistance = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 25.0f, 50.0f, 30.0f)];
        [minDistance setBackgroundColor:[UIColor clearColor]];
        [minDistance setFont:[UIFont systemFontOfSize:13.0f]];
        [minDistance setTextAlignment:NSTextAlignmentCenter];
        [minDistance setText:@"50米"];
        [self addSubview:minDistance];
        
        slider = [[UISlider alloc] initWithFrame:CGRectMake(50.0f, 25.0f, 220.0f, 30.0f)];
        [slider addTarget:self action:@selector(sliderPress:) forControlEvents:UIControlEventTouchUpInside];
        [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        slider.minimumValue = 50.0f;
        slider.maximumValue = 5000.0f;
        [slider setValue:[fc radius]];
        [self addSubview:slider];
        
        maxDistance = [[UILabel alloc] initWithFrame:CGRectMake(270.0f, 25.0f, 50.0f, 30.0f)];
        [maxDistance setBackgroundColor:[UIColor clearColor]];
        [maxDistance setFont:[UIFont systemFontOfSize:13.0f]];
        [maxDistance setTextAlignment:NSTextAlignmentCenter];
        [maxDistance setText:@"5000米"];
        [self addSubview:maxDistance];
        
    }
    return self;
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

- (void)showDistance:(BOOL)isShow
{
//    [locationImage setHidden:isShow];
//    [myLocationLabel setHidden:isShow];
//    
//    [curDistance setHidden:!isShow];
}

- (void)sliderPress:(UISlider *)sender
{
    [_delegate rangeChangeOver:sender.value];
    
    NSUInteger radius = sender.value;
    [fc setRadius:radius];
}

- (void)sliderChanged:(UISlider *)sender
{
    //NSLog(@"current value: %.2f", sender.value);
    [_delegate rangeChanged:sender.value];
    [curDistance setText:[NSString stringWithFormat:@"距离%.0f米", sender.value]];
}

- (void)setLocationImage:(NSString *)image
{
    //@"ic_settings_location.png"
//    [locationImage setImage:[UIImage imageNamed:image]];
}

- (void)setLocationLabel:(NSString *)location
{
//    [myLocationLabel setText:[NSString stringWithFormat:@"%@", location]];
}

- (void)dealloc
{
    [minDistance removeFromSuperview];
    minDistance = nil;
    
    [slider removeFromSuperview];
    slider = nil;
    
    [maxDistance removeFromSuperview];
    maxDistance = nil;
    
    [curDistance removeFromSuperview];
    curDistance = nil;
    
    [locationImage removeFromSuperview];
    locationImage = nil;
    
    [myLocationLabel removeFromSuperview];
    myLocationLabel = nil;
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
