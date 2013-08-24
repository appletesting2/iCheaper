//
//  DetailTitleView.h
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTitleView : UIView
{
//     UILabel *titleLabel;
    UILabel *couponDescriptionLabel;
}

- (void)setCouponDescriptionLabelText:(NSString *)text;

@end
