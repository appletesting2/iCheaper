//
//  SelectCategoriesViewController.h
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCategoryCell.h"
#import "RetrieveData.h"
#import "Categories.h"
#import "NavigationItemButton.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "FilterCondition.h"
#import "ExpandableTableView.h"

#define kDefaultAllChannelCellSection 0
#define kDefaultAllChannelCellRow 0
#define kCategoryNameKey @"category_name"
#define kNumberOfRowsInSection(section) ([[self.categoryList[section] valueForKey:@"category"] count])
#define kContentArrayInSection(section) ([self.categoryList[section] valueForKey:@"category"])

@interface SelectCategoriesViewController : UIViewController
{
    NSMutableArray *categoryArray;
    NSArray *categoryImageArray;
    ExpandableTableView *categoriesTableView;
    FilterCondition *fc;
}


@property (nonatomic, strong) NSArray *categoryList;
@property (nonatomic, strong) NSMutableArray *expandList;

@end
