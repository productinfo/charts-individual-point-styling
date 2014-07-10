//
//  PointStyledColumnSeries.m
//  IndividualPointStyling
//
//  Created by Ryan Grey on 10/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import "TrafficLightColumnSeries.h"

@implementation TrafficLightColumnSeries

- (SChartColumnSeriesStyle *)styleForPoint:(id<SChartData>)point {
    
    SChartColumnSeriesStyle *newStyle = [super styleForPoint:point];
    
    if (point.sChartPointIsSelected) {
        //We want to let the superclass have its way if the point is selected.
        return newStyle;
    }
    
    float yValue = [[point sChartYValue] floatValue];
    newStyle.showAreaWithGradient = NO;
    
    if (yValue > 10) {
        newStyle.areaColor = [UIColor greenColor];
    } else if(yValue > 6) {
        newStyle.areaColor = [UIColor orangeColor];
    } else {
        newStyle.areaColor = [UIColor redColor];
    }
    return newStyle;
}

@end
