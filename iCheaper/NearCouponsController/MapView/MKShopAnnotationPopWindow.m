//
//  MKShopAnnotationPopWindow.m
//  TaoChen
//
//  Created by twb on 13-1-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MKShopAnnotationPopWindow.h"

@implementation MKShopAnnotationPopWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.3f green:0.3f blue:0.2f alpha:0.85f];
        
        cardTypeImage = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 22.0f, 22.0f)];
        [cardTypeImage setImage:[UIImage imageNamed:@"icon_ticket.png"]];
        [self addSubview:cardTypeImage];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0f, 5.0f, 250.0f, 20.0f)];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        //[titleLabel setFont:[UIFont fontWithName:@"Didot-Bold" size:16.0f]];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setText:@"耐克旗舰店"];
        [self addSubview:titleLabel];
        
        subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 25.0f, 265.0f, 20.0f)];
        [subTitleLabel setBackgroundColor:[UIColor clearColor]];
        //[subTitleLabel setFont:[UIFont fontWithName:@"Didot-Bold" size:16.0f]];
        [subTitleLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
        [subTitleLabel setTextColor:[UIColor lightGrayColor]];
        [subTitleLabel setText:@"春节期间,南京东路耐克店全场6折起,查看更多..."];
        [self addSubview:subTitleLabel];
        
        moreButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [moreButton setFrame:CGRectMake(270.0f, 0.0f, 50.0f, 50.0f)];
        [moreButton addTarget:self action:@selector(showMoreInfomation:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:moreButton];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)paramSender
{
#ifdef __TT_TAP_POPWIN_GOTO_NEXTPAGE__
    [_delegate moreDetail];
#endif
}

- (void)showMoreInfomation:(UIButton *)sender
{
    [_delegate moreDetail];
}

- (void)dealloc
{
    [titleLabel removeFromSuperview];
    titleLabel = nil;
    
    [subTitleLabel removeFromSuperview];
    subTitleLabel = nil;
    
    [moreButton removeFromSuperview];
    moreButton = nil;
    
    [cardTypeImage removeFromSuperview];
    cardTypeImage = nil;
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
