//
//  THCViewController.m
//  Calculator
//
//  Created by PAUL YORDE on 1/16/14.
//  Copyright (c) 2014 paulyorde.biz. All rights reserved.
//

#import "THCViewController.h"

@interface THCViewController ()

@end

@implementation THCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    // init valueString from .h declaration
    valueString = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tappedClear:(id)sender
{
    
    // reset values to default values
    total = 0;
    valueString = @"";
    label.text = @"0";
    
}
-(IBAction)tappedNumber:(UIButton*)btn
{
    int num = btn.tag;
    if (num == 0 && total == 0) {
        return;
    }
    if (lastButtonWasMode) {
        lastButtonWasMode = NO;
        valueString = @"";
    }
    // convert number into string // create method variable of type NSString / complex pointer*
    // set = to the tag setup for the btn pressed
    NSString *numAsString = [NSString stringWithFormat:@"%i", num];
    // add to numAsString to valueString by appending
    valueString = [valueString stringByAppendingString:numAsString];
    // ns number formatter
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    label.text = [formatter stringFromNumber:n];
    // put valueString inside label
    
    // check for 0
    if (total == 0) {
        total = [valueString intValue];
    }
}
-(IBAction)tappedPlus:(id)sender
{
    [self setMode:1];
}
-(IBAction)tappedEquals:(id)sender
{
    if (mode == 0) {
        return;
    }
    if (mode == 1) {
        total += [valueString intValue];
    }
  
    valueString = [NSString stringWithFormat:@"%i",total];
    // ns number formatter
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    label.text = [formatter stringFromNumber:n];
    mode = 0;
}

-(void)setMode:(int)m
{
    if (total == 0) {
        return;
    }
    mode = m;
    lastButtonWasMode = YES;
    total = [valueString intValue];
    
}

@end
