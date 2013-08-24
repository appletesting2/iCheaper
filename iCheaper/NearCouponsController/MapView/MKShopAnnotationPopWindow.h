//
//  MKShopAnnotationPopWindow.h
//  TaoChen
//
//  Created by twb on 13-1-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTMapPopWindowDelegate <NSObject>

- (void)moreDetail;

@end

@interface MKShopAnnotationPopWindow : UIView
{
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UIButton *moreButton;
    UIImageView *cardTypeImage;
}

@property (nonatomic, weak) id<TTMapPopWindowDelegate> delegate;

@end
