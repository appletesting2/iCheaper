//
//  KFCListViewController+Datasource.m
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCListViewController+Datasource.h"

@implementation KFCListViewController (Datasource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kKFCListCount;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kKFCListCell = @"KFCListCell";
    
//    KFCListCell *cell = [tableView dequeueReusableCellWithIdentifier:kKFCListCell forIndexPath:indexPath];
    KFCListCell *cell = [tableView dequeueReusableCellWithIdentifier:kKFCListCell];
    if (cell == nil)
    {
        cell = [[KFCListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kKFCListCell];
    }
    
    [cell setKfcImage:[NSString stringWithFormat:@"%@%@", kKFCListWAP, [kGetElement(kKFCImageKey, indexPath.row) getImageString]]];
    
    [cell setKfcTitle:[kGetElement(kKFCTitleKey, indexPath.row) content]];
    [cell setKfcPrice:[kGetElement(kKFCPriceKey, indexPath.row) content]];
    [cell setKfcExpire:[kGetElement(kKFCExpireKey, indexPath.row) content]];
    
    NSLog(@"expire = %@", [kGetElement(kKFCExpireKey, indexPath.row) content]);
    NSLog(@"Logo = %@", [NSString stringWithFormat:@"%@%@", kKFCListWAP, [kGetElement(kKFCImageKey, indexPath.row) getImageString]]);
    
    return cell;
}

@end
