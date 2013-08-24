//
//  KFCDetailView.m
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCDetailView.h"

@implementation KFCDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupKfcDetailImageView];
        
        [self setupTipLabel];
    }
    return self;
}

- (void)setupKfcDetailImageView
{
    kfcDetailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kDetailImageViewPaddingX, kDetailImageViewPaddingY, kDetailImageViewWidth, kDetailImageViewHeight)];
    
    [self addSubview:kfcDetailImageView];

    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinches:)];
    [self addGestureRecognizer:pinchGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(handlePanGestures:)];
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(handleTaps:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)handlePinches:(UIPinchGestureRecognizer*)paramSender
{
    if (paramSender.state == UIGestureRecognizerStateEnded)
    {
        self.currentScale = paramSender.scale;
    }
    else if (paramSender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f)
    {
        paramSender.scale = self.currentScale;
    }
    if (paramSender.scale != NAN && paramSender.scale != 0.0)
    {
        paramSender.view.transform = CGAffineTransformMakeScale(paramSender.scale, paramSender.scale);
    }
}

- (void)handlePanGestures:(UIPanGestureRecognizer*)paramSender
{
    if (paramSender.state != UIGestureRecognizerStateEnded &&
        paramSender.state != UIGestureRecognizerStateFailed)
    {
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        paramSender.view.center = location;
    }
}

- (void) handleTaps:(UITapGestureRecognizer*)paramSender
{
    NSUInteger touchCounter = 0;
    for (touchCounter = 0; touchCounter < paramSender.numberOfTouchesRequired; touchCounter++)
    {
//        CGPoint touchPoint = [paramSender locationOfTouch:touchCounter inView:paramSender.view];
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        paramSender.view.center = location;
    }
}

- (void)setKfcDetailImage:(NSString *)imageString
{
    NSMutableString *string = [NSMutableString stringWithString:imageString];
    NSRange range;
    range.location = string.length - 7;
    range.length = 7;
    [string replaceOccurrencesOfString:@"s" withString:@"b" options:NSCaseInsensitiveSearch range:range];
    [kfcDetailImageView setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
}

- (void)setupTipLabel
{
    tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kDetailTipLabelPaddingX, kDetailTipLabelPaddingY, kDetailTipLabelWidth, kDetailTipLabelHeight)];
    tipLabel.backgroundColor = [UIColor colorWithRed:0.55f green:0.0f blue:0.0f alpha:1.0f];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"点餐前出示该优惠券,即可轻松享受优惠!";
    [self addSubview:tipLabel];
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
