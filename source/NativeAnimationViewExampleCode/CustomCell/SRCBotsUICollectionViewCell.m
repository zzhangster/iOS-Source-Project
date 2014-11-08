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

#import "SRCBotsUICollectionViewCell.h"

@implementation SRCBotsUICollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) initViewSetup {
    [self._mCollectionImageView setHidden:YES];
    [self._mCollectionLabel setHidden:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/*================================
 * onEnterAnimations
 * -------------------------------
 * 1.) Run Animation When Screen
 * Enters View
 * -------------------------------
 *================================*/
- (void) onEnterAnimations:(float)delay {
    [self setHidden:NO];
    
    [UIView animateWithDuration:0.1
                          delay:delay
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mCollectionImageView setFrame:CGRectMake(42, 42, 1, 1)]; // Set Small First
                     } completion:^(BOOL finished) {
                         [self._mCollectionImageView setHidden:NO];
                         [UIView animateWithDuration:0.5
                                               delay:0
                              usingSpringWithDamping:0.6
                               initialSpringVelocity:0
                                             options:UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              [self._mCollectionImageView setFrame:CGRectMake(2, 1, 84, 84)];
                                          } completion:^(BOOL finished) {
                                          }];
                     }];
    
    
    [self._mCollectionLabel setAlpha:0];
    [self._mCollectionLabel setHidden:NO];
    [UIView animateWithDuration:0.8
                          delay:(delay + 0.5)
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mCollectionLabel setAlpha:1];
                     } completion:^(BOOL finished) {
                     }];
}

/*================================
 * onExitAnimations
 * -------------------------------
 * 1.) Run Animation When Screen
 * Exits View
 * -------------------------------
 *================================*/
- (void) onExitAnimations {
    [self._mCollectionLabel setAlpha:0];
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mCollectionImageView setFrame:CGRectMake(42, 42, 1, 1)];
                     } completion:^(BOOL finished) {
                         [self initViewSetup];
                     }];
}

@end
