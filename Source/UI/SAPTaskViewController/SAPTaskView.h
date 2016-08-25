//
//  SAPTaskView.h
//  TaskNavigator
//
//  Created by Andrey on 5/10/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SAPView.h"

#import "SAPModelView.h"

@interface SAPTaskView : SAPView <SAPModelView>
@property (nonatomic, strong) IBOutlet UILabel      *titleLabel;
@property (nonatomic, strong) IBOutlet UITextField  *titleTextField;
@property (nonatomic, strong) IBOutlet UILabel      *notesLabel;
@property (nonatomic, strong) IBOutlet UITextView   *notesTextView;
@property (nonatomic, strong) IBOutlet UITextField  *addressTextField;
@property (nonatomic, strong) IBOutlet UITextField  *latitudeTextField;
@property (nonatomic, strong) IBOutlet UITextField  *longtitudeTextField;
@property (nonatomic, strong) IBOutlet UIButton     *chooseOnMapButton;
//@property (nonatomic, strong) IBOutlet UILabel      *distanceLabel;
@property (nonatomic, strong) IBOutlet UISlider     *slider;

@end
