//
//  Calculator.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property UIView *view;
@property NSString *currentOp;

- (void)setUp;
- (void)draw;
- (void)toggleAtPosition:(int)pos;
- (void)setOp:(NSString *)op;

@end
