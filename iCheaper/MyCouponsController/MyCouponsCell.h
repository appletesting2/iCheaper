//
//  MyCouponsCell.h
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCouponsCell : UITableViewCell
{
    UILabel *titleLabel;
}

- (void)setTitleString:(NSString *)string;
@end
