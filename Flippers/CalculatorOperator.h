//
//  CalculatorOperator.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorToggle.h"

@interface CalculatorOperator : CalculatorToggle

@property NSString *op;

- (id)init:(NSString *)op forRow:(int)row andColumn:(int)col andCurrentOp:(NSString *)currentOp in:(CalculatorView *)parentView;

@end
