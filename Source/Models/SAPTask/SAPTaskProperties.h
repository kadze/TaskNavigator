//
//  SAPTaskProperties.h
//  TaskNavigator
//
//  Created by ASH on 9/26/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

@interface SAPTaskProperties : NSObject

+ (NSString *)latitude;
+ (NSString *)longitude;
+ (NSString *)notificationDistance;

+ (NSString *)address;
+ (NSString *)title;
+ (NSString *)notes;

+ (NSString *)coordinate;
+ (NSString *)region;
+ (NSString *)stringID;

@end
