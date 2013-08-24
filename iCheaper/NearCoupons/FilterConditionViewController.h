//
//  FilterConditionViewController.h
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCityViewController.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "SelectDistanceCell.h"
#import "SelectSortCell.h"
#import "SelectKeywordCell.h"
#import "SelectRegionCell.h"

#import "FilterCondition.h"
#import "NavigationItemButton.h"

//typedef NS_ENUM(NSInteger, FilterConditionSection) {
//    kREGION = 0,
//    kKEYWORD,
//    kRADIUS,
//    kSORT
//};
typedef NS_ENUM(NSInteger, FilterConditionSection) {
    kREGION = 0,
    kRADIUS,
    kSORT
};

@interface FilterConditionViewController : UIViewController
{
    UITableView *conditionTableView;
    NSArray *sortStringArray;
    NSArray *filterSectionArray;
    NSArray *filterRowHeightArray;
    NSArray *filterRowsInSection;
    
    FilterCondition *fc;
}

@end
