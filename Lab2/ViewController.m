//
//  ViewController.m
//  Lab2
//
//  Created by Nicky on 2/5/15.
//  Copyright (c) 2015 Nicky Gaungorena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UIStepper *minStepper;
@property (weak, nonatomic) IBOutlet UILabel *minValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *bystanderSlider;
@property (weak, nonatomic) IBOutlet UISwitch *happySwitch;
@property (weak, nonatomic) IBOutlet UIView *moreOptionView;
@property (weak, nonatomic) IBOutlet UILabel *bystanderCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numberTextFieldDoneEntering:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)stringTextFieldDoneEntering:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTouched:(id)sender {
    if(self.NameField.isFirstResponder){
        [self.NameField resignFirstResponder];
    }
    else if (self.ageField.isFirstResponder){
        [self.ageField resignFirstResponder];
    }
}
- (IBAction)LessOrMoreChanged:(id)sender {
    if(self.moreOptionView.isHidden){
        self.moreOptionView.hidden = NO;
    }
    else{
        self.moreOptionView.hidden = YES;
    }
}
- (IBAction)createStoryButtonPressed:(id)sender {
}
- (IBAction)stepperChange:(id)sender {
    self.minValueLabel.text = [NSString stringWithFormat:@"%d",(int)[self.minStepper value]];
}
- (IBAction)sliderValueChanged:(id)sender {
    self.bystanderCountLabel.text = [NSString stringWithFormat:@"%d",(int)[self.bystanderSlider value]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
