//
//  DetailCouponCell.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCouponCell : UITableViewCell
{
    UILabel *titleLabel;
    UILabel *addressLabel;
}

- (void)setTitleLabelText:(NSString *)text;
- (void)setAddressLabelText:(NSString *)text;

@end
