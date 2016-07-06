//
//  Person.h
//  BMI Calculator
//
//  Created by Annabelle on 6/29/16.
//  Copyright © 2016 Annabelle Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (strong, nonatomic) NSNumber* weightInKG;
@property (strong, nonatomic) NSNumber* heightInM;
@property (strong, nonatomic) NSNumber* age;
@property (strong, nonatomic) NSNumber* gender;

//interface class method
+(Person*) sharedPersonInstance;


//interface instance method
-(NSNumber*) bmi;
-(NSNumber*) bmr;

@end
