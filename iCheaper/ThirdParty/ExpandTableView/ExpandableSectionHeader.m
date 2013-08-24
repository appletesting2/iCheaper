//
//  ExpandableSectionHeader.m
//  ExpandableTableView
//
//  Created by Zouhair on 17/05/13.
//  Copyright (c) 2013 Zedenem. All rights reserved.
//

#import "ExpandableSectionHeader.h"
#import <QuartzCore/QuartzCore.h>

@interface ExpandableSectionHeader ()

#pragma mark Properties
@property (nonatomic, assign) NSInteger currentSection;

@end

@implementation ExpandableSectionHeader

#pragma mark Properties
@synthesize textLabel = _textLabel;
@synthesize logoView = _logoView;
@synthesize imageView = _imageView;

- (UILabel *)textLabel {
	if (!_textLabel) {
		_textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[self addSubview:_textLabel];
		
		[_textLabel setBackgroundColor:[UIColor clearColor]];
	}
	return _textLabel;
}

- (UIImageView *)logoView
{
    if (!_logoView)
    {
        _logoView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        _logoView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_logoView];
    }
    return _logoView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ExpandableAccessoryView"] highlightedImage:[UIImage imageNamed:@"ExpandableAccessoryViewHighlighted"]];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
    }
    
    return _imageView;
}

@synthesize currentSection = _currentSection;

#pragma mark Lifecycle
- (void)setup {
	UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOccurred:)];
	[self addGestureRecognizer:tapGestureRecognizer];
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self setup];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGFloat textLabelHorizontalMargin = 5.0;
	[self.textLabel setFrame:CGRectMake(textLabelHorizontalMargin,
										0.0,
										self.bounds.size.width - textLabelHorizontalMargin*2,
										self.bounds.size.height)];
    [self.logoView setFrame:CGRectMake(5.0f, 10.0f, 21.0f, 21.0f)];
    [self.imageView setFrame:CGRectMake(self.bounds.size.width - textLabelHorizontalMargin*4, 15.0f, 14.0f, 9.0f)];
}

#pragma mark - set part.

- (void)setCategoryImage:(NSString *)string
{
    self.logoView.image = [UIImage imageNamed:string];
}

- (void)setImageViewHide:(BOOL)hidden
{
    self.imageView.hidden = hidden;
}

- (void)setImageViewExpand:(BOOL)expand
{
    return;
    if (!expand) {
        _imageView.transform = CGAffineTransformMakeRotation(0);
    } else {
        _imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
}

#pragma mark Selections management methods
- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
    
}
- (void)setSelected:(BOOL)selected {
	[super setSelected:selected];
    
    [UIView animateWithDuration:0.25f animations:^{
        if (!selected) {
            _imageView.transform = CGAffineTransformMakeRotation(0);
        } else {
            _imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }];
}
- (void)setEnabled:(BOOL)enabled {

	[super setEnabled:enabled];
}

#pragma mark UITapGestureRecognizer method
- (void)tapOccurred:(UITapGestureRecognizer *)tapGestureRecognizer {
	if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
		[self sendActionsForControlEvents:UIControlEventTouchUpInside];
	}
}

@end
