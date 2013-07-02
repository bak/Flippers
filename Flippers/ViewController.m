//
//  ViewController.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "CalculatorView.h"

@interface ViewController ()

@property Calculator *calculator;
@property CalculatorView *calculatorView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.calculator = [Calculator new];
    self.calculatorView = [[CalculatorView alloc] initWithCalculator:self.calculator];
    [self layoutCalculatorSubview];
    [self.calculatorView draw];
}

- (void)layoutCalculatorSubview
{
// where does this go?

    UIView *subview = self.calculatorView;
    [self.view addSubview:subview];
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[subview]|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subview)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[subview]|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subview)]];
}

@end
