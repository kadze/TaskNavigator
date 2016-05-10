//
//  SAPTasksViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTasksViewController.h"

#import "SAPTasksView.h"
#import "SAPTaskCell.h"
#import "SAPTaskViewController.h"
#import "SAPArrayModel.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPNavigationBarTitle = @"Tasks";

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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddTask)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)customizeNavigationBar {
    [self customizeRightBarButton];
    self.navigationItem.title = kSAPNavigationBarTitle;
}

- (void)onAddTask {
    
}

@end
