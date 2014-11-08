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
#import "SRCChocolateRainWidgetView.h"
#import "SRCChocolateRainCounterWidget.h"
#import "SRCChocolateRainDropView.h"
#import "SRCGlobalHelperFunctions.h"

@interface SRCChocolateRainViewController : UIViewController <UIGestureRecognizerDelegate,SPZChocolateRainWidgetDelegate>

@property (nonatomic,weak) IBOutlet SRCChocolateRainWidgetView *_mSRCChocolateRainWidgetView;
@property (nonatomic,weak) IBOutlet UIView *_mOptionsView;
@property (nonatomic,weak) IBOutlet SRCChocolateRainCounterWidget *_mSRCChocolateRainCounterWidget;
@property (nonatomic,weak) IBOutlet UIView *_mBackgroundView;
@property (nonatomic,weak) IBOutlet UIButton *_mBackbutton;

@property (nonatomic,assign) CGRect _mSRCChocolateRainWidgetViewBeginRect;
@property (nonatomic,assign) CGRect _mOptionsViewBeginRect;
@property (nonatomic,assign) CGRect _mSRCChocolateRainCounterWidgetBeginRect;
@property (nonatomic,assign) CGRect _mBackbuttonBeginRect;

@property (nonatomic,assign) CGRect _mSRCChocolateRainWidgetViewEndRect;
@property (nonatomic,assign) CGRect _mOptionsViewEndRect;
@property (nonatomic,assign) CGRect _mSRCChocolateRainCounterWidgetEndRect;
@property (nonatomic,assign) CGRect _mBackbuttonEndRect;

@property (nonatomic,strong) NSTimer *_mTimer;

// Counters
@property (nonatomic,assign) int _mChocoCounter;

@end
