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
        _deviceID = @""; // 2012/06/19
    }
    return self;
}

-(void)dealloc
{
    // should never get called
}

-(NSDictionary *)readings
{
    NSMutableString *deviceUrl = [NSMutableString stringWithString:@"http://drtom.ch/posts/"];
    [deviceUrl appendString:_deviceID];
    [deviceUrl appendString:@"/Visualizing_Programming_Language_Popularity_with_D3/so_data.json"];
    NSURL * url = [NSURL URLWithString:deviceUrl];
    NSError* error = nil;
    NSData *myData = [NSData dataWithContentsOfURL:url
                      options:kNilOptions
                      error:&error];
    if (myData != nil) {
        NSDictionary *sampleInfo = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:myData
                                                                                options:kNilOptions
                                                                                error:&error];
        return sampleInfo;
    }
    return nil;
}

@end
