//
//  TTCityHeaderView.h
//  TaoChen
//
//  Created by twb on 13-2-24.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTCityHeaderView : UIView
{
    UILabel *myLocationCityLabel;
    //da_marker_red.png
    UIImageView *myLocationImage;
}

- (void)setMyLocationCityText:(NSString *)text;

@end
