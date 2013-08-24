//
//  SelectCategoryCell.m
//  iCheaper
//
//  Created by twb on 13-4-12.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectCategoryCell.h"

@implementation SelectCategoryCell

#pragma mark - system part.

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_selection_list_01.png"]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"DropdownMenu_Selected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 8.0f, 0.0f, 8.0f)]];
        
        [self setupCategoryImageView];
        
        [self setupCategoryTitleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupCategoryTitleLabel
{
    categoryTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 10.0f, 180.0f, 20.0f)];
    [categoryTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [categoryTitleLabel setBackgroundColor:[UIColor clearColor]];
    [categoryTitleLabel setTextColor:[UIColor darkGrayColor]];
    [self.contentView addSubview:categoryTitleLabel];
}

- (void)setupCategoryImageView
{
    categoryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f, 10.0f, 21.0f, 21.0f)];
    [self.contentView addSubview:categoryImageView];
}

#pragma mark - event part.

- (void)setCategoryImage:(NSString *)string
{
    categoryImageView.image = [UIImage imageNamed:string];
}

- (void)setCategoryTitle:(NSString *)title
{
    [categoryTitleLabel setText:title];
}

- (void)drawRect:(CGRect)rect
{
    [[ToolKit sharedInstance] drawCellBottomLine:40.0f];
}

@end
