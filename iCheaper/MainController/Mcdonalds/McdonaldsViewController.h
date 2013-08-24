//
//  McdonaldsViewController.h
//  kfc
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "McdonaldsListCell.h"
#import "NavigationItemBackButton.h"
#import "NavigationItemButton.h"
#import "TFHpple.h"
#import "TFHppleElement.h"

#define kMcdonaldsBaseUrl (@"http://www.mcdonalds.com.cn/")
#define kMcdonaldsDownloadUrl (@"mclub/coupon_print2.aspx")
#define kMcdonaldsImageKey (@"McdonaldsImage")
// ../
#define kMcdonaldsImageUrlStart 3

#define kMcdonaldsListCount ([[self.mcdonaldsListDictionary objectForKey:kMcdonaldsImageKey] count])
#define kMcdonaldsGetElement(key,index) ((NSDictionary *)[[(NSArray *)[self.mcdonaldsListDictionary objectForKey:key] objectAtIndex:index] attributes])

@interface McdonaldsViewController : UIViewController
{
    UILabel *navigationTitleLabel;
    UITableView *mcdonaldsListTableView;
}

@property (nonatomic, strong) NSDictionary *mcdonaldsListDictionary;

@end
