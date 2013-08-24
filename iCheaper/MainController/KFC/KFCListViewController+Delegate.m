//
//  KFCListViewController+Delegate.m
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCListViewController+Delegate.h"
#import "UIViewController+KNSemiModal.h"
#import "KFCDetailView.h"

@implementation KFCListViewController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *couponSmallImageUrlString = [NSString stringWithFormat:@"%@%@", kKFCListWAP, [kGetElement(kKFCImageKey, indexPath.row) getImageString]];
    KFCDetailView *detailView = [[KFCDetailView alloc] initWithFrame:CGRectMake(kDetailViewPaddingX, kDetailViewPaddingY, kDetailViewWidth_, kDetailViewHeight_)];
    [detailView setKfcDetailImage:couponSmallImageUrlString];
    
    [self.navigationController presentSemiView:detailView];
}

@end
