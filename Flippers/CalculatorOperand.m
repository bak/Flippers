//
//  CalculatorOperand.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOperand.h"

@implementation CalculatorOperand

- (id)init:(bool)state ForPosition:(int)pos andRow:(int)row andColumn:(int)col in:(id)calculator
{
    self = [super init:state ForRow:row andColumn:col in:calculator];
    if (self) {
        self.pos = pos;
    }
    return self;
}

- (void)tapReceived
{
    [self.calculator toggleAtPosition:self.pos];
}

- (UIColor *)colorForState:(bool)state
{
    float alpha = state ? 1.0f : 0.25f;
    return [UIColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:alpha];
}

@end
