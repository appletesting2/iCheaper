//
//  TabBarController.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UITabBarItemTag) {
    kTabBarItemFirstTag = 120,
    kTabBarItemSecondTag,
    kTabBarItemThirdTag,
    kTabBarItemFourthTag
};


@class JASidePanelController;
@class MyCouponsController;
@class MoreInfoController;

@interface TabBarController : UITabBarController

@property (strong, nonatomic) JASidePanelController *panelViewController;
@property (strong, nonatomic) JASidePanelController *panelNearCouponViewController;
@property (strong, nonatomic) MyCouponsController *myCouponsController;
@property (strong, nonatomic) MoreInfoController *moreInfoController;

@end
