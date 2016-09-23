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
    return [self colorWithR:red G:green B:blue alpha:kSAPDefaultAlpha];
}

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)a {
    return [self colorWithRed:red / kSAPColorChannelDivider
                        green:green / kSAPColorChannelDivider
                         blue:blue / kSAPColorChannelDivider
                        alpha:a];
}

+ (instancetype)colorWithHex:(UInt32)col alpha:(CGFloat)alpha {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    
    return [self colorWithR:r G:g B:b alpha:alpha];
}

+ (instancetype)colorWithHex:(UInt32)col {
    return [self colorWithHex:col alpha:kSAPDefaultAlpha];
}

@end
