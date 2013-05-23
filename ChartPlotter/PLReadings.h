//
//  PLReadings.h
//  ChartPlotter
//
//  Created by Salil Wadnerkar on 4/27/13.
//  Copyright (c) 2013 Salil Wadnerkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLReadings : NSObject
@property (nonatomic, copy) NSString *deviceID;
-(NSArray *)readings;

+ (PLReadings *) sharedInstance;
@end
