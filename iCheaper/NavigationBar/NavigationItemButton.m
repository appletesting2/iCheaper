//
//  NavigationItemButton.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NavigationItemButton.h"

@implementation NavigationItemButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setupInitailize];
        
    }
    return self;
}

#pragma mark - setup part.

- (void)setupInitailize
{
    [self.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitle:@"上海" forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"header-txt-btn.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"header-txt-btn-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f)] forState:UIControlStateHighlighted];
}

#pragma mark - event part.

- (void)setButtonTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
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
