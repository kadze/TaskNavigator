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

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self.slider setMaximumTrackImage:[[UIImage imageNamed:@"Slider"]stretchableImageWithLeftCapWidth:9 topCapHeight:0]  forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:[[UIImage imageNamed:@"Slider"]stretchableImageWithLeftCapWidth:9 topCapHeight:0]  forState:UIControlStateNormal];
    
    return self;
}

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
    CGColorRef grayColor = [UIColor lightGrayColor].CGColor;
    for (UIControl *control in @[self.titleTextField,
                                 self.notesTextView,
                                 self.latitudeTextField,
                                 self.longtitudeTextField,
                                 self.addressTextField])
    {
        CALayer *layer = control.layer;
        layer.borderColor = grayColor;
        layer.borderWidth = 1;
    }
    
    UIButton *chooseButton = self.chooseOnMapButton;
    chooseButton.layer.cornerRadius = chooseButton.bounds.size.height / 2;
    
    self.notesTextView.placeholder = @"Notes";
    self.titleTextField.floatLabelActiveColor = [UIColor colorWithRed:55/255.0 green:74/255.0 blue:151/255.0 alpha:1.0];
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPTask *)task {
    self.latitudeTextField.text = [self stringFromDouble:task.latitude];
    self.longtitudeTextField.text = [self stringFromDouble:task.longitude];
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
