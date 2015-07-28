//
//  FirstViewController.m
//  HealthBasics
//
//  Created by Lukas Petr on 24/07/15.
//  Copyright (c) 2015 Tuts+. All rights reserved.
//

#import "FirstViewController.h"
#import "GSHealthKitManager.h"

@interface FirstViewController ()

@property (nonatomic, weak) IBOutlet UILabel *ageLabel;
@property (nonatomic, weak) IBOutlet UITextField *weightTextField;

@end


@implementation FirstViewController

- (IBAction)healthIntegrationButtonSwitched:(UISwitch *)sender {
    
    if (sender.isOn) {
        [[GSHealthKitManager sharedManager] requestAuthorization];
    } else {
        // Possibly disable HealthKit functionality in your app.
    }
}

- (IBAction)readAgeButtonPressed:(id)sender {
    
    NSDate *birthDate = [[GSHealthKitManager sharedManager] readBirthDate];
    
    if (birthDate == nil) {
        // Either user didn't set the date, or an error occured. Simply return.
        return;
    }
    
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:birthDate
                                       toDate:[NSDate date]
                                       options:0];
    
    self.ageLabel.text = [@(ageComponents.year) stringValue];
}

- (IBAction)writeWeightButtonPressed:(id)sender {
    [[GSHealthKitManager sharedManager] writeWeightSample:self.weightTextField.text.floatValue];
}

@end
