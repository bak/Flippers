//
//  CalculatorResult.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorResult.h"

@implementation CalculatorResult

- (UIColor *)colorForState:(bool)state
{
    float alpha = state ? 1.0f : 0.2f;
    return [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:alpha];
}

@end
