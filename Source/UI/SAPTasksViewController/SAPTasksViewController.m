//
//  SAPTasksViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <MagicalRecord/MagicalRecord.h>
#import <UserNotifications/UserNotifications.h>


#import "SAPTasksViewController.h"

#import "SAPTasksView.h"
#import "SAPTaskCell.h"
#import "SAPTaskViewController.h"
#import "SAPTasksMapViewController.h"
#import "SAPTask.h"
#import "SAPTasksContext.h"
#import "SAPLocationService.h"

#import "UIAlertController+SAPExtensions.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPNavigationBarTitle = @"Task List";
static NSString * const kSAPAddButtonImageName = @"AddButton";
static NSString * const kSAPErrorTitle = @"Error";
static NSString * const kSAPLocationManagerErrorTitle = @"Location Manager failed with the following error: ";
static NSString * const kSAPMonitoringErrorTitle = @"Monitoring failed for region with identifier: ";

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
    
    
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge)
//                          completionHandler:^(BOOL granted, NSError * _Nullable error)
//    {
//        ///
//    }];
    
//    [center removeAllPendingNotificationRequests];
    
    
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
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    if ([region isKindOfClass:[CLCircularRegion class]]) {
        [self handleEventForRegion:region];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [UIAlertController presentAlertControllerWithTitle:kSAPErrorTitle
                                               message:[NSString stringWithFormat:@"%@%@", kSAPLocationManagerErrorTitle, error.description]];
}

- (void)locationManager:(CLLocationManager *)manager
monitoringDidFailForRegion:(nullable CLRegion *)region
              withError:(NSError *)error
{
    [UIAlertController presentAlertControllerWithTitle:kSAPErrorTitle
                                               message:[NSString stringWithFormat:@"%@%@", kSAPMonitoringErrorTitle, region.identifier]];
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

- (void)handleEventForRegion:(CLCircularRegion *)region {
    NSLog(@"Geofence triggered!!!");
}

- (NSString *)noteForRegion:(CLCircularRegion *)region {
    return [self taskForRegion:region].notes;
}

- (SAPTask *)taskForRegion:(CLCircularRegion *)region {
    NSArray *tasks = self.items.objects;
    NSUInteger taskIndex = [tasks indexOfObjectPassingTest:^BOOL(SAPTask *task, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([task.objectID.URIRepresentation.absoluteString isEqualToString:region.identifier]) {
            return YES;
        }
        
        return NO;
    }];
    
    SAPTask *task = nil;
    if (NSNotFound != taskIndex) {
        task = tasks[taskIndex];
    }
    
    return task;
}

@end
