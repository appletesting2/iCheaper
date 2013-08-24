//
//  TTTableViewHeaderView.m
//  TaoChen
//
//  Created by twb on 13-2-5.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTTableViewHeaderView.h"

@implementation TTTableViewHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 40.f)];
//        self.backgroundColor = [UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:0.8f];
        self.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:0.8f];
        
        imageTitle = [[UIImageView alloc] initWithFrame:CGRectMake(18.0f, 12.0f, 22.0f, 22.0f)];
        [self addSubview:imageTitle];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(48.0f, 13.5f, 320.0f, 20.0f)];
        [titleLabel setTextColor:[UIColor darkGrayColor]];
        [titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
//        [titleLabel setText:@"南京东路耐克旗舰店春节大联欢,全场6折起."];
        [self addSubview:titleLabel];
        
        [self setupGesture];
    }
    return self;
}

#pragma mark - setup part.

- (void)setupGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - event part.

- (void)handleTapGesture:(UITapGestureRecognizer *)sender
{
    [_delegate selectCityInHeader:titleLabel.text];
}

- (void)setTitleText:(NSString *)aString
{
    [titleLabel setText:aString];
}

- (void)setTitleImage:(NSString *)image
{
    [imageTitle setImage:[UIImage imageNamed:image]];
}

- (void)dealloc
{
    [titleLabel removeFromSuperview];
    titleLabel = nil;
    
    [imageTitle removeFromSuperview];
    imageTitle = nil;
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
