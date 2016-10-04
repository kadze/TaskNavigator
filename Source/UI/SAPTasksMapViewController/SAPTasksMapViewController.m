//
//  SAPTasksMapViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTasksMapViewController.h"

#import "SAPViewControllerMacro.h"
#import "SAPTasksMapView.h"

#import "MKMapView+SAPExtensions.h"

static NSString * const kSAPZoomButtonTitle = @"Zoom";

SAPViewControllerBaseViewProperty(SAPTasksMapViewController, SAPTasksMapView, mainView);

@interface SAPTasksMapViewController ()

- (MKMapView *)mapView;

@end

@implementation SAPTasksMapViewController

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserverObject:self];
    }
    
    [self finishModelSetting];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.showsUserLocation = ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kSAPZoomButtonTitle
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self.mapView
                                                                             action:@selector(zoomToUserLocation)];
}

#pragma mark -
#pragma mark Public

- (void)updateViewControllerWithModel:(id)model {
    self.mainView.model = model;
}

- (void)finishModelSetting {
    [self updateViewControllerWithModel:self.model];
}

#pragma mark -
#pragma mark Private

- (MKMapView *)mapView {
    return self.mainView.mapView;
}

@end
