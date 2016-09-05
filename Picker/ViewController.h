//
//  ViewController.h
//  Picker
//
//  Created by Jimish Soni on 03/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (strong, nonatomic) IBOutlet UILabel *countrylbl;
@property (strong, nonatomic) IBOutlet UILabel *statelbl;
@property (strong, nonatomic) IBOutlet UILabel *citylbl;

-(int) getStateCount;
-(NSString*) getStateName: (NSInteger)index;
@end

