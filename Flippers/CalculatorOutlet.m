//
//  CalculatorOutlet.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOutlet.h"

@implementation CalculatorOutlet

const float GUTTER = 1.0f;
const float HEIGHT = ((300 - (GUTTER * 2)) / 3);

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView
{
    self = [super init];
    if (self) {
        self.parentView = parentView;
        self.state = state;
        int w = parentView.cellSize - GUTTER;
        self.frame = CGRectMake((col * w) + (col * GUTTER), (row * HEIGHT) + (row * GUTTER), w, HEIGHT);
        self.backgroundColor = [self colorForState:self.state];
    }
    return self;
}

- (UIColor *)colorForState:(bool)state
{
    return [UIColor blackColor]; // ;)
}

@end
