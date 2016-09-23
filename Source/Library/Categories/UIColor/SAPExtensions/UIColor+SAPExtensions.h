//
//  UIColor+SAPExtensions.h
//  TaskNavigator
//
//  Created by Andrey on 6/20/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIColor.h>

@interface UIColor (SAPExtensions)

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)a;

+ (instancetype)colorWithHex:(UInt32)col alpha:(CGFloat)alpha;

+ (instancetype)colorWithHex:(UInt32)col;

@end
