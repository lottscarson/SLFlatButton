//
//  SLFlatButton.h
//
//  Created by Scott Larson on 1/22/14.
//

#import <UIKit/UIKit.h>

@interface SLFlatButton : UIButton

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *secondaryLabel;

@property (assign, nonatomic) BOOL isClickable;

@property (strong, nonatomic) UIColor *buttonColor;
@property (strong, nonatomic) UIColor *highlightedButtonColor;
@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *highlightedBorderColor;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *highlightedTextColor;

@property (assign, nonatomic) CGFloat borderWidth;
@property (assign, nonatomic) CGFloat cornerRadius;

// Convenience method to quickly set all default unhighlighted color properties (highlighted colors default to white)
- (void)setButtonColorsWithDefaultColor:(UIColor *)defaultColor;

// Convenience method to quickly set all default unhighlighted and highlighted color properties
- (void)setButtonColorsWithDefaultColor:(UIColor *)defaultColor andHighlightedColor:(UIColor *)highlightedColor;

@end
