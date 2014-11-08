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

#import "SRCChocolateRainCounterWidget.h"

@implementation SRCChocolateRainCounterWidget

#pragma mark Update Functions
- (void) updateCounterRate:(int)rate {
    [self._mRateLabel setText:[NSString stringWithFormat:@"%d Cal / Second",rate]];
}

- (void) updateCountBy:(int)increment {
    self._mTotalCalories += increment;
    [self._mCounterView updateCounterViewWithNumber:self._mTotalCalories];
}

#pragma mark On Enter Animations
- (void) onEnterAnimations {
    [self._mCounterView onEnterAnimations];
}

@end
