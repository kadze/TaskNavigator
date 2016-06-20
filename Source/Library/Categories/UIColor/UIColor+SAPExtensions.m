//
//  UIColor+SAPExtensions.m
//  TaskNavigator
//
//  Created by Andrey on 6/20/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UIColor+SAPExtensions.h"

static CGFloat const kSAPColorChannelDivider = 255.0;
static CGFloat const kSAPDefaultAlpha = 1.0;

@implementation UIColor (SAPExtensions)

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue {
    return [self colorWithRed:red / kSAPColorChannelDivider
                        green:green / kSAPColorChannelDivider
                         blue:blue / kSAPColorChannelDivider
                        alpha:1];
}

@end
