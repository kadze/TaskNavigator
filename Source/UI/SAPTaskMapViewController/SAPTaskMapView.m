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

#pragma mark -
#pragma mark Initial Setup

- (void)awakeFromNib {
    [super awakeFromNib];
    self.mapView.delegate = self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id<MKAnnotation>)model {
    if (_model != model) {
        MKMapView *mapView = self.mapView;
        
        [mapView removeAnnotation:_model];
        _model = model;
        [mapView addAnnotation:model];
    }
    
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
