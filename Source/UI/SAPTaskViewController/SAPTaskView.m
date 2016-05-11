//
//  SAPTaskView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskView.h"

#import "SAPTask.h"

@interface SAPTaskView ()

- (NSString *)stringFromDouble:(double)value;

@end

@implementation SAPTaskView

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
    }
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPTask *)task {
    self.latitudeTextField.text = [self stringFromDouble:task.latitude];
    self.longtitudeTextField.text = [self stringFromDouble:task.longitude];
    self.distanceTextField.text = [self stringFromDouble:task.notificationDistance];
    self.titleTextField.text = task.title;
    self.notesTextView.text = task.notes;
    self.addressTextField.text = task.address;
}

#pragma mark -
#pragma mark Private

- (NSString *)stringFromDouble:(double)value {
    return [NSString stringWithFormat:@"%f", value];
}

@end
