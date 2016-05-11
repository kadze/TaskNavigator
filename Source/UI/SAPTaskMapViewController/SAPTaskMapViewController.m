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

SAPViewControllerBaseViewProperty(SAPTaskMapViewController, SAPTaskMapView, mainView);

@interface SAPTaskMapViewController ()

- (MKMapView *)mapView;

@end

@implementation SAPTaskMapViewController

@synthesize model = _model;
#pragma mark -
#pragma mark Accessors

- (void)setModel:(SAPModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    [self finishModelSetting];
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
    self.mainView.model = annotation;
}

#pragma mark -
#pragma mark Public

- (void)finishModelSetting {
    self.mainView.model = self.model;
}

#pragma mark -
#pragma mark Private

- (MKMapView *)mapView {
    return self.mainView.mapView;
}

@end
