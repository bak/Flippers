//
//  CalculatorOutlet.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOutlet.h"

@implementation CalculatorOutlet

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(id)calculator
{
    self = [super init];
    if (self) {
        self.calculator = calculator;
        self.state = state;
        self.frame = CGRectMake((col * WIDTH) + (col * GUTTER), (row * HEIGHT) + (row * GUTTER), WIDTH, HEIGHT);
        self.backgroundColor = [self colorForState:self.state];
    }
    return self;
}

- (UIColor *)colorForState:(bool)state
{
    return [UIColor blackColor]; // ;)
}


//- (void)drawRect:(CGRect)rect
//{
//}

@end
