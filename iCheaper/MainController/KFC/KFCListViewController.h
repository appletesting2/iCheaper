//
//  KFCListViewController.h
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationItemBackButton.h"
#import "NavigationItemButton.h"
#import "KFCListCell.h"
#import "TFHpple.h"
#import "TFHppleElement.h"

#define kKFCListWAP (@"http://wap.kfcyouhui.com/")
#define kKFCFirstNode (@"homeList")
#define kKFCImageNode (@"dd")
#define kKFCDetailNode (@"dm")

#define kKFCImageKey (@"KFCImage")
#define kKFCTitleKey (@"KFCTitle")
#define kKFCPriceKey (@"KFCPrice")
#define kKFCExpireKey (@"KFCExpire")

#define kKFCListCount ([[self.kfcListDictionary objectForKey:kKFCImageKey] count])
#define kGetElement(key,index) ([[(NSArray *)[self.kfcListDictionary objectForKey:key] objectAtIndex:index] firstChild])

@interface KFCListViewController : UIViewController
{
    UILabel *navigationTitleLabel;
    UITableView *kfcListTableView;
}

@property (nonatomic, strong) NSDictionary *kfcListDictionary;

@end
