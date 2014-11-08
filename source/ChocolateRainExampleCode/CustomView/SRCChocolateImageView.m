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

#import "SRCChocolateImageView.h"

@implementation SRCChocolateImageView

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
        // Get Screen Size
        CGRect mScreenRect = [[UIScreen mainScreen] bounds];
        
        // Initialization code
        self.frame = frame;
        
        // Set Go To Values
        self._mImageViewDefaultLocationRect = frame;
        self._mImageViewSwipeOutLocationRect = CGRectMake(self._mImageViewDefaultLocationRect.origin.x,
                                                              self._mImageViewDefaultLocationRect.origin.y - mScreenRect.size.height - 200,
                                                              self._mImageViewDefaultLocationRect.size.width,
                                                              self._mImageViewDefaultLocationRect.size.height);
        
        // Set Images
        [self setImage:[UIImage imageNamed:@"chocolate-rain-normal"]];
        [self setHighlightedImage:[UIImage imageNamed:@"chocolate-rain-swipe"]];
    }
    return self;
}

#pragma mark Initialize Function
/*================================
 * setImageOffset
 * -------------------------------
 * 1.) Set Image Offset
 * -------------------------------
 *================================*/
- (void)setImageOffset:(CGPoint)difference {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self setFrame:CGRectMake(self.frame.origin.x,
                                                   self.frame.origin.y + difference.y,
                                                   self.frame.size.width,
                                                   self.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
}

#pragma mark Swipe Animation
/*================================
 * startSwipeAnimation
 * -------------------------------
 * 1.) Set Swipe Animation
 * 2.) Can be left, right and
 *     center
 * -------------------------------
 *================================*/
- (void)startSwipeAnimation:(SPZMoveDirection)direction {
    
    // Direction
    switch (direction) {
        case MOVE_DIRECTION_STRAIGHT:
            self._mRotationAngle = 0.0f;
            break;
        case MOVE_DIRECTION_LEFT:
            self._mRotationAngle = 20.0f;
            self._mImageViewSwipeOutLocationRect = CGRectMake(self._mImageViewSwipeOutLocationRect.origin.x + 90.0f,
                                                                  self._mImageViewSwipeOutLocationRect.origin.y,
                                                                  self._mImageViewSwipeOutLocationRect.size.width,
                                                                  self._mImageViewSwipeOutLocationRect.size.height);
            break;
        case MOVE_DIRECTION_RHGT:
            self._mRotationAngle = -20.0f;
            self._mImageViewSwipeOutLocationRect = CGRectMake(self._mImageViewSwipeOutLocationRect.origin.x - 90.0f,
                                                                  self._mImageViewSwipeOutLocationRect.origin.y,
                                                                  self._mImageViewSwipeOutLocationRect.size.width,
                                                                  self._mImageViewSwipeOutLocationRect.size.height);
            break;
        default:
            self._mRotationAngle = 0.0f;
            break;
    }
    
    [UIView animateWithDuration:5.0
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:3
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self setFrame:self._mImageViewSwipeOutLocationRect];
                         [self setTransform:CGAffineTransformConcat(CGAffineTransformMakeRotation((self._mRotationAngle/180.0f)* M_PI),
                                                                    CGAffineTransformMakeScale(0.6f, 0.6f))];
                     }
                     completion:^(BOOL finished){
                         //Remove Super View
                         [self removeFromSuperview];
                     }];
}

/*================================
 * startCancelAnimation
 * -------------------------------
 * 1.) Cancel Animation
 * -------------------------------
 *================================*/
- (void)startCancelAnimation {
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self setFrame:self._mImageViewDefaultLocationRect];
                     }
                     completion:^(BOOL finished){
                         [self setHighlighted:NO];
                     }];
}

@end
