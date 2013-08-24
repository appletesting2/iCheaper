//
//  NavigationItemBackButton.m
//  iCheaper
//
//  Created by twb on 13-4-15.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NavigationItemBackButton.h"

@implementation NavigationItemBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setImage:[UIImage imageNamed:@"header-back.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"header-back-pressed.png"] forState:UIControlStateHighlighted];
    }
    return self;
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
