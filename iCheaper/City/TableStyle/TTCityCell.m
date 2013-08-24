//
//  TTCityCell.m
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTCityCell.h"

@implementation TTCityCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_selection_list_01.png"]];
        
        cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(48.0f, 10.0f, 220.0f, 20.0f)];
        [cityNameLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        [cityNameLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:cityNameLabel];
    }
    return self;
}

- (void)setCityName:(NSString *)cityName
{
    [cityNameLabel setText:cityName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    [[ToolKit sharedInstance] drawCellBottomLine:40.0f];
}

@end
