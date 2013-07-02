//
//  Calculator.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property NSString *currentOp;
@property NSMutableArray *operands;
@property NSMutableArray *result;

- (void)calculate;
- (int)rowLength;

@end
