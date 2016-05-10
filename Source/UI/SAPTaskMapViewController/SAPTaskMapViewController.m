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
#pragma mark Public

- (void)finishModelSetting {
    SAPTask *model = self.model;
    if (!model) {
        return;
    }
    
    CLLocationCoordinate2D coordinate = model.coordinate;
    if (CLLocationCoordinate2DIsValid(coordinate)) {
        self.mainView.model = model;
    }
}

@end
