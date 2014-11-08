//////////////////////////////////////////////////////////////////////////////
//  Copyright 2014 Zhiheng Zhang
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//////////////////////////////////////////////////////////////////////////////

#import "SRCChocolateRainWidgetView.h"
#import "SRCChocolateImageView.h"

@implementation SRCChocolateRainWidgetView

#pragma mark Initialize Function
/*================================
 * initWithFrame
 * -------------------------------
 * 1.) Initialize With Frame
 * -------------------------------
 *================================*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*================================
 * initWithCoder
 * -------------------------------
 * 1.) Initialize With NSCoder
 * -------------------------------
 *================================*/
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Add Pan Control
        self._mUITapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:nil];
        [self._mUITapGestureRecognizer setDelegate:self];
        [self addGestureRecognizer:self._mUITapGestureRecognizer];
    }
    return self;
}

#pragma mark Touch Delegates
/*================================
 * touchesBegan
 * -------------------------------
 * 1.) On Touch Began
 * 2.) Set Current Touch Point
 * 3.) Set Initial Touch Point
 * 4.) Set Image Being Swiped
 *     To NO
 * 5.) Set Current Image
 * Highlighted
 * -------------------------------
 *================================*/
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    // Get Touch Point
    self._mCurrentTouchPoint = [[[event allTouches] anyObject] locationInView:self];
    self._mInitialTouchPoint = [[[event allTouches] anyObject] locationInView:self];
    self._mDidSwipe = NO;
    
    // Check If There Is Image Setup Already
    if (self._mSRCChocolateImageView == nil) {
        self._mSRCChocolateImageView = [[SRCChocolateImageView alloc] initWithFrame:CGRectMake(16, 0, 251, 575)];
        [self insertSubview:self._mSRCChocolateImageView aboveSubview:self._mBackgroundImageView];
    }
    
    // Set Highlighted
    [self._mSRCChocolateImageView setHighlighted:YES];
}

/*================================
 * touchesMoved
 * -------------------------------
 * 1.) Swipping Move
 * -------------------------------
 *================================*/
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    CGPoint touchPoint = [[[event allTouches] anyObject] locationInView:self];
    
    // Image Did Swipe
    if (!self._mDidSwipe) {
        if (touchPoint.y - self._mInitialTouchPoint.y <= -50) {
            // Swipe Animation
            if (self._mInitialTouchPoint.x - touchPoint.x > 10) {
                [self._mSRCChocolateImageView startSwipeAnimation:MOVE_DIRECTION_RHGT];
            } else if (self._mInitialTouchPoint.x - touchPoint.x < -10) {
                [self._mSRCChocolateImageView startSwipeAnimation:MOVE_DIRECTION_LEFT];
            } else {
                [self._mSRCChocolateImageView startSwipeAnimation:MOVE_DIRECTION_STRAIGHT];
            }
            
            // Set Image Did Swipe
            self._mDidSwipe = YES;
            
            // Set Current Image To Nil
            self._mSRCChocolateImageView = nil;
            
            //Call Delegate
            if (self._mDelegate != nil) {
                [self._mDelegate chocolateRainWidgetSwipped];
            }
        } else if (touchPoint.y - self._mInitialTouchPoint.y <= 0) {
            // Update Offset
            [self._mSRCChocolateImageView setImageOffset:CGPointMake(touchPoint.x - self._mCurrentTouchPoint.x,
                                                                             touchPoint.y - self._mCurrentTouchPoint.y)];
        }
    }
    
    // Set Current Touch Point
    self._mCurrentTouchPoint = touchPoint;
}

/*================================
 * touchesCancelled
 * -------------------------------
 * 1.) When Touch Cancels Logic
 * -------------------------------
 *================================*/
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self._mDidSwipe) {
        if (self._mSRCChocolateImageView != nil) {
            [self._mSRCChocolateImageView startCancelAnimation];
        }
    }
    NSLog(@"touchesCancelled");
}

/*================================
 * touchesEnded
 * -------------------------------
 * 1.) When Touch Ended Logic
 * -------------------------------
 *================================*/
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self._mDidSwipe) {
        if (self._mSRCChocolateImageView != nil) {
            [self._mSRCChocolateImageView startCancelAnimation];
        }
    }
    NSLog(@"touchesEnded");
}

#pragma mark Set Delegates
- (void) setDelegate:(id<SPZChocolateRainWidgetDelegate>)delegate {
    self._mDelegate = delegate;
}

- (void) removeDelegate {
    self._mDelegate = nil;
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
