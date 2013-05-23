/**
 * Copyright (c) 2011 Muh Hon Cheng
 * Created by honcheng on 28/4/11.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
 * WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR 
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR 
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author 		Muh Hon Cheng <honcheng@gmail.com>
 * @copyright	2011	Muh Hon Cheng
 * @version
 * 
 */

#import "LineChartViewController.h"
#import "PLReadings.h"

@implementation LineChartViewController

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        self = [self init];
    }
    return self;
}

- (id)init
{
	self = [super init];
	if (self)
	{
		[self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
		[self setTitle:@"BMI Readings"];
		
		_lineChartView = [[PCLineChartView alloc] initWithFrame:CGRectMake(10,10,[self.view bounds].size.width-20,[self.view bounds].size.height-20)];
		[_lineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
		_lineChartView.minValue = 100;
		_lineChartView.maxValue = 600;
		[self.view addSubview:_lineChartView];
        
        PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
        [component setTitle:@"Readings"];
        [component setColour:PCColorOrange];
        [component setShouldLabelValues:NO];

        NSMutableArray *xLabels = [NSMutableArray array];
        NSMutableArray *points = [NSMutableArray array];
        
        NSArray *readings = [[PLReadings sharedInstance] readings];
		for (NSDictionary *point in readings)
		{
            [points addObject:[point objectForKey:@"value"]];
			[xLabels addObject:[point objectForKey:@"created_at"]];
		}
        [component setPoints:points];
        NSMutableArray *components = [NSMutableArray arrayWithObjects:component, nil];
		[_lineChartView setComponents:components];
		[_lineChartView setXLabels:xLabels];
	}
	return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	[self.lineChartView setNeedsDisplay];
    return YES;
}

@end
