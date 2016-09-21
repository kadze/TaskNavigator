//
//  SAPTaskViewController.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPViewController.h"

@interface SAPTaskViewController : SAPViewController

- (IBAction)onPointOnMap:(UIButton *)sender;
- (IBAction)onSegmentedControlValueChanged:(UISegmentedControl *)sender;
- (IBAction)onDistanceStepperChangeValue:(id)sender;

@end
