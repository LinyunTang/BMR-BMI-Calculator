//
//  ViewController.m
//  BMI Official
//
//  Created by Annabelle on 6/29/16.
//  Copyright © 2016 Annabelle Tang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize properWeight;
@synthesize week;




- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)switch:(id)sender {
}

- (IBAction)calculatePressed:(id)sender {
  
  //print out memory location of the person; if is the same person,
  //should show the same memory address each time button pressed
  Person* p = [Person sharedPersonInstance];
  //NSLog(@"%@", [p description]); --> print out the location
  
  
  //give weight and height the value we enter in the box (switch)
  if (self.usSwitch.on){
    p.weightInKG = @(self.weightTextField.text.floatValue/2.2);
    p.heightInM = @(self.heightTextField.text.floatValue/3.2808);
    self.weightUnit.text = @"Lb";
    self.heightUnit.text = @"Ft";
    
  } else {
    p.weightInKG = @(self.weightTextField.text.floatValue);
    p.heightInM = @(self.heightTextField.text.floatValue);
    self.weightUnit.text = @"Kg";
    self.heightUnit.text = @"M";
  }
  

 //NSLog(@"%f",p.heightInM.doubleValue);
  
  NSNumber* bmi = p.bmi;
  NSNumber* bmr = p.bmr;
  
  //input datas to bmr variables
  p.age = @(self.ageTextField.text.doubleValue);
  p.gender = @(self.genderSwitch.on);
 
  //display the result of bmi and bmr
  self.bmiResult.text = [NSString stringWithFormat:@"%.2f", bmi.floatValue];
  self.bmrResult.text = [NSString stringWithFormat:@"%.2f", bmr.floatValue];
  
  //image instance variabels
  UIImage* newImage;
  NSString* path;
  NSBundle *myBundle = [NSBundle mainBundle];

//overweight or underweight image changes and week needed
 if(bmi.doubleValue <18.5){
    path = [myBundle pathForResource: @"gainWeight" ofType:@"jpg"];
   
    self.properWeight = @(p.heightInM.floatValue*p.heightInM.floatValue*18.5);
    week = @(( self.properWeight.floatValue - p.weightInKG.floatValue )/0.45);
    self.youNeedTo.text = @"You need to GAIN weight for: ";
  
  }else if (p.bmi.doubleValue>24.99){
    path = [myBundle pathForResource: @"looseWeight" ofType:@"jpg"];

    self.properWeight =  @(p.heightInM.floatValue*p.heightInM.floatValue*24.99);
    week = @((p.weightInKG.floatValue - self.properWeight.floatValue )/0.45);
    self.youNeedTo.text = @"You need to LOOSE weight for: ";
    
  }else{
    if (p.gender.boolValue == YES )
      path = [myBundle pathForResource: @"fitWoman" ofType:@"png"];
    else
    path = [myBundle pathForResource: @"fitMan" ofType: @"jpg"];
    
    NSString* a = @"KEEP GOING";
    week = @(a.floatValue);
    self.youNeedTo.text = @"You are PERFECT!!! ";
   
   }
  
  
  self.changeWeek.text = [NSString stringWithFormat:@"%.2f", self.week.floatValue];
  
  //convert path to an object that representsi
  newImage = [UIImage imageWithContentsOfFile: path];
  //display the image on my view
  self.myImage.image = newImage;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [self.heightTextField resignFirstResponder];
  [self.weightTextField resignFirstResponder];
  [self.ageTextField resignFirstResponder];
}

//here, switch is consider as an action so that each time
//I click the swicth, the units changes.
- (IBAction)usSwitch2:(id)sender {
  if (self.usSwitch.on){
    self.weightUnit.text = @"Lb";
    self.heightUnit.text = @"Ft";
    
  } else {
    self.weightUnit.text = @"Kg";
    self.heightUnit.text = @"M";
  }
}

/*- (IBAction)indexChanged:(id)sender {
  if (segmentedControl.selectedSegmentIndex == 0) {
    
   
  } else(segmentedControl.selectedSegmentIndex == 1) {
   

}*/
@end
