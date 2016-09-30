//
//  SAPTask.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTask.h"

#import "SAPLocationService.h"
#import "SAPTaskProperties.h"

#import "UIAlertController+SAPExtensions.h"
#import "NSManagedObject+SAPExtensions.h"

static NSString * const kSAPErrorTitle = @"Error";
static NSString * const kSAPWarningTitle = @"Warning";
static NSString * const kSAPNotSupportedMessage = @"Geofencing is not supported on this device!";
static NSString * const kSAPNoPermissionMessage = @"Your geotification is saved but will only be activated once you grant Geotify permission to access the device location.";

@implementation SAPTask

@dynamic latitude;
@dynamic longitude;
@dynamic notificationDistance;
@dynamic address;
@dynamic title;
@dynamic notes;

//@dynamic coordinate;
@synthesize region = _region;

#pragma mark -
#pragma mark Accessors

- (CLLocationCoordinate2D)coordinate {
    CLLocationDegrees latitude = self.latitude;
    CLLocationDegrees longitude = self.longitude;
    if (latitude != 0.0 && longitude != 0.0) {
        return CLLocationCoordinate2DMake(latitude,longitude);
    }
    
    return kCLLocationCoordinate2DInvalid;
}

- (CLCircularRegion *)region {
    NSManagedObjectID *managedObjectID = self.objectID;
    if (managedObjectID.temporaryID) {
        return nil;
    } else {
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.coordinate
                                                                     radius:self.notificationDistance
                                                                 identifier:managedObjectID.URIRepresentation.absoluteString];
        
        region.notifyOnEntry = YES;
        
        return region;
    }
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate {
    self.latitude = coordinate.latitude;
    self.longitude = coordinate.longitude;
}

- (void)setLatitude:(CLLocationDegrees)latitude {
    [self setCustomValue:@(latitude) forKey:NSStringFromSelector(@selector(latitude))];
}

- (void)setLongitude:(CLLocationDegrees)longitude {
    [self setCustomValue:@(longitude) forKey:NSStringFromSelector(@selector(longitude))];
}

- (void)setNotificationDistance:(CLLocationDistance)notificationDistance {
    [self setCustomValue:@(notificationDistance) forKey:NSStringFromSelector(@selector(notificationDistance))];
}

#pragma mark -
#pragma mark Managed Object Life Cycle and Cnange Events

- (void)awakeFromFetch {
    [self startMonitoring];
}

- (void)didSave {
    if (self.isDeleted) {
        [self stopMonitoring];
    } else {
        [self startMonitoring]; // If an existing region with the same identifier is already being monitored by the app, the old region is replaced by the new one.
    }
}

#pragma mark -
#pragma mark Private

- (void)startMonitoring {
    if (!self.region) {
        return;
    }
    
    if (![CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        [UIAlertController presentAlertControllerWithTitle:kSAPErrorTitle message:kSAPNotSupportedMessage];
    }
    
    if (kCLAuthorizationStatusAuthorizedAlways != [CLLocationManager authorizationStatus]) {
        [UIAlertController presentAlertControllerWithTitle:kSAPWarningTitle message:kSAPNotSupportedMessage];
    }
    
    [[SAPLocationService sharedInstance].locationManager startMonitoringForRegion:self.region];
}

- (void)stopMonitoring {
    [[SAPLocationService sharedInstance].locationManager stopMonitoringForRegion:self.region];
}

@end
