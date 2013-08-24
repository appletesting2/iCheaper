//
//  MKShopAnnotationView.h
//  TaoChen
//
//  Created by twb on 13-1-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKShopAnnotationView : MKAnnotationView
{
    UILabel *discountLabel;
}

- (void)setDiscountText:(NSString *)string;

@end
