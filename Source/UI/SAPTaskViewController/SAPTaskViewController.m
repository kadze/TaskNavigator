//
//  SAPTaskViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskViewController.h"

#import "SAPTaskView.h"

#import "SAPViewControllerMacro.h"

SAPViewControllerBaseViewProperty(SAPTaskViewController, SAPTaskView, mainView);

@interface SAPTaskViewController ()

@end

@implementation SAPTaskViewController

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onPointOnMap:(id)sender {
    
}

- (IBAction)onCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onDelete:(id)sender {
    
}

- (IBAction)onSave:(id)sender {
    
}

- (IBAction)onDistanceStepperChangeValue:(id)sender {
    
}

@end
