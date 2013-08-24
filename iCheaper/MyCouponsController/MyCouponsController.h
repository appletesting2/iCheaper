//
//  MyCouponsController.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MyCouponsCell.h"
#import "CouponCell.h"
#import "AnnouceView.h"
#import "Coupons.h"
#import "RetrieveData.h"
#import "FavoriteCoupon.h"
#import "CouponDetailViewController.h"
#import "TTTableViewHeaderView.h"

@interface MyCouponsController : UIViewController
{
    UILabel *navigationTitleLabel;
    UITableView *myCouponsTableView;
}

@property (nonatomic, strong) NSMutableArray *contentArray;

@end
