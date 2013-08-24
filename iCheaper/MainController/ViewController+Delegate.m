//
//  ViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "ViewController+Delegate.h"
#import "UIViewController+ShareIntance.h"

@implementation ViewController (Delegate)

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    // save
    [fc setLatitude:newLocation.coordinate.latitude];
    [fc setLongitude:newLocation.coordinate.longitude];
    
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
//     {
//         //         NSLog(@"error = %@", error);
//         if (placemarks.count >0)
//         {
//             CLPlacemark *plmark = [placemarks objectAtIndex:0];
//             NSString *country = plmark.name;
//             NSLog(@"%@",country);
//         }
//     }];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCouponCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PartnerHeader *header = [[PartnerHeader alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 45.0f)];
    [header setTitleImage:@"icon_ticket.png"];
//    [header setTitleImage:@"accr-logo.png"];
    [header setTitleText:@"特别推荐商户,点击进入..."];
    header.delegate = self;
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Coupons *coupon = nil;
    
    if (tableView.tag == kNormalTableViewTag)
    {
        coupon = self.couponsArray[indexPath.row];
    }
    else
    {
        coupon = self.searchCouponsArray[indexPath.row];
    }
    
    [self.UIManager showCouponDetailController:coupon];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // load more footer view.
    NSUInteger totalRows;
    if (tableView.tag == kNormalTableViewTag)
    {
        totalRows = [self.couponsArray count];
    }
    else
    {
        totalRows = [self.searchCouponsArray count];
    }
    
    if ([indexPath row] == (totalRows - 1))
    {
        if (![[TTCheckNetwork sharedInstance] networkIsOK])
        {
            return;
        }
        
        if (![fc hasSubCategory])
        {
            if ([indexPath row] == 0)
            {
                return;
            }
        }
        
        if (self.loadMore == nil)
        {
            self.loadMore = [[TTTableViewFooterLoadMore alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 60.0f)];
            tableView.tableFooterView = self.loadMore;
        }
        
        if (self.searchLoadMore == nil)
        {
            self.searchLoadMore = [[TTTableViewFooterLoadMore alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 60.0f)];
            self.searchDC.searchResultsTableView.tableFooterView = self.searchLoadMore;
        }
        
//        if (tableView.tag == kNormalTableViewTag)
//        {
//            tableView.tableFooterView = self.loadMore;
//        }
//        else
//        {
//            self.searchDC.searchResultsTableView.tableFooterView = self.searchLoadMore;
//        }
//
//        tableView.tableFooterView = loadMore;
        [self loadMoreCoupons:tableView];
    }
}

#pragma mark - KFCImageTapDelegate

- (void)PartnerTap
{
    [self.UIManager showPartnerController];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)expandContentTableView:(CGFloat)offsetY
{
//    NSLog(@"offsetY = %.2f", offsetY);
    if (offsetY > 0.0f)
    {
        if (offsetY - previousOffsetY > kExpandTableViewLimit)
        {
            [self setContentExpand:YES];
        }
        else if (offsetY - previousOffsetY < -kExpandTableViewLimit)
        {
            [self setContentExpand:NO];
        }
    }
}

- (void)setContentExpand:(BOOL)e
{
    if (e)
    {
        if (isContentViewExpand)
        {
            return;
        }
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [[ToolKit sharedInstance] hideTabBar:self.tabBarController];
        self.contentTableView.frame = CGRectMake(0.0f, 0.0f, kScreenWidth, kContentHeight + kNavigationBarDefaultHeight + kTabBarControllerDefaultHeight);
        isContentViewExpand = YES;
    }
    else
    {
        if (!isContentViewExpand)
        {
            return;
        }
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [[ToolKit sharedInstance] showTabBar:self.tabBarController];
        self.contentTableView.frame = CGRectMake(0.0f, kNavigationBarShadowOffsetY, kScreenWidth, kContentHeight);
        isContentViewExpand = NO;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
#if 0
    [self expandContentTableView:scrollView.contentOffset.y];
#endif
    if (scrollView.tag == kNormalTableViewTag)
    {
        [refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{    
    if (scrollView.tag == kNormalTableViewTag)
    {
        [refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    
    previousOffsetY = scrollView.contentOffset.y;
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
	[self reloadTableViewDataSource];
    
    [self setupClearPageNumber];
    isLoadMoreDone = NO;
    
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        // do nothing.
    }
    else
    {
        // first remove error tip view , assumed it exists.
        [NetworkNotRegular removeFromSuperView];
        
        [[RetrieveData sharedInstance] retrieveCouponsWithBlock:^(NSArray *coupons, NSError *error) {
            
            if (error == nil)
            {
                if (self.couponsArray != nil)
                {
                    // firstly release current cache data.
                    self.couponsArray = nil;
                }
                
                self.couponsArray = [NSMutableArray arrayWithArray:coupons];
                
                // reload tableview data.
                //            [self.contentTableView reloadData];
                [self.contentTableView performSelector:@selector(reloadData) withObject:nil afterDelay:kTableViewAfterDelayLoadingInterval];
                
                [self doneLoadingTableViewData];
            }
            
        }];
    }

    
//	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        // show tips : network is not regular.
//        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        
        return YES;
    }
    
	return isReloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
	return [NSDate date]; // should return date data source was last changed
	
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [fc setKeyword:searchBar.text];
    [fc setPage:kFirstLoadingPageNumber];
    [self updateCoupons:self.searchDC.searchResultsTableView];
    
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setText:@""];

    // clear keyword.
    [fc setKeyword:@""];
    [fc setPage:kFirstLoadingPageNumber];
    
    [self updateCoupons:self.searchDC.searchResultsTableView];
}

#pragma mark - UISearchDisplayDelegate

- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    UITableView *tableView = controller.searchResultsTableView;
//    [tableView registerClass:[CouponCell class] forCellReuseIdentifier:@"SearchCouponCell"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

@end
