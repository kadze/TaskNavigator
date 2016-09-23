//
//  SAPTask.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTask.h"

@implementation SAPTask

@dynamic coordinate;

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

@end
