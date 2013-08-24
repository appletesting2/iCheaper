//
//  McdonaldsViewController+Datasource.m
//  kfc
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "McdonaldsViewController+Datasource.h"

@implementation McdonaldsViewController (Datasource)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kMcdonaldsListCount;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kMcdonaldsListCell = @"McdonaldsListCell";
    
//    McdonaldsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kMcdonaldsListCell forIndexPath:indexPath];
    McdonaldsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kMcdonaldsListCell];
    if (cell == nil)
    {
        cell = [[McdonaldsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMcdonaldsListCell];
    }
    
    NSDictionary *dictionary = kMcdonaldsGetElement(kMcdonaldsImageKey, indexPath.row);
    [cell setMcdonaldsImage:[NSString stringWithFormat:@"%@%@", kMcdonaldsBaseUrl, [[dictionary objectForKey:@"src"] substringFromIndex:kMcdonaldsImageUrlStart]]];
    
    return cell;
}
@end
