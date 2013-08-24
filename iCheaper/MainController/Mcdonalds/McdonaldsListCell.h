//
//  McdonaldsListCell.h
//  kfc
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface McdonaldsListCell : UITableViewCell
{
    UIImageView *McdonaldsImageView;
}

- (void)setMcdonaldsImage:(NSString *)imageString;

@end
