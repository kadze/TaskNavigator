//
//  SAPTaskCell.h
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTableViewCell.h"

#import "SAPModelView.h"

@interface SAPTaskCell : SAPTableViewCell <SAPModelView>
@property (nonatomic, strong) IBOutlet UILabel *label;
@end
