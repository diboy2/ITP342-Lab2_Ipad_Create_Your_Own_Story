//
//  ViewController.m
//  Lab2_Ipad
//
//  Created by ITP Student on 2/11/15.
//  Copyright (c) 2015 Adrian. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ridesSegmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *happyEndingSwitch;
@property (weak, nonatomic) IBOutlet UIView *optionsView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text = @"2";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}




- (IBAction)backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}
- (IBAction)friendStepperChanged:(UIStepper *)sender {
    
    UIStepper *stepper = (UIStepper *) sender;
    self.stepperLabel.text =[NSString stringWithFormat:@"%d", (int) stepper.value ];
    
}

- (IBAction)segmentControlChanged:(id)sender {
    UISegmentedControl *segControl = (UISegmentedControl *) sender;
    NSInteger segment = segControl.selectedSegmentIndex;
    if(segment ==0){
        self.optionsView.hidden = YES;
    }else{
        self.optionsView.hidden = NO;
    }
    
    
}
- (IBAction)createStoryButton:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Is it story time?" delegate:self cancelButtonTitle:@"No" destructiveButtonTitle:nil otherButtonTitles:@"Absolutely",nil];
    [actionSheet showInView:self.view];
}

// implement action sheet delegate method
- (void) actionSheet: (UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [actionSheet cancelButtonIndex]){
        [self createStory];
    }
}

- (void) createStory{
    NSString *message;
    NSString *ending;
    NSString *title;
    
    message = @"testing Message";
    
    if(self.happyEndingSwitch.isOn){
        ending = @"They all happily slept that day.";
    } else{
        ending = @"They all ran";
    }
    
    //[message appendString:ending];
    title = @"Your Carnival Story";
    
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle: title message:message delegate:self cancelButtonTitle:@"Done" otherButtonTitles: nil];
    [alert show];
    
}
@end
