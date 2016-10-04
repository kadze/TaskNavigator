//
//  SAPLocationService.m
//  TaskNavigator
//
//  Created by ASH on 9/29/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPLocationService.h"

#import "SAPDispatchOnceMacro.h"

@implementation SAPLocationService

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedInstance {
    static SAPLocationService *instance = nil;
    SAPDispatchOnce(^{
        instance = [SAPLocationService new];
    });
    
    return instance;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.locationManager = [CLLocationManager new];
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    self.locationManager.distanceFilter = kSAPDistanceFilter;
//    self.locationManager.delegate = self;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}

@end
