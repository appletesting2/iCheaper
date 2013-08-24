//
//  PartnerViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "PartnerViewController+Datasource.h"

@implementation PartnerViewController (Datasource)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [partners count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kPartnerCellTop = @"PartnerCellTop";
    static NSString *kPartnerCellBottom = @"PartnerCellBottom";
    
    PartnerCell *cell;
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
//            cell = [tableView dequeueReusableCellWithIdentifier:kPartnerCellTop forIndexPath:indexPath];
            cell = [tableView dequeueReusableCellWithIdentifier:kPartnerCellTop];
            if (cell == nil)
            {
                cell = [[PartnerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kPartnerCellTop];
            }
        }
        else if (indexPath.row == 1)
        {
//            cell = [tableView dequeueReusableCellWithIdentifier:kPartnerCellBottom forIndexPath:indexPath];
            cell = [tableView dequeueReusableCellWithIdentifier:kPartnerCellBottom];
            if (cell == nil)
            {
                cell = [[PartnerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kPartnerCellBottom];
            }
        }
    }
    
    [cell setPartnerImage:[[partners objectAtIndex:indexPath.row] objectForKey:kPartnerImageKey]];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"快餐";
    }
    
    return nil;
}

@end
