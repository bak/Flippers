//
//  CalculatorOperand.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "CalculatorToggle.h"

@interface CalculatorOperand : CalculatorToggle

- (id)init:(bool)state ForPosition:(int)pos andRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView;

@end
