//
//  CalculatorView.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 7/1/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalculatorView : UIView

@property Calculator *calculator;

- (id)initWithCalculator:(Calculator *)calculator;
- (void)draw;
- (void)toggleAtPosition:(int)pos;
- (void)setOp:(NSString *)op;
- (CGSize)cellSize;

@end
