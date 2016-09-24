//
//  SAPCoreDataArrayViewController.h
//  TaskNavigator
//
//  Created by ASH on 9/23/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPArrayViewController.h"
#import "SAPCoreDataArrayModel.h"

@interface SAPCoreDataArrayViewController : SAPArrayViewController
@property (nonatomic, strong) SAPCoreDataArrayModel *items;

@end
