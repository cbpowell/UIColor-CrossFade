/**
 * Copyright (c) 2012 Charles Powell
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

//  CPViewController.h
//  UIColorCrossFadeDemo

#import <UIKit/UIKit.h>
#import "InfColorPicker.h"

@class CPButtonView;

@interface CPViewController : UIViewController <InfColorPickerControllerDelegate>

@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet CPButtonView *buttonA;
@property (nonatomic, strong) IBOutlet CPButtonView *buttonB;
@property (nonatomic, strong) IBOutlet UIView *step1;
@property (nonatomic, strong) IBOutlet UIView *step2;
@property (nonatomic, strong) IBOutlet UIView *step3;
@property (nonatomic, strong) IBOutlet UIView *step4;
@property (nonatomic, strong) IBOutlet UIView *step5;

@property (nonatomic, strong) UIColor *colorA;
@property (nonatomic, strong) UIColor *colorB;

- (IBAction)sliderValueChanged:(id)sender;
- (void)colorViewTapped:(id)sender;

@end
