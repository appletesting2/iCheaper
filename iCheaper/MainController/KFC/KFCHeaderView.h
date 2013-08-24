//
//  KFCHeaderView.h
//  iCheaper
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PartnerImageTapDelegate <NSObject>

- (void)PartnerTap;

@end

@interface KFCHeaderView : UIView
{
    UIImageView *headerImageView;
}

@property (nonatomic, weak) id<PartnerImageTapDelegate> delegate;

@end
