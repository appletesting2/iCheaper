//
//  TTTableViewFooterLoadMore.m
//  TaoChen
//
//  Created by twb on 13-2-22.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTTableViewFooterLoadMore.h"

@implementation TTTableViewFooterLoadMore

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self setBackgroundColor:[UIColor clearColor]];
        
        loadingAnimation = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingAnimation setFrame:CGRectMake(60.0f, 5.0f, 50.0f, 50.0f)];
//        [loadingAnimation setHidesWhenStopped:YES];
        [self addSubview:loadingAnimation];
        
        loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 15.0f, 150.0f, 30.0f)];
        [loadingLabel setTextAlignment:NSTextAlignmentCenter];
        [loadingLabel setBackgroundColor:[UIColor clearColor]];
        [loadingLabel setFont:[UIFont systemFontOfSize:18.0f]];
        [loadingLabel setTextColor:[UIColor lightGrayColor]];
//        [loadingLabel setText:@"正在加载..."];
        //        loadingLabel.center = CGPointMake(self.center.x, self.center.y + 5.0f);
        [self addSubview:loadingLabel];
        
    }
    return self;
}

- (void)setFooterLoading
{
    loadingAnimation.hidden = NO;
    [loadingLabel setText:@"正在载入"];
    if (![loadingAnimation isAnimating]) {
        [loadingAnimation startAnimating];
    }
}

- (void)setFooterFinish
{
    loadingAnimation.hidden = YES;
    [loadingLabel setText:@"完成加载"];
}

- (void)setLoadingLabelText:(NSString *)text
{
    [loadingLabel setText:text];
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
