//
//  ViewController+Delegate.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "ViewController.h"
#import "PartnerHeader.h"

@interface ViewController (Delegate) <UITableViewDelegate, CLLocationManagerDelegate, EGORefreshTableHeaderDelegate, UISearchBarDelegate, UISearchDisplayDelegate, PartnerTapDelegate>

- (void)setContentExpand:(BOOL)e;

@end
