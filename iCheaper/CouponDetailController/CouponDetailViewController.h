//
//  CouponDetailViewController.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTitleView.h"
#import "DetailBottomView.h"
#import "DetailCouponCell.h"
#import "DetailCouponHeaderView.h"
#import "DetailCouponWeb.h"
#import "DetailCouponFooterView.h"
#import "NavigationItemBackButton.h"
#import "RetrieveData.h"
#import "Coupons.h"
#import "SendMessageViewController.h"
#import "FavoriteCoupon.h"

#define BUFFER_SIZE 1024 * 100

typedef NS_ENUM(NSInteger, FromWhereTag) {
    kFromMainController = 100,
    kFromNearController,
    kFromMyFavoriteController
};


@interface CouponDetailViewController : UIViewController
{
    UILabel *navigationTitleLabel;
    
    DetailTitleView *detailTitleView;
    UITableView *detailTableView;
    DetailBottomView *detailBottomView;
    
    DetailCouponHeaderView *detailHeaderView;
    DetailCouponWeb *detailCouponWeb;
    DetailCouponFooterView *detailFooterView;
    
    NSMutableArray *businessArray;
    
    enum WXScene _scene;
}

@property (nonatomic, strong) Coupons *coupon;
@property (nonatomic, assign) FromWhereTag fromTag;

- (void)sendShareAppContent;

@end
