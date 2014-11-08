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

#import "SRCChocolateRainCounterView.h"
#import "SRCChocolateRainCounterSubView.h"

@implementation SRCChocolateRainCounterView

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
}

/*================================
 * updateCounterByNumber
 * -------------------------------
 * 1.) Update Counter By Number
 * -------------------------------
 *================================*/
- (void) updateCounterViewWithNumber:(int)number {
    NSString *mStringNumber = [NSString stringWithFormat:@"%d",number];
    NSMutableArray *mStringLetterArray = [NSMutableArray array];
    NSArray *mSubViews;
    CGRect mTotalFrame;
    
    //Convert String To Array Of Letters
    for (int i = 0; i < [mStringNumber length]; i++) {
        [mStringLetterArray addObject:[mStringNumber substringWithRange:NSMakeRange(i, 1)]];
    }
    
    //Reverse String Of Letters
    mStringLetterArray = [NSMutableArray arrayWithArray:[[mStringLetterArray reverseObjectEnumerator]allObjects]];
    
    //Get Current Subviews
    mSubViews = [self subviews];
    
    //Calculate Total Frame
    mTotalFrame = CGRectMake((self.frame.size.width - [mStringLetterArray count] * 32) / 2,
                             (self.frame.size.height - 51) / 2,
                             [mStringLetterArray count] * 32,
                             51);
    
    //Loop String And Create/Update SubViews
    for (int i = 0; i < [mStringLetterArray count]; i++) {
        SRCChocolateRainCounterSubView *mSRCChocolateRainCounterSubView;
        if ( i + 1 > [mSubViews count]) {
            //Update Existing Subview
            mSRCChocolateRainCounterSubView = [[SRCChocolateRainCounterSubView alloc]initWithFrame:CGRectMake((mTotalFrame.origin.x + mTotalFrame.size.width) - 32 * (i + 1),
                                                                                                              mTotalFrame.origin.y,
                                                                                                              32,
                                                                                                              51)
                                                                                             value:[mStringLetterArray objectAtIndex:i]];
            [self addSubview:mSRCChocolateRainCounterSubView];
        } else {
            //Update Existing SubView Positions
            mSRCChocolateRainCounterSubView = [mSubViews objectAtIndex:i];
            [mSRCChocolateRainCounterSubView updateFrame:CGRectMake((mTotalFrame.origin.x + mTotalFrame.size.width) - 32 * (i + 1),
                                                                    mTotalFrame.origin.y,
                                                                    32,
                                                                    51)];
            [mSRCChocolateRainCounterSubView updateValue:[mStringLetterArray objectAtIndex:i]];
        }
    }
}

#pragma mark Animations
- (void) onEnterAnimations {
    [self updateCounterViewWithNumber:0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
