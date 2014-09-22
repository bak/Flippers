//
//  Calculator.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (id)init
{
    self = [super init];
    if (self) {
        self.operands = [[NSMutableArray alloc] initWithArray:@[@YES,@NO,@YES,@YES,@YES,@YES,@NO,@YES]];
        self.result = [[NSMutableArray alloc] initWithArray:@[@NO,@NO,@NO,@NO]];
        self.currentOp = @"&";
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
    if ([self.currentOp isEqual: @"&"]) {
        return a & b;
    } else if ([self.currentOp isEqual: @"|"]) {
        return a | b;
    } else if ([self.currentOp isEqual: @"^"]) {
        return a ^ b;
    } else {
        return false;
    }
}

- (void)addPlace
{
    if (self.result.count < 16) {
        [self.operands insertObject:@NO atIndex:[self rowLength]];
        [self.operands insertObject:@NO atIndex:0];
        [self.result insertObject:@NO atIndex:0];
    }
}

- (void)removePlace
{
    if (self.result.count > 1) {
        [self.operands removeObjectAtIndex:[self rowLength]];
        [self.operands removeObjectAtIndex:0];
        [self.result removeObjectAtIndex:0];
    }
}

- (int)rowLength { return self.operands.count / 2.0; }

@end
