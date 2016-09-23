//
//  SAPTask.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <CoreLocation/CLLocation.h>
#import <MapKit/MKAnnotation.h>
#import "SAPManagedObject.h"

#import "SAPModel.h"

@interface SAPTask : SAPManagedObject <MKAnnotation>
@property (nonatomic, assign) CLLocationDegrees   latitude;
@property (nonatomic, assign) CLLocationDegrees   longitude;
@property (nonatomic, assign) CLLocationDistance  notificationDistance;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSString *address;

@end
