//
//  TTMapSearchRange.h
//  TaoChen
//
//  Created by twb on 13-1-27.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCondition.h"

@protocol TTMapSearchRangeChangeDelegate <NSObject>

- (void)rangeChanged:(CGFloat)value;
- (void)rangeChangeOver:(CGFloat)value;
@end

@interface TTMapSearchRange : UIView
{
    UIImageView *locationImage;
    UILabel *myLocationLabel;
    
    UISlider *slider;
    UILabel *minDistance;
    UILabel *maxDistance;
    UILabel *curDistance;
    
    FilterCondition *fc;
}

@property (nonatomic, weak) id<TTMapSearchRangeChangeDelegate> delegate;

- (void)setLocationImage:(NSString *)image;
- (void)setLocationLabel:(NSString *)location;
- (void)showDistance:(BOOL)isShow;

@end
