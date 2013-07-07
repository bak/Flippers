//
//  CalculatorToggle.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/29/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorToggle.h"

@implementation CalculatorToggle

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView
{
    self = [super init:state ForRow:row andColumn:col in:parentView];
    if (self) {
        [self setUpTapRecognizer];
    }
    return self;
}

- (void)tapReceived:(UITapGestureRecognizer *)sender
{
    // ;)
}

- (void)setUpTapRecognizer
{
    UIGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived:)];
    [self addGestureRecognizer:recognizer];
}

- (UIColor *)colorForState:(bool)state
{
    return [UIColor blackColor]; // ;)
}

@end
