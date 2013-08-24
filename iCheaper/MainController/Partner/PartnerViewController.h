//
//  PartnerViewController.h
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartnerCell.h"
#import "NavigationItemBackButton.h"
#import "KFCListViewController.h"
#import "McdonaldsViewController.h"

#define kPartnerImageKey @"PartnerImageKey"

@interface PartnerViewController : UIViewController
{
    UILabel *navigationTitleLabel;
    UITableView *PartnerTableView;
    NSArray *partners;
}

@end
