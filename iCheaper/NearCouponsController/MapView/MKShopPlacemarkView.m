//
//  MKShopPlacemarkView.m
//  TaoChen
//
//  Created by twb on 13-1-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MKShopPlacemarkView.h"

//static CGFloat kRoundBoxLeft = 0.0f;

@implementation MKShopPlacemarkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[UIColor blackColor] setFill];
    
    // draw the pointed shape
    UIBezierPath *pointShape = [UIBezierPath bezierPath];
    [pointShape moveToPoint:CGPointMake(self.frame.size.width / 2, 0.0)];
    [pointShape addLineToPoint:CGPointMake(0.0, self.frame.size.height)];
    [pointShape addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [pointShape fill];
    
    // draw the rounded box
    UIBezierPath *roundedRect =
    [UIBezierPath bezierPathWithRoundedRect:
     CGRectMake(kRoundBoxLeft, self.frame.size.height / 5, self.frame.size.width - kRoundBoxLeft, self.frame.size.height) cornerRadius:3.0f];
    //roundedRect.lineWidth = 1.0;
    [roundedRect fill];
}
*/
@end
