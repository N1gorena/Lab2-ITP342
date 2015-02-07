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
@property (weak, nonatomic) IBOutlet UISegmentedControl *weaponSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

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
    UIButton* createButton = (UIButton*)sender;
    
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Confirmation" message:@"Ready for the story?" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if(self.NameField.text.length != 0 && self.ageField.text.length != 0){
            self.errorLabel.text = @"";
            [self displayStory:(UIButton *)sender];
        }
        else
            self.errorLabel.text = @"Please input values for name and age before creating a story!";
    }];
    UIAlertAction* cancelAction  = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    
    UIPopoverPresentationController* popover = alertController.popoverPresentationController;
    
    if(popover) {
        popover.sourceView = createButton;
        popover.sourceRect = createButton.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)stepperChange:(id)sender {
    self.minValueLabel.text = [NSString stringWithFormat:@"%d",(int)[self.minStepper value]];
}
- (IBAction)sliderValueChanged:(id)sender {
    self.bystanderCountLabel.text = [NSString stringWithFormat:@"%d",(int)[self.bystanderSlider value]];
}

-(void)displayStory:(UIButton*)sender{
    NSString* endString = [NSString alloc];
    if(self.happySwitch.on)
        endString = @"A kook and a teen drinking tea!";
    else
        endString = @"A bloody phone and a three handed man.";
        
    
    UIAlertController* storyController = [UIAlertController alertControllerWithTitle:@"A Maniacal Mystery" message:[NSString stringWithFormat:@"This is a story all about how, %@ got bothered outside of town. He was only %@, when the mad man screamed, 'Get off my propety or I'll see you bleed!'. The kook brandished his %@, and took off like a rocket, little did he know the kid was filming from his pocket. At least %@ were watching behind their computer screens, wondering if they should call the police. It took but %@ minutes for the cops to show, but what did they see? %@ ", self.NameField.text,self.ageField.text,[self.weaponSegmentedControl titleForSegmentAtIndex:self.weaponSegmentedControl.selectedSegmentIndex],self.bystanderCountLabel.text, self.minValueLabel.text, endString] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* doneAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    [storyController addAction:doneAction];
    
    UIPopoverPresentationController* popover = storyController.popoverPresentationController;
    
    if(popover) {
        popover.sourceView = sender;
        popover.sourceRect = sender.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    
    [self presentViewController:storyController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
