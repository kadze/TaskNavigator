//
//  SAPTasks.m
//  TaskNavigator
//
//  Created by ASH on 9/23/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTasks.h"

#import "SAPTaskProperties.h"

static NSString * const kSAPDescriptorKey = @"title";

@implementation SAPTasks

#pragma mark -
#pragma mark Public

- (NSArray *)fetchedResultsControllerSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:[SAPTaskProperties title] ascending:YES]];
}

@end
