//
//  SAPTasksViewController.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "SAPCoreDataArrayViewController.h"

@interface SAPTasksViewController : SAPCoreDataArrayViewController
@property (nonatomic, readonly) CLLocationManager *locationManager;

- (IBAction)onMapButtonTap:(UIButton *)sender;

@end
