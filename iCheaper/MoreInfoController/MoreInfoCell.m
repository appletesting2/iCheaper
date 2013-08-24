//
//  MoreInfoCell.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MoreInfoCell.h"

@implementation MoreInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setCellBackgroundViewWithReuseIdentifier:reuseIdentifier];
        
        [self setupMainTitle];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part

- (void)setupMainTitle
{
    mainTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, kScreenWidth - 40.0f, kMoreInfoCellHeight)];
    mainTitle.backgroundColor = [UIColor clearColor];
    mainTitle.textAlignment = NSTextAlignmentCenter;
    //    mainTitle.textColor = kNavigationTitleColor;
    mainTitle.textColor = [UIColor darkGrayColor];
    mainTitle.font = [UIFont systemFontOfSize:16.0f];
    [self.contentView addSubview:mainTitle];
}

- (void)setMainTitleText:(NSString *)text
{
    [mainTitle setText:text];
}

#pragma mark - event part.

- (void)setCellBackgroundViewWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"MoreInfoCellTop"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MoreInfoCellCenter"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MoreInfoCellBottom"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"MoreInfoCellSingle"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
}


@end
