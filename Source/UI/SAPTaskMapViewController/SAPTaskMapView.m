//
//  SAPTaskMapView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskMapView.h"

@implementation SAPTaskMapView

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(SAPModel *)model {
    if (_model != model) {
        _model = model;
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(id)model {
    [self.mapView addAnnotation:model];
}

@end
