//
//  MoreInfoController.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreInfoCell.h"
#import "AboutUSViewController.h"
#import "DisclaimerViewController.h"

typedef NS_ENUM(NSInteger, MoreInfoSection)
{
    kMoreInfoSectionAbout = 0,
    kMoreInfoSectionAppraise,
    kMoreInfoSectionVersion,
    kMoreInfoSectionMax
};

typedef NS_ENUM(NSInteger, MoreInfoRow)
{
    kMoreInfoRowSuggestion = 0,
    kMoreInfoRowDisclaimers,
    kMoreInfoRowAbout,
    
    kMoreInfoRowAppraise = 0,
    
    kMoreInfoRowVersion = 0,
    
    kMoreInfoRowMax
};


@interface MoreInfoController : UIViewController
{
    UILabel *navigationTitleLabel;
}

@property (nonatomic, strong) NSArray *contentArray;
@property (nonatomic, strong) UITableView *moreInfoTableView;

@end
