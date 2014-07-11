//
//  ViewController.m
//  ColumnSeries
//
//  Copyright 2012 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ViewController.h"
#import "TrafficLightColumnSeries.h"
#import <ShinobiCharts/ShinobiCharts.h>

@interface ViewController () <SChartDatasource>

@end

@implementation ViewController
{
    NSDictionary* _sales;
    ShinobiChart* _chart;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sales = @{@"Broccoli" : @5.65, @"Carrots" : @12.6, @"Mushrooms" : @8.4, @"Okra" : @0.6};
	
    // Create the chart
    CGFloat margin = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 10.0 : 50.0;
    _chart = [[ShinobiChart alloc] initWithFrame:CGRectInset(self.view.bounds, margin, margin)];
    _chart.title = @"Grocery Sales Figures";
    
    _chart.autoresizingMask =  ~UIViewAutoresizingNone;
    
    _chart.licenseKey = @""; // TODO: add your trial licence key here!
    
    // add a pair of axes
    SChartCategoryAxis *xAxis = [[SChartCategoryAxis alloc] init];
    xAxis.style.interSeriesPadding = @0;
    _chart.xAxis = xAxis;
    
    SChartAxis *yAxis = [[SChartNumberAxis alloc] init];
    yAxis.title = @"Sales (1000s)";
    yAxis.rangePaddingHigh = @1.0;
    _chart.yAxis = yAxis;
    
    
    // add to the view
    [self.view addSubview:_chart];
    
    _chart.datasource = self;
    
    self.view.backgroundColor = _chart.backgroundColor;
}

#pragma mark - SChartDatasource methods

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 1;
}

-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
    TrafficLightColumnSeries *columnSeries = [TrafficLightColumnSeries new];
    columnSeries.selectionMode = SChartSelectionPoint;
    
    return columnSeries;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    return _sales.allKeys.count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
    NSString* key = _sales.allKeys[dataIndex];
    datapoint.xValue = key;
    datapoint.yValue = _sales[key];
    return datapoint;
}

@end
