//
//  CalculatorOutlet.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOutlet.h"

@implementation CalculatorOutlet

const float GUTTER = 2.0f;
const float WIDTH  = ((480 - (GUTTER * 4)) / 5);
const float HEIGHT = ((300 - (GUTTER * 2)) / 3);

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView
{
    self = [super init];
    if (self) {
        self.parentView = parentView;
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

@end
