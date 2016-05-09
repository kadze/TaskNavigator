//
//  SAPTask.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

#import "SAPModel.h"

@interface SAPTask : SAPModel
@property (nonatomic, assign) CLLocationDegrees   latitude;
@property (nonatomic, assign) CLLocationDegrees   longitude;
@property (nonatomic, assign) CLLocationDistance  notificationDistance;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSString *address;

@end
