//
//  PartnerHeader.h
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PartnerTapDelegate <NSObject>

- (void)PartnerTap;

@end

@interface PartnerHeader : UIView
{
    UIImageView *imageTitle;
    UILabel *titleLabel;
}

@property (nonatomic, weak) id<PartnerTapDelegate> delegate;

- (void)setTitleText:(NSString *)aString;
- (void)setTitleImage:(NSString *)image;

@end
