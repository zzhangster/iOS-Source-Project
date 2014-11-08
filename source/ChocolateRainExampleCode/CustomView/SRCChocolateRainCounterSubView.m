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

#import "SRCChocolateRainCounterSubView.h"

@implementation SRCChocolateRainCounterSubView

/*================================
 * initWithFrame
 * -------------------------------
 * 1.) Initialize With Frame
 * -------------------------------
 *================================*/
- (id)initWithFrame:(CGRect)frame value:(NSString*)value
{
    self = [super initWithFrame:CGRectMake(frame.origin.x,
                                           frame.origin.y + 20,
                                           frame.size.width,
                                           frame.size.height)];
    if (self) {
        // Add Label
        UILabel *mUILabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [mUILabel setTextColor:[UIColor whiteColor]];
        [mUILabel setFont:[UIFont fontWithName:@"Avenir-Heavy" size:24]];
        [mUILabel setTextAlignment:NSTextAlignmentCenter];
        [mUILabel setText:value];
        
        // Set And Add To View
        self._mLabel = mUILabel;
        [self addSubview:mUILabel];
        
        // Set Background
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"chocolate-rain-counter-background.png"]]];
        
        // Set Alpha To 0
        [self setAlpha:0.0f];
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
    }
    return self;
}

/*================================
 * didMoveToSuperview
 * -------------------------------
 * 1.) Start Animation On Super
 * View
 * -------------------------------
 *================================*/
- (void) didMoveToSuperview {
    [self startAnimations];
}

#pragma mark Updates
/*================================
 * updateFrame
 * -------------------------------
 * 1.) Update Position Frame
 * -------------------------------
 *================================*/
- (void) updateFrame:(CGRect)frame {
    if (!CGRectEqualToRect(self.frame, frame)) {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self setFrame:frame];
                         }
                         completion:^(BOOL finished){
                         }];
    }
}

/*================================
 * updateValue
 * -------------------------------
 * 1.) Update Text Value
 * -------------------------------
 *================================*/
- (void) updateValue:(NSString *)value {
    [self._mLabel setText:value];
}

#pragma mark Animations
/*================================
 * startAnimations
 * -------------------------------
 * 1.) Run Start Animation
 * -------------------------------
 *================================*/
- (void) startAnimations {
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self setFrame:CGRectMake(self.frame.origin.x,
                                                   self.frame.origin.y - 20,
                                                   self.frame.size.width,
                                                   self.frame.size.height)];
                         [self setAlpha:1.0f];
                     }
                     completion:^(BOOL finished){
                     }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
