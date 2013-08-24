//
//  TTCityHeaderView.m
//  TaoChen
//
//  Created by twb on 13-2-24.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCityHeaderView.h"

@implementation TTCityHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        myLocationImage = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f, 10.0f, 30.0f, 30.0f)];
        myLocationImage.image = [UIImage imageNamed:@"turn_arrive.png"];
        [self addSubview:myLocationImage];
        
        UILabel *myLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(50.0f, 15.0f, 170.0f, 20.0f)];
        [myLocationLabel setBackgroundColor:[UIColor clearColor]];
        [myLocationLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [myLocationLabel setTextColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
        [myLocationLabel setText:@"GPS定位您所在的城市:"];
        [self addSubview:myLocationLabel];
        
        myLocationCityLabel = [[UILabel alloc] initWithFrame:CGRectMake(220.0f, 15.0f, 50.0f, 20.0f)];
        [myLocationCityLabel setBackgroundColor:[UIColor clearColor]];
        [myLocationCityLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [self addSubview:myLocationCityLabel];
    }
    return self;
}

- (void)setMyLocationCityText:(NSString *)text
{
    [myLocationCityLabel setText:text];
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
