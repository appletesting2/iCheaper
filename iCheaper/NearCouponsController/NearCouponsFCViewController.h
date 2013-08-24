//
//  NearCouponsFCViewController.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCondition.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "SelectDistanceCell.h"
#import "SelectSortCell.h"
#import "NavigationItemButton.h"


typedef NS_ENUM(NSInteger, NearCouponFCSection) {
    kNearCouponsRadius = 0,
    kNearCouponsSort
};


@interface NearCouponsFCViewController : UIViewController
{
    UITableView *conditionTableView;
    NSArray *sortStringArray;
    NSArray *filterSectionArray;
    NSArray *filterRowHeightArray;
    NSArray *filterRowsInSection;
    
    FilterCondition *fc;
}
@end
