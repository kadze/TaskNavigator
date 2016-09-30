//
//  SAPTaskMapView.h
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <MapKit/MapKit.h>

#import "SAPMapView.h"

#import "SAPModelView.h"

@interface SAPTaskMapView : SAPMapView <SAPModelView, MKMapViewDelegate>
//@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UIButton  *OKButton;           

@end
