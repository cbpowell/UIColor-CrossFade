//
//  CPButtonView.m
//  UIColorCrossFadeDemo
//
//  Created by Charles Powell on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPButtonView.h"
#import <QuartzCore/QuartzCore.h>

#import "CPViewController.h"

@implementation CPButtonView

@synthesize viewController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Gesture recognizer
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self addGestureRecognizer:tapRecognizer];
        tapRecognizer.numberOfTapsRequired = 1;
        tapRecognizer = nil;
        
        // Round corners
        self.layer.cornerRadius = 15;
        //self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Gesture recognizer
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self addGestureRecognizer:tapRecognizer];
        tapRecognizer.numberOfTapsRequired = 1;
        tapRecognizer = nil;
        
        // Round corners
        self.layer.cornerRadius = 15;
        self.layer.borderWidth =1.0;
        self.layer.borderColor = [UIColor colorWithWhite:0.228 alpha:1.000].CGColor;

        self.layer.shadowOpacity = 0.5;
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    }
    return self;
}

- (void)handleSingleTap:(UIGestureRecognizer *)sender {
    if (self.viewController) {
        [(CPViewController *) self.viewController colorViewTapped:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
