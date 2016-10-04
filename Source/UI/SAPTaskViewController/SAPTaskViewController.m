//
//  SAPTaskViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "SAPTaskViewController.h"

#import "SAPTask.h"
#import "SAPTaskView.h"
#import "SAPTaskMapViewController.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPNavigationBarTitle = @"Task";

SAPViewControllerBaseViewProperty(SAPTaskViewController, SAPTaskView, mainView);

@interface SAPTaskViewController ()

- (void)fillModelFromMainView;

@end

@implementation SAPTaskViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeNavigationBar];
    
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSLog(@"%d", ((NSManagedObject *)self.model).isInserted);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.movingFromParentViewController) {
        [self deleteIfInserted];
    }
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onPointOnMap:(UIButton *)sender {
    SAPTaskMapViewController *controller = [SAPTaskMapViewController new];
    [self fillModelFromMainView];
    controller.model = self.model;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onSegmentedControlValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self cancel];
            
        break;
            
        case 1:
            [self delete];
            
        break;
            
        case 2:
            [self save];
            
        break;
    }
}

#pragma mark -
#pragma mark Public

- (void)finishModelSetting {
    [self updateViewControllerWithModel:self.model];
}

- (void)updateViewControllerWithModel:(id)model {
    self.mainView.model = model;
}

#pragma mark -
#pragma mark Private

- (void)fillModelFromMainView {
    [self.mainView fillModel:self.model];
}

- (void)customizeNavigationBar {
    self.navigationItem.title = kSAPNavigationBarTitle;
}

- (void)cancel {
    [self deleteIfInserted];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)delete {
    [self.model MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)save {
    [self fillModelFromMainView];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)deleteIfInserted {
    SAPTask *model = self.model;
    if (model.inserted) {
        [self.model MR_deleteEntity];
    }
}

@end
