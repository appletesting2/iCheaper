//
//  TTTableViewHeaderView.h
//  TaoChen
//
//  Created by twb on 13-2-5.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCityInHeaderDelegate <NSObject>

- (void)selectCityInHeader:(NSString *)cityName;

@end

@interface TTTableViewHeaderView : UIView
{
    UIImageView *imageTitle;
    UILabel *titleLabel;
}

@property (nonatomic, weak) id<SelectCityInHeaderDelegate> delegate;

- (void)setTitleText:(NSString *)aString;
- (void)setTitleImage:(NSString *)image;


@end
