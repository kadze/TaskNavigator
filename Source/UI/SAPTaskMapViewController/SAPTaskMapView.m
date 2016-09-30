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
    [self.mapView zoomToUserLocation];
}

@end
