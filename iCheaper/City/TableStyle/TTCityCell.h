//
//  TTCityCell.h
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTCityCell : UITableViewCell
{
    UILabel *cityNameLabel;
}

- (void)setCityName:(NSString *)cityName;

@end
