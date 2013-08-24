//
//  SelectKeywordCell.m
//  iCheaper
//
//  Created by twb on 13-4-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "SelectKeywordCell.h"

@implementation SelectKeywordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"grid-4corner-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kResizePadding, kResizePadding, kResizePadding, kResizePadding)]];
        
    }
    
    [self setupKeywordTextField];
//    [self setupConfirmButton];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setup part.

- (void)setupKeywordTextField
{
    keywordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kFilterConditionKeywordTextFieldPaddingX, kFilterConditionKeywordTextFieldPaddingY, kFilterConditionKeywordTextFieldWidth, kFilterConditionKeywordTextFieldHeight)];
    keywordTextField.delegate = self;
    keywordTextField.placeholder = @"点击输入关键词";
    keywordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    keywordTextField.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:keywordTextField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // save keyword data
    
    // hide keyboard
    [keywordTextField resignFirstResponder];
    return NO;
}

@end
