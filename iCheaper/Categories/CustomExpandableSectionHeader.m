//
//  CustomExpandableSectionHeader.m
//  ExpandableTableView
//
//  Created by Zouhair on 17/05/13.
//  Copyright (c) 2013 Zedenem. All rights reserved.
//

#import "CustomExpandableSectionHeader.h"

@implementation CustomExpandableSectionHeader

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:0.95f]];
		[self.textLabel setTextAlignment:UITextAlignmentLeft];
    }
    return self;
}
- (void)awakeFromNib {
	[super awakeFromNib];
//	[self setBackgroundColor:[UIColor greenColor]];
}
- (void)layoutSubviews {
	[super layoutSubviews];
	CGFloat textLabelHorizontalMargin = 30.0;
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
	[self.textLabel setFrame:CGRectMake(textLabelHorizontalMargin,
										0.0,
										self.bounds.size.width - textLabelHorizontalMargin*2,
										self.bounds.size.height)];
}

@end
