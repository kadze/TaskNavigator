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

#import "SAPModelView.h"

@interface SAPTaskView : SAPView <SAPModelView>
@property (nonatomic, strong) IBOutlet UIFloatLabelTextField    *titleTextField;
@property (nonatomic, strong) IBOutlet UIFloatLabelTextView     *notesTextView;
@property (nonatomic, strong) IBOutlet UITextField              *addressTextField;
@property (nonatomic, strong) IBOutlet UITextField              *latitudeTextField;
@property (nonatomic, strong) IBOutlet UITextField              *longtitudeTextField;
@property (nonatomic, strong) IBOutlet UIButton                 *chooseOnMapButton;
@property (nonatomic, strong) IBOutlet UISlider                 *slider;
@property (nonatomic, strong) IBOutlet UISegmentedControl       *segmentedControl;

@end
