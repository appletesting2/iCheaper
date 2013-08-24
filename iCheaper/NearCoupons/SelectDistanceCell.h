//
//  SelectDistanceCell.h
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCondition.h"

@interface SelectDistanceCell : UITableViewCell
{
    UILabel *selectTipLabel;
    UISlider *distanceSlider;
    UILabel *minDistanceLabel;
    UILabel *maxDistanceLabel;
    UILabel *curDistanceLabel;
    
    UIButton *confirmButton;
    
    FilterCondition *fc;
}

- (void)setDistanceEnable:(BOOL)enable;

@end
