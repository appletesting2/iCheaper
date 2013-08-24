//
//  KFCListCell.h
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFCListCell : UITableViewCell
{
    UIImageView *kfcImageView;
    UILabel *kfcTitleLabel;
    UILabel *kfcPriceLabel;
    UILabel *kfcExpireLabel;
}

- (void)setKfcImage:(NSString *)imageString;
- (void)setKfcTitle:(NSString *)title;
- (void)setKfcPrice:(NSString *)price;
- (void)setKfcExpire:(NSString *)date;

@end
