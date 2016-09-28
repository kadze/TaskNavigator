//
//  SAPTasksMapView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTasksMapView.h"

#import "SAPTasks.h"

@implementation SAPTasksMapView

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(SAPTasks *)model {
    if (_model != model) {
        MKMapView *mapView = self.mapView;
        
        [mapView removeAnnotations:mapView.annotations];
        _model = model;
        for (int i = 0; i < model.count; i++) {
            id<MKAnnotation> annotation = model[i];
            [mapView addAnnotation:annotation];
        }
    }
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPCoreDataArrayModel *)model {

}

@end
