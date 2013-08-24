//
//  MKShopAnnotationView.m
//  TaoChen
//
//  Created by twb on 13-1-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MKShopAnnotationView.h"
#import "MKShopPlacemarkView.h"

@implementation MKShopAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //MKShopPlacemarkView *placeMarkView = [[MKShopPlacemarkView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 30.0f)];
        UIImage *image = [UIImage imageNamed:@"bg_tip_03.png"];
        //CGRect resizeRect = CGRectMake(0.0f, 0.0f, 40.0f, 25.0f);
        /*
        CGRect resizeRect = CGRectMake(0.0f, 0.0f, 60.0f, 48.0f);
        resizeRect.origin = CGPointMake(0.0, 0.0);
        UIGraphicsBeginImageContext(resizeRect.size);
        [image drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
         */
        UIImage *resizedImage;
        resizedImage = [UIImage imageWithCGImage:image.CGImage scale:2.0f orientation:UIImageOrientationDown];
        self.image = resizedImage;
        
        discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 2.0f, 40.0f, 20.0f)];
        [discountLabel setBackgroundColor:[UIColor clearColor]];
        [discountLabel setTextColor:[UIColor whiteColor]];
        [discountLabel setFont:[UIFont fontWithName:@"Didot-Bold" size:13.0f]];
        [discountLabel setTextAlignment:NSTextAlignmentCenter];
        //[discountLabel setText:@"8.8折"];
        [self addSubview:discountLabel];
        
        //[self setCalloutOffset:CGPointMake(40.0f, 10.0f)];
        [self setCenterOffset:CGPointMake(3.0f, -18.0f)];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        //tapGesture.delegate = self;
        tapGesture.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)setDiscountText:(NSString *)string
{
    [discountLabel setText:string];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)paramSender
{
    // do nothing.
    //NSLog(@"......");
}

- (void)dealloc
{
    [discountLabel removeFromSuperview];
    discountLabel = nil;
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
