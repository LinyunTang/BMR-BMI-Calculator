//
//  ViewController.h
//  BMI Official
//
//  Created by Annabelle on 6/29/16.
//  Copyright © 2016 Annabelle Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UILabel *bmiResult;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *bmrResult;

@property (weak, nonatomic) IBOutlet UISwitch *genderSwitch;
@property (strong, nonatomic) NSNumber* properWeight;
@property (strong, nonatomic) NSNumber* week;

@property (weak, nonatomic) IBOutlet UILabel  *changeWeek;

@property (weak, nonatomic) IBOutlet UITextField *youNeedTo;

//-----------US Switch------------------

@property (weak, nonatomic) IBOutlet UISwitch *usSwitch;
- (IBAction)usSwitch2:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *weightUnit;
@property (weak, nonatomic) IBOutlet UILabel *heightUnit;

- (IBAction)calculatePressed:(id)sender;

//experiement segmented control


@end

