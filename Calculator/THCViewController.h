//
//  THCViewController.h
//  Calculator
//
//  Created by PAUL YORDE on 1/16/14.
//  Copyright (c) 2014 paulyorde.biz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THCViewController : UIViewController
{
    
    int total;
    int mode;
    NSString  *valueString;
    IBOutlet UILabel *label;
    BOOL lastButtonWasMode;
    
}

// access outside of this file / in storyboard
-(IBAction)tappedClear:(id)sender;
-(IBAction)tappedNumber:(UIButton*)btn;
-(IBAction)tappedPlus:(id)sender;
-(IBAction)tappedEquals:(id)sender;

@end
