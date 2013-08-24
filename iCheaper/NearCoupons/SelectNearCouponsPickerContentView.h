//
//  SelectNearCouponsPickerContentView.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectNearCouponsPickerContentView : UIView
{
    UILabel *selectTipLabel;
    UISlider *distanceSlider;
    UILabel *minDistanceLabel;
    UILabel *maxDistanceLabel;
    UILabel *curDistanceLabel;
    
    UIButton *confirmButton;
}
@end
