//
//  CalculatorOutlet.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorOutlet.h"

@implementation CalculatorOutlet

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView
{
    self = [super init];
    if (self) {
        self.parentView = parentView;
        self.state = state;
        self.frame = CGRectMake((col * parentView.cellSize.width) + 1, (row * parentView.cellSize.height) + 1, parentView.cellSize.width - 1, parentView.cellSize.height - 1);
        self.backgroundColor = [self colorForState:self.state];
    }
    return self;
}

- (UIColor *)colorForState:(bool)state
{
    return [UIColor blackColor]; // ;)
}

@end
