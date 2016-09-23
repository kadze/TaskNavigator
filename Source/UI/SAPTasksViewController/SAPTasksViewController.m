//
//  SAPTasksViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <MagicalRecord/MagicalRecord.h>

#import "SAPTasksViewController.h"

#import "SAPTasksView.h"
#import "SAPTaskCell.h"
#import "SAPTaskViewController.h"
#import "SAPTask.h"
#import "SAPArrayModel.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPNavigationBarTitle = @"Task List";
static NSString * const kSAPAddButtonImageName = @"AddButton";

SAPViewControllerBaseViewProperty(SAPTasksViewController, SAPTasksView, mainView);

@interface SAPTasksViewController ()

- (void)customizeNavigationBar;
- (void)customizeRightBarButton;
- (void)onAddTask;

@end

@implementation SAPTasksViewController

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [SAPTaskCell class];
}

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
    CGFloat topOffset = self.navigationController.navigationBar.bounds.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:topOffset];
    
    [NSLayoutConstraint activateConstraints:@[top]];
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.mainView.tableView;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SAPTaskViewController *controller = [SAPTaskViewController new];
    controller.model = self.items[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)customizeRightBarButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:kSAPAddButtonImageName]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(onAddTask)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)customizeNavigationBar {
    [self customizeRightBarButton];
    self.navigationItem.title = kSAPNavigationBarTitle;
}

- (void)onAddTask {
    SAPTaskViewController *controller = [SAPTaskViewController new];
    controller.model = [SAPTask MR_createEntity];
    [self.navigationController pushViewController:controller animated:NO];
}

@end
