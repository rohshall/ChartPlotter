//
//  PLReadings.m
//  ChartPlotter
//
//  Created by Salil Wadnerkar on 4/27/13.
//  Copyright (c) 2013 Salil Wadnerkar. All rights reserved.
//

#import "PLReadings.h"

@implementation PLReadings

+(PLReadings *)sharedInstance
{
    static PLReadings *sharedPLReadings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPLReadings = [[self alloc] init];
    });
    return sharedPLReadings;
}

-(id)init
{
    if (self = [super init]) {
        //_deviceID = @"2012/06/19"
        _deviceID = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"deviceID"];
    }
    return self;
}

-(void)dealloc
{
    // should never get called
}

-(NSArray *)readings
{
    NSMutableString *deviceUrl = [NSMutableString stringWithString:@"http://jreadings-polyglot.rhcloud.com/api/1/devices/"];
    [deviceUrl appendString:_deviceID];
    [deviceUrl appendString:@"/readings"];
    NSURL * url = [NSURL URLWithString:deviceUrl];
    NSError* error = nil;
    NSData *myData = [NSData dataWithContentsOfURL:url
                      options:kNilOptions
                      error:&error];
    if (myData != nil) {
        NSArray *readings = (NSArray *)[NSJSONSerialization JSONObjectWithData:myData
                                                                                options:kNilOptions
                                                                                error:&error];
        return readings;
    }
    return nil;
}

@end
