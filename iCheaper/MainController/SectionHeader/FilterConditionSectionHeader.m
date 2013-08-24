//
//  FilterConditionSectionHeader.m
//  iCheaper
//
//  Created by twb on 13-5-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "FilterConditionSectionHeader.h"

@implementation FilterConditionSectionHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupFilterCondition];
        
        [self setupSectionTitle];
        
        [self setupSectionSwitch];
    }
    return self;
}

#pragma mark - setup part.

- (void)setupSectionTitle
{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 80.0f, 20.0f)];
    title.font = [UIFont boldSystemFontOfSize:16.0f];
    title.textColor = [UIColor darkGrayColor];
    title.backgroundColor = [UIColor clearColor];
    
    sectionTitle = title;
    [self addSubview:sectionTitle];
}

- (void)setupSectionSwitch
{
    DCRoundSwitch *s = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(90.0f, 8.0f, 60.0f, 25.0f)];
    s.hidden = YES;
    s.onText = @"开";
    s.offText = @"关";
    s.on = [fc isDistanceOn];
    [s addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    sectionSwitch = s;
    
    [self addSubview:sectionSwitch];
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

#pragma mark - event part.

- (void)switchChanged:(UISwitch *)s
{
    [self.delegate sectionSwitchChanged:s.on];
}

#pragma mark - set part.

- (void)setSectionTitle:(NSString *)text
{
    sectionTitle.text = text;
}

- (void)setSectionSwitch:(BOOL)hidden
{
    sectionSwitch.hidden = hidden;
}

- (void)setSectionSwitchStatus:(BOOL)on
{
    sectionSwitch.on = on;
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
