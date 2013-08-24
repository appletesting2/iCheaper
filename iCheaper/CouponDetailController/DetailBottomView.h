//
//  DetailBottomView.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RetrieveCouponsDelegate <NSObject>

- (void)RetrieveCoupons;
- (void)SendMessage;

@end

@interface DetailBottomView : UIView
@property (nonatomic, strong) UIButton *retrieveCouponButton;
@property (nonatomic, strong) UIButton *sendMessageButton;
@property (nonatomic, weak) id<RetrieveCouponsDelegate> delegate;
@end
