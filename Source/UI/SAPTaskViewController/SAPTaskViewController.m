//
//  SAPTaskViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskViewController.h"

#import "SAPTask.h"
#import "SAPTaskView.h"
#import "SAPTaskMapViewController.h"

#import "SAPViewControllerMacro.h"

SAPViewControllerBaseViewProperty(SAPTaskViewController, SAPTaskView, mainView);

@interface SAPTaskViewController ()

- (void)fillModelFromMainView;

@end

@implementation SAPTaskViewController

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onPointOnMap:(id)sender {
    SAPTaskMapViewController *controller = [SAPTaskMapViewController new];
    [self fillModelFromMainView];
    controller.model = self.model;
    [self.navigationController pushViewController:controller animated:YES];
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

#pragma mark -
#pragma mark Private

- (void)fillModelFromMainView {
    SAPTask *task = self.model;
    SAPTaskView *view = self.mainView;
    task.title = view.titleTextField.text;
    task.notes = view.notesTextView.text;
    task.address = view.addressTextField.text;
    task.longitude = view.longtitudeTextField.text.doubleValue;
    task.latitude = view.latitudeTextField.text.doubleValue;
    task.notificationDistance = view.distanceTextField.text.doubleValue;    
}

@end
