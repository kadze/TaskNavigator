//
//  SAPTaskMapViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskMapViewController.h"

#import "SAPTaskMapView.h"
#import "SAPTask.h"

#import "SAPViewControllerMacro.h"

#import "SAPDispatch.h"

static NSString * const kSAPNavigationBarTitle = @"Tap to point";
static NSString * const kSAPClearButtonTitle   = @"Clear";

SAPViewControllerBaseViewProperty(SAPTaskMapViewController, SAPTaskMapView, mainView);

@interface SAPTaskMapViewController ()

- (MKMapView *)mapView;
- (void)discardChoice;
- (void)customizeNavigationItem;

@end

@implementation SAPTaskMapViewController

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
    [self customizeNavigationItem];
    self.mapView.showsUserLocation = ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways);
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onTap:(UITapGestureRecognizer *)recognizer {
    MKMapView *mapView = self.mapView;
    CGPoint recognizerLocation = [recognizer locationInView:mapView];
    CLLocationCoordinate2D coordinate = [mapView convertPoint:recognizerLocation
                                         toCoordinateFromView:mapView];
    
    SAPTask *annotation = self.model;
    annotation.coordinate = coordinate;
    
    SAPDispatchAsyncOnDefaultQueue(^{
        //SAPTask uses message forwarding to SAPModel which is subclass of SAPObservableObject
        [(SAPObservableObject *)annotation notifyObserversWithSelector:@selector(modelDidFinishLoading:)];
    });
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

- (void)discardChoice {
    id model = self.model;
    SAPTask *annotation = self.model;
    annotation.coordinate = kCLLocationCoordinate2DInvalid;
    SAPDispatchAsyncOnDefaultQueue(^{
        [model notifyObserversWithSelector:@selector(modelDidFinishLoading:)];
    });
}

- (void)customizeNavigationItem {
    self.navigationItem.title = kSAPNavigationBarTitle;
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:kSAPClearButtonTitle
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(discardChoice)];
    
    self.navigationItem.rightBarButtonItem = clearButton;
}

@end
