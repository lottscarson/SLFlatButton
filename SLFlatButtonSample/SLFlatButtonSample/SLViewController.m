//
//  SLViewController.m
//  SLFlatButtonSample
//
//  Created by Scott Larson on 2/27/14.
//

#import "SLViewController.h"
#import "SLFlatButton.h"

float const kButtonWidth            = 280.0f;
float const kButtonHeight           = 80.0f;
float const kButtonDistance         = 30.0f;
float const kColorAnimationDuration = 0.4f;

@interface SLViewController ()

@property (weak, nonatomic) IBOutlet UILabel *buttonIBDescription;
@property (weak, nonatomic) IBOutlet UILabel *buttonCodeDescription;
@property (weak, nonatomic) IBOutlet UILabel *buttonWithPropertiesDescription;

@property (weak, nonatomic) IBOutlet SLFlatButton *buttonIB;
@property (strong, nonatomic) SLFlatButton *buttonCode;
@property (strong, nonatomic) SLFlatButton *buttonWithProperties;

@property (weak, nonatomic) UILabel *labelForClickedButton;

- (IBAction)buttonIBClicked;
- (IBAction)transitionBackToOriginalLabelColor;

@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGSize buttonSize = CGSizeMake(kButtonWidth, kButtonHeight);
    
    // The button that was created in Interface Builder
    [self.buttonIB setButtonColorsWithDefaultColor:[UIColor blueColor]];
    
    // The button created in code
    CGPoint descriptionOrigin = self.buttonCodeDescription.frame.origin;
    self.buttonCode = [[SLFlatButton alloc] initWithFrame:(CGRect) {CGPointMake(descriptionOrigin.x, descriptionOrigin.y + kButtonDistance), buttonSize}];
    [self.buttonCode setButtonColorsWithDefaultColor:[UIColor redColor]];
    [self.buttonCode setTitle:@"Created in code" forState:UIControlStateNormal];
    [self.buttonCode addTarget:self action:@selector(buttonCodeClicked) forControlEvents:UIControlEventTouchDown];
    [self.buttonCode addTarget:self action:@selector(transitionBackToOriginalLabelColor) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:self.buttonCode];
    
    // The button with a bunch of properties set
    descriptionOrigin = self.buttonWithPropertiesDescription.frame.origin;
    self.buttonWithProperties = [[SLFlatButton alloc] initWithFrame:(CGRect) {CGPointMake(descriptionOrigin.x, descriptionOrigin.y + kButtonDistance), buttonSize}];
    [self.buttonWithProperties setTitle:@"I'm a button!" forState:UIControlStateNormal];
    self.buttonWithProperties.cornerRadius = 20.0f;
    self.buttonWithProperties.buttonColor = [UIColor orangeColor];
    self.buttonWithProperties.highlightedButtonColor = [UIColor greenColor];
    self.buttonWithProperties.borderWidth = 3.0f;
    self.buttonWithProperties.borderColor = [UIColor blueColor];
    self.buttonWithProperties.highlightedBorderColor = [UIColor magentaColor];
    self.buttonWithProperties.textColor = [UIColor yellowColor];
    self.buttonWithProperties.highlightedTextColor = [UIColor purpleColor];
    [self.buttonWithProperties addTarget:self action:@selector(buttonWithPropertiesClicked) forControlEvents:UIControlEventTouchDown];
    [self.buttonWithProperties addTarget:self action:@selector(transitionBackToOriginalLabelColor) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:self.buttonWithProperties];
}

- (IBAction)buttonIBClicked
{
    [self changeTextColorForLabel:self.buttonIBDescription toColor:self.buttonIB.buttonColor];
}

- (void)buttonCodeClicked
{
    [self changeTextColorForLabel:self.buttonCodeDescription toColor:self.buttonCode.buttonColor];
}

- (void)buttonWithPropertiesClicked
{
    [self changeTextColorForLabel:self.buttonWithPropertiesDescription toColor:self.buttonWithProperties.buttonColor];
}

- (void)changeTextColorForLabel:(UILabel *)label toColor:(UIColor *)color
{
    self.labelForClickedButton = label;
    [label setTextColor:color];
}

- (IBAction)transitionBackToOriginalLabelColor
{
    if (self.labelForClickedButton) {
        [UIView transitionWithView:self.labelForClickedButton
                          duration:kColorAnimationDuration
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{ [self.labelForClickedButton setTextColor:[UIColor blackColor]]; }
                        completion:nil];
        
        self.labelForClickedButton = nil;
    }
}

@end
