//
//  SAPMapView.m
//  TaskNavigator
//
//  Created by ASH on 9/30/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPMapView.h"

#import "SAPTask.h"

#import "MKMapView+SAPExtensions.h"
#import "UIColor+TaskNavigator.h"

static CGFloat const kSAPRendererLineWidth  = 1.0;
static CGFloat const kSAPFillColorAlpha     = 0.4;

@implementation SAPMapView

@synthesize mapView = _mapView;
@synthesize model = _model;

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
        renderer.lineWidth = kSAPRendererLineWidth;
        UIColor *blueColor = [UIColor blueThemeColor];
        renderer.strokeColor = blueColor;
        renderer.fillColor = [blueColor colorWithAlphaComponent:kSAPFillColorAlpha];
        return renderer;
    }
    
    return [[MKOverlayRenderer alloc] initWithOverlay:overlay];
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(id<MKAnnotation>)model {
    
}

#pragma mark -
#pragma mark Public

- (void)addOverlayForTask:(SAPTask *)task {
    [self.mapView addOverlay:[MKCircle circleWithCenterCoordinate:task.coordinate radius:task.notificationDistance]];
}

- (void)removeOverlayForTask:(SAPTask *)task {
    if (!task) {
        return;
    }
    
    MKMapView *mapView = self.mapView;
    for (id <MKOverlay> overlay in mapView.overlays) {
        if ([overlay isKindOfClass:[MKCircle class]]) {
            MKCircle *circleOverlay = overlay;
            CLLocationCoordinate2D coordinate = circleOverlay.coordinate;
            if (coordinate.latitude == task.latitude &&
                coordinate.longitude == task.longitude &&
                circleOverlay.radius == task.notificationDistance)
            {
                [mapView removeOverlay:overlay];
                
                break;
            }
        } else {
            continue;
        }
    }
}

@end
