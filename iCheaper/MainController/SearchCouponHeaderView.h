//
//  SearchCouponHeaderView.h
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCouponHeaderView : UIView <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDC;

@end
