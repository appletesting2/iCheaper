//
//  ExpandableSectionHeader.h
//  ExpandableTableView
//
//  Created by Zouhair on 17/05/13.
//  Copyright (c) 2013 Zedenem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandableSectionHeader : UIControl

#pragma mark Properties
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIImageView *imageView;

- (void)setCategoryImage:(NSString *)string;
- (void)setImageViewHide:(BOOL)hidden;
- (void)setImageViewExpand:(BOOL)expand;

#pragma mark Lifecycle
- (void)setup;

@end
