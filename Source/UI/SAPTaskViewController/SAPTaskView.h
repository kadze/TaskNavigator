//
//  SAPTaskView.h
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SAPView.h"
#import "UIFloatLabelTextField.h"
#import "UIFloatLabelTextView.h"
#import "ASValueTrackingSlider.h"

#import "SAPModelView.h"

@class SAPTask;

@interface SAPTaskView : SAPView <SAPModelView>
@property (nonatomic, strong) IBOutlet UIFloatLabelTextField    *titleTextField;
@property (nonatomic, strong) IBOutlet UIFloatLabelTextView     *notesTextView;
@property (nonatomic, strong) IBOutlet UIFloatLabelTextField    *addressTextField;
@property (nonatomic, strong) IBOutlet UIFloatLabelTextField    *latitudeTextField;
@property (nonatomic, strong) IBOutlet UIFloatLabelTextField    *longtitudeTextField;
@property (nonatomic, strong) IBOutlet UIButton                 *chooseOnMapButton;
@property (nonatomic, strong) IBOutlet ASValueTrackingSlider    *slider;
@property (nonatomic, strong) IBOutlet UISegmentedControl       *segmentedControl;

- (void)fillModel:(SAPTask *)model;

@end
