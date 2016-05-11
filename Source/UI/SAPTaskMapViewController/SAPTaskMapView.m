//
//  SAPTaskMapView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskMapView.h"

#import "SAPTask.h"

@implementation SAPTaskMapView

@synthesize model = _model;

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
    CLLocationCoordinate2D coordinate = model.coordinate;
    if (CLLocationCoordinate2DIsValid(coordinate)) {
        id<MKAnnotation> annotation = self.model;
        annotation.coordinate = model.coordinate;
    }
}

@end
