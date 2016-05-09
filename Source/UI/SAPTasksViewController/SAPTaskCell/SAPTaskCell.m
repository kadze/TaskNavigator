//
//  SAPTaskCell.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UILabel.h>

#import "SAPTaskCell.h"

#import "SAPTask.h"

@implementation SAPTaskCell
@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(SAPTask *)model {
    if (_model != model) {
        _model = model;
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPTask *)model {
    self.label.text = [NSString stringWithFormat:@"%@", model.title];
}

@end
