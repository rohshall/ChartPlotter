//
//  PLConfigViewController.h
//  ChartPlotter
//
//  Created by Salil Wadnerkar on 26/4/13.
//  Copyright (c) 2013 Salil Wadnerkar. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ConfigViewControllerDelegate <NSObject>
@required
- (void)didRetrieveDeviceID: (NSString *) deviceID;
@end

@interface PLConfigViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *deviceID;
@property (weak, nonatomic) id<ConfigViewControllerDelegate> delegate;
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField;
- (IBAction)storeDeviceID:(id)sender;
- (void)didRetrieveDeviceID: (NSString *) deviceID;
@end
