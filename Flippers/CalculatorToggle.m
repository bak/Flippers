//
//  CalculatorToggle.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/29/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorToggle.h"

@implementation CalculatorToggle

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(id)calculator
{
    self = [super init:state ForRow:row andColumn:col in:calculator];
    if (self) {
        [self setUpTouchAction];
    }
    return self;
}

- (void)tapReceived
{
    // ;)
}

- (void)setUpTouchAction
{
    UIGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived)];
    [self addGestureRecognizer:recognizer];
}

- (UIColor *)colorForState:(bool)state
{
    return [UIColor blackColor]; // ;)
}

@end
