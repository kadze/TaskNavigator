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

static CGFloat const kSAPDefaultConstrainConstant   = 8;
static NSString * const kSAPNavigationBarTitle      = @"Task";

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

//- (void)updateViewConstraints {
////    CGFloat topOffset = self.navigationController.navigationBar.bounds.size.height + [UIApplication sharedApplication].statusBarFrame.size.height + kSAPDefaultConstrainConstant;
////    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.mainView.titleLabel
////                                                           attribute:NSLayoutAttributeTop
////                                                           relatedBy:NSLayoutRelationEqual
////                                                              toItem:self.topLayoutGuide
////                                                           attribute:NSLayoutAttributeTop
////                                                          multiplier:1
////                                                            constant:topOffset];
////    
////    self.topConstraint = top;
//    [super updateViewConstraints];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
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
#pragma mark Public

- (void)updateViewControllerWithModel:(id)model {
    self.mainView.model = model;
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
//    task.notificationDistance = view.distanceTextField.text.doubleValue;    
}

- (void)customizeNavigationBar {
    self.navigationItem.title = kSAPNavigationBarTitle;
}


@end
