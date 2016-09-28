//
//  SAPTasksView.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UITableView.h>

#import "SAPView.h"

@interface SAPTasksView : SAPView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;
@property (nonatomic, strong) IBOutlet UIButton     *mapButton;

@end
