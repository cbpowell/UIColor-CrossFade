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

//
//  UIColor+CrossFade.m
//

#import "UIColor+CrossFade.h"

@implementation UIColor (CrossFade)

+ (UIColor *)colorForFadeBetweenFirstColor:(UIColor *)firstColor 
                               secondColor:(UIColor *)secondColor 
                                   atRatio:(CGFloat)ratio {
    
    
    const CGFloat *firstColorComponents = CGColorGetComponents(firstColor.CGColor);
    const CGFloat *secondColorComponents = CGColorGetComponents(secondColor.CGColor);
    CGFloat firstColorAlpha = CGColorGetAlpha(firstColor.CGColor);
    CGFloat secondColorAlpha = CGColorGetAlpha(secondColor.CGColor);
    
    // Red: components[0]
    // Green: components[1]
    // Blue: components[2]
    
    CGFloat newRed = firstColorComponents[0] * (1 - ratio) + secondColorComponents[0] * ratio;
    CGFloat newGreen = firstColorComponents[1] * (1 - ratio) + secondColorComponents[1] * ratio;
    CGFloat newBlue = firstColorComponents[2] * (1 - ratio) + secondColorComponents[2] * ratio;
    CGFloat newAlpha = firstColorAlpha * (1 - ratio) + secondColorAlpha * ratio;
    
    UIColor *newColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
    return newColor;
}
@end
