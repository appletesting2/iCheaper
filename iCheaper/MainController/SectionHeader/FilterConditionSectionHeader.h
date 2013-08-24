//
//  FilterConditionSectionHeader.h
//  iCheaper
//
//  Created by twb on 13-5-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCRoundSwitch.h"
#import "FilterCondition.h"

@protocol FCSectionSwitchValueChangedDelegate <NSObject>

- (void)sectionSwitchChanged:(BOOL)isOn;

@end

@interface FilterConditionSectionHeader : UIView
{
    UILabel *sectionTitle;
    DCRoundSwitch *sectionSwitch;
    FilterCondition *fc;
}

@property (nonatomic, weak) id<FCSectionSwitchValueChangedDelegate> delegate;

- (void)setSectionTitle:(NSString *)text;
- (void)setSectionSwitch:(BOOL)hidden;
- (void)setSectionSwitchStatus:(BOOL)on;

@end
