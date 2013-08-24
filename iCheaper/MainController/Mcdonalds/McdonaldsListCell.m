//
//  McdonaldsListCell.m
//  kfc
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "McdonaldsListCell.h"



@implementation McdonaldsListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
        bgView.backgroundColor = [UIColor colorWithWhite:0.85f alpha:0.9f];
        self.selectedBackgroundView = bgView;
        
        [self setupMcdonaldsImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part

- (void)setupMcdonaldsImageView
{
    McdonaldsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kMcdonaldsImagePaddingX, kMcdonaldsImagePaddingY, kMcdonaldsImageWidth, kMcdonaldsImageHeight)];
    [self.contentView addSubview:McdonaldsImageView];
}

#pragma mark - set part

- (void)setMcdonaldsImage:(NSString *)imageString
{
    NSLog(@"imageString = %@", imageString);
    
    [[ToolKit sharedInstance] setImage:McdonaldsImageView url:imageString];
//    
//    [McdonaldsImageView setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil];
}

@end
