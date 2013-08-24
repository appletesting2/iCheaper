//
//  MoreInfoController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MoreInfoController+Datasource.h"

@implementation MoreInfoController (Datasource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.contentArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray[section] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kMoreInfoCellTop = @"MoreInfoCellTop";
    static NSString *kMoreInfoCellCenter = @"MoreInfoCellCenter";
    static NSString *kMoreInfoCellBottom = @"MoreInfoCellBottom";
    static NSString *kMoreInfoCellSingle = @"MoreInfoCellSingle";
    
    MoreInfoCell *moreInfoCell;
    
    if ([self.contentArray[indexPath.section] count] == 1)
    {
        moreInfoCell = [tableView dequeueReusableCellWithIdentifier:kMoreInfoCellSingle];
        if (moreInfoCell == nil)
        {
            moreInfoCell = [[MoreInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMoreInfoCellSingle];
        }
    }
    else if ([self.contentArray[indexPath.section] count] > 1)
    {
        if (indexPath.row == 0)
        {
            moreInfoCell = [tableView dequeueReusableCellWithIdentifier:kMoreInfoCellTop];
            if (moreInfoCell == nil)
            {
                moreInfoCell = [[MoreInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMoreInfoCellTop];
            }
        }
        else if (indexPath.row == [self.contentArray[indexPath.section] count] - 1)
        {
            moreInfoCell = [tableView dequeueReusableCellWithIdentifier:kMoreInfoCellBottom];
            if (moreInfoCell == nil)
            {
                moreInfoCell = [[MoreInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMoreInfoCellBottom];
            }
        }
        else
        {
            moreInfoCell = [tableView dequeueReusableCellWithIdentifier:kMoreInfoCellCenter];
            if (moreInfoCell == nil)
            {
                moreInfoCell = [[MoreInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMoreInfoCellCenter];
            }
        }
    }
    
    [moreInfoCell setMainTitleText:self.contentArray[indexPath.section][indexPath.row]];
    
    return moreInfoCell;
}
@end
