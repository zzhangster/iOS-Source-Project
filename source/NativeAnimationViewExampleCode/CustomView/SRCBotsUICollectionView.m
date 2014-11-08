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

#import "SRCBotsUICollectionView.h"
#import "SRCBotsUICollectionViewCell.h"

@implementation SRCBotsUICollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
- (void) onEnterAnimations {
    float delayCount = 0;
    for(SRCBotsUICollectionViewCell *cell in self.visibleCells){
        [cell onEnterAnimations:delayCount];
        delayCount += 0.05;
    }
}

/*================================
 * onExitAnimations
 * -------------------------------
 * 1.) Run Animation When Screen
 * Exits View
 * -------------------------------
 *================================*/
- (void) onExitAnimations {
    for(SRCBotsUICollectionViewCell *cell in self.visibleCells){
        [cell onExitAnimations];
    }
}

@end
