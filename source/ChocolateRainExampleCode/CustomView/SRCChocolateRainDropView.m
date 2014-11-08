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

#import "SRCChocolateRainDropView.h"

@implementation SRCChocolateRainDropView

/*================================
 * initWithFrame
 * -------------------------------
 * 1.) Standard initWithFrame
 * -------------------------------
 *================================*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self._mChocolateRainImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"choco_rain.png"]];
        
        // Add To Self
        [self addSubview:self._mChocolateRainImageView];
    }
    return self;
}

/*================================
 * didMoveToSuperview
 * -------------------------------
 * 1.) Standard didMoveToSuperview
 * -------------------------------
 *================================*/
- (void) didMoveToSuperview {
    [self startEnterAnimation];
}

/*================================
 * startEnterAnimation
 * -------------------------------
 * 1.) Start Animation Enter
 * -------------------------------
 *================================*/
- (void) startEnterAnimation {
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    int mMovementDirection = 0;
    // Movement Direction Setting
    if (arc4random_uniform(2) == 0) {
        mMovementDirection = -1;
    } else {
        mMovementDirection = 1;
    }
    
    // Create Rotation Animation
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * mMovementDirection] ;
    rotationAnimation.duration = 2.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 100;
    [self._mChocolateRainImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // Create Translation
    [UIView animateWithDuration:2.0
                          delay:0.5 + rand()/(float)RAND_MAX * 0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self setFrame:CGRectMake(self.frame.origin.x,
                                                   self.frame.origin.y + mScreenRect.size.height * 1.2,
                                                   self.frame.size.width,
                                                   self.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}

@end
