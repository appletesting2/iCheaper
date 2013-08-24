//
//  SelectCategoriesViewController+Datasource.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectCategoriesViewController+Datasource.h"

@implementation SelectCategoriesViewController (Datasource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.categoryList.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *categories = kContentArrayInSection(section);
	return categories[kDefaultAllChannelCellRow];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger numberOfSections = kNumberOfRowsInSection(section);
    
	if ([tableView isKindOfClass:[ExpandableTableView class]]) {
		ExpandableTableView *expandableTableView = (ExpandableTableView *)tableView;
		if (![expandableTableView isExpanded:section])
        {
			numberOfSections -= [[expandableTableView.delegate expandableTableView:expandableTableView expandableRowsForSection:section] count];
		}
	}
	return numberOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";
	
	SelectCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell) {
		cell = [[SelectCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	   
    NSArray *cateList = kContentArrayInSection(indexPath.section);
    
    if (indexPath.row == kDefaultAllChannelCellRow && indexPath.section != kDefaultAllChannelCellSection)
    {
        NSString *title = [NSString stringWithFormat:@"全部%@", cateList[indexPath.row]];
        [cell setCategoryTitle:title];
    }
    else
    {
        [cell setCategoryTitle:cateList[indexPath.row]];
    }
    
	return cell;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [categoryArray count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *kSelectCategoryCell = @"SelectCategoryCell";
//    
////    SelectCategoryCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:kSelectCategoryCell forIndexPath:indexPath];
//    SelectCategoryCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:kSelectCategoryCell];
//    if (categoryCell == nil)
//    {
//        categoryCell = [[SelectCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSelectCategoryCell];
//    }
//    
//    [categoryCell setCategoryTitle:[categoryArray[indexPath.row] category_name]];
//    
//    if ([categoryImageArray count] > indexPath.row) {
//        [categoryCell setCategoryImage:categoryImageArray[indexPath.row]];
//    }
//    
//    // set a cell default selected status.
//    if (![fc hasCategoryParam])
//    {
//        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:kDefaultAllChannelCellRow inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//    }
//    else
//    {
//        if ([[fc getCategory] isEqualToString:[categoryArray[indexPath.row] category_name]])
//        {
//            [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
//        }
//    }
//    
//    return categoryCell;
//}

@end
