//
//  SearchCouponHeaderView.m
//  iCheaper
//
//  Created by twb on 13-4-14.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SearchCouponHeaderView.h"

@implementation SearchCouponHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - setup part.
- (void)setupSearchBar
{
    // Create a search bar
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
	//self.searchBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchBar.keyboardType = UIKeyboardTypeAlphabet;
	self.searchBar.delegate = self;
	
	// Create the search display controller
//	self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//	self.searchDC.searchResultsDataSource = self;
//	self.searchDC.searchResultsDelegate = self;
}

#pragma mark Search Bar
- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setText:@""];
//    [self performFetch];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    [self performFetch];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
