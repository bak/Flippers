//
//  Calculator.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "Calculator.h"
#import "CalculatorOperand.h"
#import "CalculatorResult.h"
#import "CalculatorOperator.h"

@interface Calculator()

@property NSMutableArray *operands;
@property NSMutableArray *result;

@end

@implementation Calculator

- (void)setUp
{
    self.operands = [[NSMutableArray alloc] initWithArray:
                     @[@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO]];
    self.result = [[NSMutableArray alloc] initWithArray:
                     @[@NO,@NO,@NO,@NO]];
    self.currentOp = @"AND";
    [self calculate];
    self.view = [UIView new];
}

- (void)draw
{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self drawOperators];
    [self drawOperands];
    [self drawResult];
}

- (void)drawOperators
{
    [self.view addSubview:[[CalculatorOperator alloc] init:@"AND" ForRow:0 andColumn:[self rowLength] in:self]];
    [self.view addSubview:[[CalculatorOperator alloc] init:@"OR"  ForRow:1 andColumn:[self rowLength] in:self]];
    [self.view addSubview:[[CalculatorOperator alloc] init:@"XOR" ForRow:2 andColumn:[self rowLength] in:self]];
}

- (void)drawOperands
{
    [self.operands enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        int row = (idx < [self rowTwoStartIndex]) ? 0 : 1;
        int col = (idx < [self rowTwoStartIndex]) ? idx : (idx - [self rowTwoStartIndex]);
        [self.view addSubview:[[CalculatorOperand alloc] init:[obj boolValue] ForPosition:idx andRow:row andColumn:col in:self]];
    }];    
}

- (void)drawResult
{
    [self.result enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.view addSubview:[[CalculatorResult alloc] init:[obj boolValue] ForRow:2 andColumn:idx in:self]];
    }];
}

- (void)calculate
{
    [self.operands enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx == [self rowTwoStartIndex]) { *stop = YES; return; }
        id complement = [self.operands objectAtIndex:(idx + [self rowLength])];
        [self.result replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:[self bitwise:[obj boolValue] with:[complement boolValue]]]];
    }];
}

- (void)toggleAtPosition:(int)pos
{
    bool pre = [[self.operands objectAtIndex:pos] boolValue];
    [self.operands replaceObjectAtIndex:pos withObject:[NSNumber numberWithBool:!pre]];
    [self calculate];
    [self draw];
}

- (void)setOp:(NSString *)op
{
    self.currentOp = op;
    [self calculate];
    [self draw];
}

- (bool)bitwise:(bool)a with:(bool)b
{
    if ([self.currentOp isEqual: @"AND"]) {
        return a & b;
    } else if ([self.currentOp isEqual: @"OR"]) {
        return a | b;
    } else if ([self.currentOp isEqual: @"XOR"]) {
        return a ^ b;
    } else {
        return false;
    }
}

- (int)rowTwoStartIndex { return self.operands.count / 2; }
- (int)rowLength { return [self rowTwoStartIndex]; }

@end
