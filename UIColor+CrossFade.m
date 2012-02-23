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
    
    // Convert to common RGBA colorspace if needed
    if (CGColorGetColorSpace(firstColor.CGColor) != CGColorGetColorSpace(secondColor.CGColor))
    {
        firstColor = [UIColor colorConvertedToRGBA:firstColor];
        secondColor = [UIColor colorConvertedToRGBA:secondColor];
    }
    
    // Grab color components
    const CGFloat *firstColorComponents = CGColorGetComponents(firstColor.CGColor);
    const CGFloat *secondColorComponents = CGColorGetComponents(secondColor.CGColor);
    
    // Interpolate between colors
    CGFloat interpolatedComponents[CGColorGetNumberOfComponents(firstColor.CGColor)] ;
    for (NSUInteger i = 0; i < CGColorGetNumberOfComponents(firstColor.CGColor); i++)
    {
        interpolatedComponents[i] = firstColorComponents[i] * (1 - ratio) + secondColorComponents[i] * ratio;
    }
    
    // Create interpolated color
    CGColorRef interpolatedCGColor = CGColorCreate(CGColorGetColorSpace(firstColor.CGColor), interpolatedComponents);
    UIColor *interpolatedColor = [UIColor colorWithCGColor:interpolatedCGColor];
    CGColorRelease(interpolatedCGColor);
    
    return interpolatedColor;
}

+ (NSArray *)colorsForFadeBetweenFirstColor:(UIColor *)firstColor
                                lastColor:(UIColor *)lastColor
                                    inSteps:(NSUInteger)steps {
    
    // Handle degenerate cases
    if (steps == 0)
        return nil;
    if (steps == 1)
        return [NSArray arrayWithObject:firstColor];
    if (steps == 2)
        return [NSArray arrayWithObjects:firstColor, lastColor, nil];
    
    // Calculate step size
    CGFloat stepSize = 1.0f / (steps - 1);
    
    // Array to store colors in steps
    NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:steps];
    [colors addObject:firstColor];
    
    // Compute intermediate colors
    CGFloat ratio = stepSize;
    for (int i = 2; i < steps; i++)
    {
        [colors addObject:[self colorForFadeBetweenFirstColor:firstColor secondColor:lastColor atRatio:ratio]];
        ratio += stepSize;
    }
    
    [colors addObject:lastColor];
    return colors;
}
                          
+ (UIColor *)colorConvertedToRGBA:(UIColor *)colorToConvert;
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    // Convert color to RGBA with a CGContext. UIColor's getRed:green:blue:alpha: doesn't work across color spaces. Adapted from http://stackoverflow.com/a/4700259

    alpha = CGColorGetAlpha(colorToConvert.CGColor);
    
    CGColorRef opaqueColor = CGColorCreateCopyWithAlpha(colorToConvert.CGColor, 1.0f);
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[CGColorSpaceGetNumberOfComponents(rgbColorSpace)];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, opaqueColor);
    CGColorRelease(opaqueColor);
    CGContextFillRect(context, CGRectMake(0.f, 0.f, 1.f, 1.f));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    red = resultingPixel[0] / 255.0f;
    green = resultingPixel[1] / 255.0f;
    blue = resultingPixel[2] / 255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
