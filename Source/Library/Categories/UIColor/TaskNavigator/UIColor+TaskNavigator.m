//
//  UIColor+TaskNavigator.m
//  TaskNavigator
//
//  Created by ASH on 9/22/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UIColor+TaskNavigator.h"

#import "UIColor+SAPExtensions.h"

static CGFloat const kSAPBlueThemeColorHex = 0x374A97;

@implementation UIColor (TaskNavigator)

+ (UIColor *)blueThemeColor {
    return [self colorWithHex:kSAPBlueThemeColorHex];
}

@end
