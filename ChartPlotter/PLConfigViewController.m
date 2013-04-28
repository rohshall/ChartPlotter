//
//  PLConfigViewController.m
//  ChartPlotter
//
//  Created by Salil Wadnerkar on 26/4/13.
//  Copyright (c) 2013 Salil Wadnerkar. All rights reserved.
//

#import "PLConfigViewController.h"
#import "PLReadings.h"

@interface PLConfigViewController ()

@end

@implementation PLConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	if(theTextField == self.deviceID) {
        // Change both the settings and the model object
        [[NSUserDefaults standardUserDefaults] setObject:[theTextField text] forKey:@"deviceID"];
        [[PLReadings sharedInstance] setDeviceID:[theTextField text]];
        return YES;
    }
	return YES;
}
@end
