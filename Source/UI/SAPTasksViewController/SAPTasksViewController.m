//
//  SAPTasksViewController.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTasksViewController.h"

#import "SAPTasksView.h"
#import "SAPTaskCell.h"
#import "SAPTaskViewController.h"
#import "SAPArrayModel.h"

#import "SAPViewControllerMacro.h"

SAPViewControllerBaseViewProperty(SAPTasksViewController, SAPTasksView, mainView);

@interface SAPTasksViewController ()

@end

@implementation SAPTasksViewController

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [SAPTaskCell class];
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.mainView.tableView;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SAPTaskViewController *controller = [SAPTaskViewController new];
    controller.model = self.items[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
