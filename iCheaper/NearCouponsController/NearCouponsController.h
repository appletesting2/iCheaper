//
//  NearCouponsController.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTNearShopMapView.h"
#import "CouponsAnnotation.h"
#import "NavigationItemButton.h"
#import "RetrieveData.h"
#import "MBProgressHUD.h"
#import "FilterCondition.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"

@interface NearCouponsController : UIViewController
{
    UILabel *navigationTitleLabel;
    TTNearShopMapView *nearShopMapView;
    NSMutableArray *shopAnnotations;
    NSMutableArray *couponsBusinesses;
    
    FilterCondition *fc;
    
    NavigationItemButton *leftBarItem;
}

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDC;

- (void)setupAnnotation;

@end
