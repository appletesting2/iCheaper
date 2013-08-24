//
//  KFCDetailView.h
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KFCDetailView : UIView
{
    UIImageView *kfcDetailImageView;
    UILabel *tipLabel;
}

@property (nonatomic, assign) CGFloat currentScale;

- (void)setKfcDetailImage:(NSString *)imageString;

@end
