//
//  CalculatorOutlet.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalculatorOutlet : UIView

@property Calculator *calculator;
@property bool state;

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(id)calculator;

@end

// todo: either get dynamic auto layout working, or limit places and layout w/ arithmetic
extern const float GUTTER;
extern const float WIDTH;
extern const float HEIGHT;