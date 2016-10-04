//
//  SAPLocationService.h
//  TaskNavigator
//
//  Created by ASH on 9/29/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SAPLocationService : NSObject
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation        *currentLocation;

+ (instancetype)sharedInstance;

- (void)startUpdatingLocation;

@end
