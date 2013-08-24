//
//  NearCouponsController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "NearCouponsController+Delegate.h"

@implementation NearCouponsController (Delegate)

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [fc setKeyword:searchBar.text];
    
    [self setupAnnotation];
    
    [self.searchDC setActive:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchBar setText:@""];

    [self setupAnnotation];
}

@end
