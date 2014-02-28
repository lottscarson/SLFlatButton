//
//  SLFlatButton.m
//
//  Created by Scott Larson on 1/22/14.
//

#import "SLFlatButton.h"

NSString *const kDefaultFontName	= @"HelveticaNeue-Light";

float const kDefaultBorderWidth 	= 1.0f;
float const kDefaultCornerRadius 	= 5.0f;
float const kDefaultFontSize		= 20.0f;

@interface SLFlatButton ()
- (void)commonInitialization;
@end

@implementation SLFlatButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInitialization];
}

- (void)commonInitialization
{   
    self.isClickable = YES;
    self.titleLabel.font = [UIFont fontWithName:kDefaultFontName size:kDefaultFontSize];;
    
    self.borderWidth = kDefaultBorderWidth;
    self.cornerRadius = kDefaultCornerRadius;
    self.layer.masksToBounds = YES;
    
//    [self setButtonColorsWithDefaultColor:[UIColor lightGrayColor]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // If a primary label outlet hasn't been specified in IB, just use the default button label
    if (!self.label) {
        self.label = self.titleLabel;
    }
    
    self.layer.borderWidth = self.borderWidth;
    self.layer.cornerRadius = self.cornerRadius;
    
    if (self.isClickable && ((self.state == UIControlStateHighlighted) || (self.state == UIControlStateSelected))) {
        self.label.textColor = self.highlightedTextColor;
        self.secondaryLabel.textColor = self.highlightedTextColor;
        self.layer.backgroundColor = [self.highlightedButtonColor CGColor];
        self.layer.borderColor = [self.highlightedBorderColor CGColor];
    }
    else {
        self.label.textColor = self.textColor;
        self.secondaryLabel.textColor = self.textColor;
        self.layer.backgroundColor = [self.buttonColor CGColor];
        self.layer.borderColor = [self.borderColor CGColor];
    }
}

- (void)setButtonColorsWithDefaultColor:(UIColor *)defaultColor
{
	[self setButtonColorsWithDefaultColor:defaultColor andHighlightedColor:[UIColor whiteColor]];
}

- (void)setButtonColorsWithDefaultColor:(UIColor *)defaultColor andHighlightedColor:(UIColor *)highlightedColor
{
    self.buttonColor = defaultColor;
    self.borderColor = defaultColor;
    self.textColor = highlightedColor;
    self.highlightedButtonColor = highlightedColor;
    self.highlightedBorderColor = defaultColor;
    self.highlightedTextColor = defaultColor;
}

@end
