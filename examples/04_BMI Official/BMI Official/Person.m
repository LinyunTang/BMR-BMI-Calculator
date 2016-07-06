//
//  Person.m
//  BMI Calculator
//
//  Created by Annabelle on 6/29/16.
//  Copyright © 2016 Annabelle Tang. All rights reserved.
//

#import "Person.h"

static Person* secretPerson;

@implementation Person;
@synthesize weightInKG;
@synthesize heightInM;
@synthesize gender;
@synthesize age;


//implement secret person class method
+(Person*) sharedPersonInstance
{
  
  //if secretPerson doesn't exist, we need to do something to make it exit *** nil
  if(secretPerson == nil){
    secretPerson = [[Person alloc] init];
  }
  //if it exist, return the person
  return secretPerson;
}

//implementation of bmi instance method
-(NSNumber*) bmi
{
  return @(self.weightInKG.floatValue/
  (self.heightInM.doubleValue*self.heightInM.floatValue));
  
}

-(NSNumber*) bmr{
  if(self.gender.boolValue == 1)
  {
    return @(9.247*self.weightInKG.floatValue + 309.8*self.heightInM.floatValue - 4.33*self.age.floatValue + 447.593);
  }
  else{
    return @(13.397*self.weightInKG.floatValue + 479.9*self.heightInM.floatValue - 5.677*self.age.floatValue + 88.362);
  }
}


//description is a way to convert to string
-(NSString*) description
{
  return [NSString stringWithFormat:@ "%p %@ %@", self, self.weightInKG, self.heightInM];
  
}

@end
