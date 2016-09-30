//
//  SAPTaskMapView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskMapView.h"

#import "SAPTask.h"

#import "MKMapView+SAPExtensions.h"

@implementation SAPTaskMapView

@synthesize model = _model;
@synthesize mapView = _mapView;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(SAPTask *)model {
    MKMapView *mapView = self.mapView;
    
    [mapView removeAnnotation:_model];
    [mapView removeOverlays:mapView.overlays];
    _model = model;
    [mapView addAnnotation:model];
    [self addOverlayForTask:model];
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(id<MKAnnotation>)model {
    
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //if there is valid annotation - zoom to it, if not - zoom to user location;
    NSArray *annotations = mapView.annotations;
    if (annotations.count) {
        id <MKAnnotation> annotation = annotations.firstObject;
        CLLocationCoordinate2D coordinate = annotation.coordinate;
        if (CLLocationCoordinate2DIsValid(coordinate)) {
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
            [mapView setRegion:region animated:YES];
        }
    } else {
        [self.mapView zoomToUserLocation];
    }
}

@end
