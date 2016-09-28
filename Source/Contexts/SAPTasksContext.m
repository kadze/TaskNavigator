//
//  SAPTasksContext.m
//  TaskNavigator
//
//  Created by ASH on 9/23/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "SAPTasksContext.h"

#import "SAPTask.h"
#import "SAPTaskProperties.h"
#import "SAPTasks.h"

@implementation SAPTasksContext

- (void)stateUnsafeLoad {
    NSArray *tasks = [SAPTask MR_findAllSortedBy:[SAPTaskProperties title] ascending:YES];
    SAPTasks *items = self.model;
    for (SAPTask *task in tasks) {
        [items addObject:task];
    };
    
    [self.model setState:kSAPModelStateDidFinishLoading];
}

@end
