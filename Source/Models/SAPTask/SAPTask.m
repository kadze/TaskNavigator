//
//  SAPTask.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTask.h"

#import "NSManagedObject+SAPExtensions.h"

@implementation SAPTask

@dynamic latitude;
@dynamic longitude;
@dynamic notificationDistance;
@dynamic address;
@dynamic title;
@dynamic notes;

//@dynamic coordinate;

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

@end
