//
//  CalculatorToggle.h
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/29/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorOutlet.h"

@interface CalculatorToggle : CalculatorOutlet

@property int pos;

- (id)init:(bool)state ForRow:(int)row andColumn:(int)col in:(CalculatorView *)parentView;
- (void)tapReceived:(UITapGestureRecognizer *)sender;

@end
