//
//  Calculator.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "Calculator.h"

@interface Calculator()

@end

@implementation Calculator

- (id)init
{
    self = [super init];
    if (self) {
        self.operands = [[NSMutableArray alloc] initWithArray:@[@YES,@NO,@YES,@YES,@YES,@YES,@YES,@NO]];
        self.result = [[NSMutableArray alloc] initWithArray:@[@NO,@NO,@NO,@NO]];
        self.currentOp = @"AND";
        [self calculate];
    }
    return self;
}

- (void)calculate
{
    [self.operands enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx == [self rowLength]) { *stop = YES; return; }
        id complement = [self.operands objectAtIndex:(idx + [self rowLength])];
        [self.result replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:[self bitwise:[obj boolValue] with:[complement boolValue]]]];
    }];
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

- (int)rowLength { return self.operands.count / 2; }

@end
