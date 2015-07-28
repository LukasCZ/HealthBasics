//
//  SecondViewController.m
//  HealthBasics
//
//  Created by Lukas Petr on 24/07/15.
//  Copyright (c) 2015 Tuts+. All rights reserved.
//

#import "SecondViewController.h"
#import "GSHealthKitManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)writeWorkoutButtonPressed:(id)sender {
    
    // In a real world app, you would obtain reference to a relevant model object and pass it to following method.
    [[GSHealthKitManager sharedManager] writeWorkoutDataFromModelObject:nil];
}

@end
