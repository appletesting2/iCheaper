//
//  PartnerCell.m
//  iCheaper
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "PartnerCell.h"

@implementation PartnerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        [self setCellBackgroundViewWithReuseIdentifier:reuseIdentifier];
        
        [self setupPartnerImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part

- (void)setupPartnerImageView
{
    PartnerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kPartnerImagePaddingX, kPartnerImagePaddingY, kPartnerImageWidth, kPartnerImageHeight)];
    [self.contentView addSubview:PartnerImageView];
}

#pragma mark - set part

- (void)setPartnerImage:(NSString *)imageString
{
//    NSLog(@"imageString = %@", imageString);
    PartnerImageView.image = [UIImage imageNamed:imageString];
//    [PartnerImageView setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil];
}

#pragma mark - event part.

- (void)setCellBackgroundViewWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"PartnerCellTop"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-top-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"PartnerCellCenter"]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-center-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"PartnerCellBottom"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-2corner-bottom-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
    else if ([reuseIdentifier isEqualToString:@"PartnerCellSingle"]){
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
    }
}

@end
