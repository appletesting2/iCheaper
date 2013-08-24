//
//  SelectCategoriesViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectCategoriesViewController+Delegate.h"
#import "CustomExpandableSectionHeader.h"


@implementation SelectCategoriesViewController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	id view = nil;
	if ([tableView isKindOfClass:[ExpandableTableView class]]) {
		ExpandableTableView *expandableTableView = (ExpandableTableView *)tableView;
		view = [expandableTableView viewForHeaderInSection:section];
	}
	return view;
}

#pragma mark - ExpandableTableViewDelegate

- (ExpandableSectionHeader *)expandableTableView:(ExpandableTableView *)expandableTableView viewForHeaderInSection:(NSInteger)section
{
    ExpandableSectionHeader *sectionHeader = [expandableTableView sectionHeaderViewWithClass:[CustomExpandableSectionHeader class]];

	[sectionHeader.textLabel setText:[expandableTableView.dataSource tableView:expandableTableView titleForHeaderInSection:section]];
    
    if ([categoryImageArray count] > section)
    {
        [sectionHeader setCategoryImage:categoryImageArray[section]];
    }
    
    BOOL isExpand = [self.expandList[section] boolValue];
    NSLog(@"isExpand = %d", isExpand);
    [sectionHeader setImageViewExpand:isExpand];
    
    return sectionHeader;
}

- (void)expandableTableView:(ExpandableTableView *)expandableTableView sectionTapped:(NSInteger)section
{
    BOOL isExpand = [self.expandList[section] boolValue];
    [self.expandList replaceObjectAtIndex:section withObject:@(!isExpand)];
}

- (NSArray *)expandableTableView:(ExpandableTableView *)expandableTableView expandableRowsForSection:(NSInteger)section
{
    NSMutableArray *expandableRows = [NSMutableArray array];
	for (int i = 0; i < kNumberOfRowsInSection(section); i++)
    {
		[expandableRows addObject:[NSIndexPath indexPathForRow:i inSection:section]];
	}
	return [NSArray arrayWithArray:expandableRows];
}

- (UITableViewRowAnimation)expandableTableView:(ExpandableTableView *)expandableTableView rowsDeletionAnimationForSection:(NSInteger)section
{
    return UITableViewRowAnimationNone;
}

- (UITableViewRowAnimation)expandableTableView:(ExpandableTableView *)expandableTableView rowsInsertionAnimationForSection:(NSInteger)section
{
    return UITableViewRowAnimationNone;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // categoryArray
    NSString *displayCategoryName = nil;
    NSArray *categoryList = kContentArrayInSection(indexPath.section);
    
    if (indexPath.section == kDefaultAllChannelCellSection)
    {
        if (indexPath.row == kDefaultAllChannelCellRow)
        {
            [fc setCategory:@""];
            [fc setSubCategory:@""];
            displayCategoryName = categoryList[kDefaultAllChannelCellRow];
        }
    }
    else
    {
        if (indexPath.row == kDefaultAllChannelCellRow)
        {
            [fc setCategory:categoryList[kDefaultAllChannelCellRow]];
            [fc setSubCategory:@""];
            displayCategoryName = categoryList[kDefaultAllChannelCellRow];
        }
        else
        {
            [fc setCategory:categoryList[kDefaultAllChannelCellRow]];
            [fc setSubCategory:categoryList[indexPath.row]];
            displayCategoryName = categoryList[indexPath.row];
        }
    }

    // send Notification
    NotificationBody *notificationBody = [[NotificationBody alloc] init];
    notificationBody.tag = kNotificationBodyFromCategoryToUpdateCoupons;
    notificationBody.body = displayCategoryName;
    [NotificationBody postUpdateCouponsWithNotificationBody:notificationBody];
    
    [self.sidePanelController showCenterPanelAnimated:YES];
}

@end
