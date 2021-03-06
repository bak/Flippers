//
//  CalculatorView.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 7/1/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorView.h"
#import "CalculatorOperator.h"
#import "CalculatorOperand.h"
#import "CalculatorResult.h"

@implementation CalculatorView

- (id)initWithCalculator:(Calculator *)calculator
{
    self = [super init];
    if (self) {
        self.calculator = calculator;
        [self setUpSwipes];
    }
    return self;
}

- (CGSize)cellSize
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int w = screenBounds.size.width / (self.calculator.rowLength + 1); // operands plus operator column.
    int h = screenBounds.size.height / 3;
    return CGSizeMake(w, h);
}

- (void)draw
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self drawOperators];
    [self drawOperands];
    [self drawResult];
}

- (void)drawOperators
{
    [self addSubview:[[CalculatorOperator alloc] init:@"&" forRow:0 andColumn:[self.calculator rowLength] andCurrentOp:self.calculator.currentOp in:self]];
    [self addSubview:[[CalculatorOperator alloc] init:@"|"  forRow:1 andColumn:[self.calculator rowLength] andCurrentOp:self.calculator.currentOp in:self]];
    [self addSubview:[[CalculatorOperator alloc] init:@"^" forRow:2 andColumn:[self.calculator rowLength] andCurrentOp:self.calculator.currentOp in:self]];
}

- (void)drawOperands
{
    [self.calculator.operands enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        int row = ((int)idx < [self.calculator rowLength]) ? 0 : 1;
        int col = ((int)idx < [self.calculator rowLength]) ? (int)idx : ((int)idx - [self.calculator rowLength]);
        [self addSubview:[[CalculatorOperand alloc] init:[obj boolValue] ForPosition:(int)idx andRow:row andColumn:col in:self]];
    }];
}

- (void)drawResult
{
    [self.calculator.result enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addSubview:[[CalculatorResult alloc] init:[obj boolValue] ForRow:2 andColumn:(int)idx in:self]];
    }];
}

- (void)toggleAtPosition:(int)pos
{
    bool pre = [[self.calculator.operands objectAtIndex:pos] boolValue];
    [self.calculator.operands replaceObjectAtIndex:pos withObject:[NSNumber numberWithBool:!pre]];
    [self.calculator calculate];
    [self draw];
}

- (void)setOp:(NSString *)op
{
    self.calculator.currentOp = op;
    [self.calculator calculate];
    [self draw];
}

- (void)swipeRightReceived
{
    [self.calculator addPlace];
    [self.calculator calculate];
    [self draw];
}

- (void)swipeLeftReceived
{
    [self.calculator removePlace];
    [self.calculator calculate];
    [self draw];
}

- (void)setUpSwipes
{
    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightReceived)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delaysTouchesBegan = YES;
    [self addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftReceived)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delaysTouchesBegan = YES;
    [self addGestureRecognizer:swipeLeft];
}

@end
