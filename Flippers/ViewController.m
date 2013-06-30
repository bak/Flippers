//
//  ViewController.m
//  Flippers
//
//  Created by Ben Cullen-Kerney on 6/27/13.
//  Copyright (c) 2013 beancuke. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@property Calculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.calculator = [[Calculator alloc] init];
    [self.calculator setUp];
    [self layoutCalculatorSubview];
    [self.calculator draw];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutCalculatorSubview
{
    UIView *subview = self.calculator.view;
    [self.view addSubview:subview];
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-10-[subview]-10-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subview)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-10-[subview]-10-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subview)]];
}

@end
