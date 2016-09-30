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
#import "UIColor+TaskNavigator.h"

static CGFloat const kSAPRendererLineWidth = 1.0;
static CGFloat const kSAPFillColorAlpha = 0.4;

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

- (void)setModel:(SAPTask *)model {
    if (_model != model) {
        MKMapView *mapView = self.mapView;
        
        [mapView removeAnnotation:_model];
        [self removeOverlayForTask:model];
        _model = model;
        [mapView addAnnotation:model];
        [self addOverlayForTask:model];
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

- (void)addOverlayForTask:(SAPTask *)task {
    [self.mapView addOverlay:[MKCircle circleWithCenterCoordinate:task.coordinate radius:task.notificationDistance]];
}

- (void)removeOverlayForTask:(SAPTask *)task {
    if (!task) {
        return;
    }
    
    for (id <MKOverlay> overlay in self.mapView.overlays) {
        if ([overlay isKindOfClass:[MKCircle class]]) {
            MKCircle *circleOverlay = overlay;
            CLLocationCoordinate2D coordinate = circleOverlay.coordinate;
            if (coordinate.latitude == task.latitude &&
                coordinate.longitude == task.longitude &&
                circleOverlay.radius == task.notificationDistance)
            {
                [self.mapView removeOverlay:overlay];
                
                break;
            }
        } else {
            continue;
        }
    }
}

@end
