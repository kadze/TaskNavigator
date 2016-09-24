//
//  SAPTaskView.m
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTaskView.h"

#import "SAPTask.h"

#import "UIColor+TaskNavigator.h"

static CGFloat const kSAPDefaultBorderWidth = 1;

static NSString * const kSAPNotesPlaceholder = @"Notes";

@interface SAPTaskView ()

- (NSString *)stringFromDouble:(double)value;
- (void)customizeControls;

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
#pragma mark View Lifecycle

- (void)layoutSubviews {
    [super layoutSubviews];
    [self customizeControls];
}

#pragma mark -
#pragma mark Public

- (void)fillModel:(SAPTask *)model {
    model.title = self.titleTextField.text;
    model.notes = self.notesTextView.text;
    model.address = self.addressTextField.text;
    model.longitude = self.longtitudeTextField.text.doubleValue;
    model.latitude = self.latitudeTextField.text.doubleValue;
    model.notificationDistance = self.slider.value;
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPTask *)task {
    if (CLLocationCoordinate2DIsValid(task.coordinate)) {
        self.latitudeTextField.text = [self stringFromDouble:task.latitude];
        self.longtitudeTextField.text = [self stringFromDouble:task.longitude];
    } else {
        self.latitudeTextField.text = @"";
        self.longtitudeTextField.text = @"";
    }
    
    self.titleTextField.text = task.title;
    self.notesTextView.text = task.notes;
    self.addressTextField.text = task.address;
    self.slider.value = task.notificationDistance;
}

#pragma mark -
#pragma mark Private

- (NSString *)stringFromDouble:(double)value {
    return [NSString stringWithFormat:@"%f", value];
}

- (void)customizeControls {
    CGColorRef grayColor = [UIColor lightGrayColor].CGColor;
    for (UIFloatLabelTextField *control in @[self.titleTextField,
                                                 self.notesTextView,
                                                 self.latitudeTextField,
                                                 self.longtitudeTextField,
                                                 self.addressTextField])
    {
        CALayer *layer = control.layer;
        layer.borderColor = grayColor;
        layer.borderWidth = kSAPDefaultBorderWidth;
        
        control.floatLabelActiveColor = [UIColor blueThemeColor];
    }
    
    UIButton *chooseButton = self.chooseOnMapButton;
    chooseButton.layer.cornerRadius = chooseButton.bounds.size.height / 2;
    
    self.notesTextView.placeholder = kSAPNotesPlaceholder;
    
    ASValueTrackingSlider *slider = self.slider;
    [slider showPopUpViewAnimated:YES];
    [slider setMaxFractionDigitsDisplayed:0];
    slider.popUpViewColor = [UIColor blueThemeColor];
}

@end
