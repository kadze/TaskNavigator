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

static NSString * const kSAPNavigationBarTitle = @"Task";

SAPViewControllerBaseViewProperty(SAPTaskViewController, SAPTaskView, mainView);

@interface SAPTaskViewController ()
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

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
#pragma mark Accessors

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint {
    if (topConstraint != _topConstraint) {
        _topConstraint.active = NO;
        _topConstraint = topConstraint;
        _topConstraint.active = YES;
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
    
}

- (void)delete {
    
}

- (void)save {
    
}

@end
