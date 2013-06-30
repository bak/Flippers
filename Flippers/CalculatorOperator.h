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

- (id)init:(NSString *)op ForRow:(int)row andColumn:(int)col in:(id)calculator;

@end
