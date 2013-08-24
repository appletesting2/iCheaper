//
//  SelectCategoryCell.h
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCategoryCell : UITableViewCell
{
    UILabel *categoryTitleLabel;
    UIImageView *categoryImageView;
}

- (void)setCategoryImage:(NSString *)string;
- (void)setCategoryTitle:(NSString *)title;

@end
