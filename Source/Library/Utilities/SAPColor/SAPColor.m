//
//  SAPColor.m
//  TaskNavigator
//
//  Created by Andrey on 6/20/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPColor.h"

#import "UIColor+SAPExtensions.h"

static CGFloat const kSAPNavigationBarRedChannel = 55;
static CGFloat const kSAPNavigationBarGreenChannel = 74;
static CGFloat const kSAPNavigationBarBlueChannel = 151;

@implementation SAPColor

+ (instancetype)navigationBarColor {
    return (SAPColor *)[UIColor colorWithR:kSAPNavigationBarRedChannel
                                         G:kSAPNavigationBarGreenChannel
                                         B:kSAPNavigationBarBlueChannel];
}

@end
