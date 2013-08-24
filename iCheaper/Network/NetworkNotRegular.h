//
//  NetworkNotRegular.h
//  iCheaper
//
//  Created by twb on 13-4-15.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkNotRegular : UIView
{
    UILabel *errorTipLabel;
    UIImageView *errorTipImageView;
}

+ (void)createInView:(UIView *)view;
+ (void)removeFromSuperView;

@end
