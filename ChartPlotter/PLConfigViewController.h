//
//  PLConfigViewController.h
//  ChartPlotter
//
//  Created by Salil Wadnerkar on 26/4/13.
//  Copyright (c) 2013 Salil Wadnerkar. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PLConfigViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *deviceID;
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField;
@end
