//
//  SAPMapView.h
//  TaskNavigator
//
//  Created by ASH on 9/30/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "SAPView.h"
#import "SAPModelView.h"

@class SAPTask;

@interface SAPMapView : SAPView <SAPModelView, MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (void)addOverlayForTask:(SAPTask *)task;
- (void)removeOverlayForTask:(SAPTask *)task;

@end
