//
//  TTCityViewController+DataSource.m
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCityViewController+DataSource.h"

@implementation TTCityViewController (DataSource)
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [supportCities count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[(Cities *)supportCities[section] districts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCityCell = @"CityCell";
    
    TTCityCell *cell = [tableView dequeueReusableCellWithIdentifier:kCityCell];
    
    if (cell == nil)
    {
        cell = [[TTCityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCityCell];
    }
    
    // Configure the cell...
    NSString *districtName = kGetDistrictName(indexPath);
    
    [cell setCityName:districtName];
    
    return cell;
}

// Index

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView                                                 // return list of section titles to display in section index view (e.g. "ABCD...Z#")
{
    return sortedCityKeys;
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index  // tell table which section corresponds to section title/index (e.g. "B",1))
{
	return [sortedCityKeys indexOfObject:title];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
@end
