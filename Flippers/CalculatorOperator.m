//
//  CalculatorOperator.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOperator.h"

@implementation CalculatorOperator

- (id)init:(NSString *)op ForRow:(int)row andColumn:(int)col in:(Calculator *)calculator
{
    // pull out calculator currentOp first to initialize UIView with it
    bool state = false;
    if ([[calculator currentOp] isEqual:op]) {
        state = true;
    }
    
    self = [super init:state ForRow:row andColumn:col in:calculator];
    if (self) {
        self.op = op;
        [self addLabel];
    }
    return self;
}

- (void)tapReceived
{
    [self.calculator setOp:self.op];
}

- (void)addLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, WIDTH, HEIGHT)];
    label.backgroundColor = [UIColor clearColor];
    label.text = self.op;
    label.font = [UIFont boldSystemFontOfSize:20];
    label.textColor = [[UIColor alloc] initWithWhite:1.0f alpha:0.9f];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}

- (UIColor *)colorForState:(bool)state
{
    float alpha = state ? 1.0f : 0.25f;
    return [UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:alpha];
}

@end
