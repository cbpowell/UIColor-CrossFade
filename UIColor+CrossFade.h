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
//  UIColor+CrossFade.h
//

#import <UIKit/UIKit.h>

@interface UIColor (CrossFade)

/**
 * Fades between firstColor and secondColor at the specified ratio:
 * 
 *    @ ratio 0.0 - fully firstColor
 *    @ ratio 0.5 - halfway between firstColor and secondColor
 *    @ ratio 1.0 - fully secondColor
 *
 */

+ (UIColor *)colorForFadeBetweenFirstColor:(UIColor *)firstColor 
                               secondColor:(UIColor *)secondColor 
                                   atRatio:(CGFloat)ratio;

/**
 * An array of [steps] colors starting with firstColor, continuing with interpolations between firstColor and lastColor, and ending with lastColor.
 */
+ (NSArray *)colorsForFadeBetweenFirstColor:(UIColor *)firstColor
                                lastColor:(UIColor *)lastColor
                                    inSteps:(NSUInteger)steps;

/**
 * Convert UIColor to RGBA colorspace. Used for cross-colorspace interpolation.
 */
+ (UIColor *)colorConvertedToRGBA:(UIColor *)colorToConvert;

@end
