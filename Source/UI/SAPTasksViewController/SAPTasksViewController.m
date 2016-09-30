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
#import "SAPTasksMapViewController.h"
#import "SAPTask.h"
#import "SAPTasksContext.h"
#import "SAPLocationService.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPNavigationBarTitle = @"Task List";
static NSString * const kSAPAddButtonImageName = @"AddButton";

SAPViewControllerBaseViewProperty(SAPTasksViewController, SAPTasksView, mainView);

@interface SAPTasksViewController () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;

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
    [self setupLocationManager];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.mainView.tableView;
}

- (SAPContext *)itemsContext {
    return [SAPTasksContext contextWithModel:self.items];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onMapButtonTap:(UIButton *)sender {
    SAPTasksMapViewController *controller = [SAPTasksMapViewController new];
    controller.model = self.items;
    [self.navigationController pushViewController:controller animated:YES];
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

- (void)setupLocationManager {
    CLLocationManager *locationManager = [SAPLocationService sharedInstance].locationManager;
    self.locationManager = locationManager;
    locationManager.delegate = self;
    [locationManager requestAlwaysAuthorization];
}

@end
