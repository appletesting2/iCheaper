//
//  CouponCell.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponCell : UITableViewCell
{
    UIImageView *logoImageView;
//    UIView *downloadBgView;
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *categoryLabel;
    UILabel *downloadCountLabel;
    UILabel *distanceLabel;
    UIView *customBGView;
}

- (void)setLogoImage:(NSString *)string;
- (void)setTitleText:(NSString *)text;
- (void)setSubTitleText:(NSString *)text;
- (void)setCategoryText:(NSString *)text;
- (void)setDownloadCount:(NSUInteger)count;
- (void)setDistanceLabelText:(NSInteger)meter;


- (void)setCustomBGViewAlpha:(CGFloat)alpha;

@end
