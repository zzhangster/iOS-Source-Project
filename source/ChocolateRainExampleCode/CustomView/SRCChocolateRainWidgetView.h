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

#import <UIKit/UIKit.h>
#import "SRCChocolateImageView.h"

//SPZChocolateRainWidgetDelegate
@protocol SPZChocolateRainWidgetDelegate;

@interface SRCChocolateRainWidgetView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *_mBackgroundImageView;
@property (nonatomic,strong) SRCChocolateImageView *_mSRCChocolateImageView;
@property (nonatomic,assign) Boolean _mDidSwipe;
@property (nonatomic,assign) CGPoint _mCurrentTouchPoint;
@property (nonatomic,assign) CGPoint _mInitialTouchPoint;
@property (nonatomic,strong) UITapGestureRecognizer *_mUITapGestureRecognizer;
@property (nonatomic,weak) id<SPZChocolateRainWidgetDelegate> _mDelegate;

// Set Delegates Functions
- (void) setDelegate:(id<SPZChocolateRainWidgetDelegate>)delegate;
- (void) removeDelegate;

@end

//SPZChocolateRainWidgetDelegate Interface
@protocol SPZChocolateRainWidgetDelegate <NSObject>

- (void) chocolateRainWidgetSwipped;

@optional

@end
