//
//  CalculatorOutlet.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/30/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorView.h"

@interface CalculatorOutlet : UIView

@property CalculatorView *parentView;
@property bool state;

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView;

@end