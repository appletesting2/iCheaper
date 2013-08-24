//
//  SelectRegionCell.h
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectRegionCell : UITableViewCell
{
    UILabel *regionTitleLabel;
}

- (void)setRegionTitleLabelText:(NSString *)text;

@end
