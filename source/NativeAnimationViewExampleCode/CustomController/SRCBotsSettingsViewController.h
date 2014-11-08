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

@interface SRCBotsSettingsViewController : UIViewController

//Buttons
@property (nonatomic,weak) IBOutlet UIButton *_mBackButton;
@property (nonatomic,weak) IBOutlet UIButton *_mSaveButton;

//Labels
@property (nonatomic,weak) IBOutlet UILabel *_mTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mNickNameTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mNickNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mColorTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mSoundTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mSoundLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mVibrationTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mVibrationLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mThemeTitleLabel;
@property (nonatomic,weak) IBOutlet UILabel *_mThemeLabel;

//Borders
@property (nonatomic,weak) IBOutlet UIView *_mTopBorder;
@property (nonatomic,weak) IBOutlet UIView *_mBottomBorder;

//Sections
@property (nonatomic,weak) IBOutlet UIView *_mNickNameSectionView;
@property (nonatomic,weak) IBOutlet UIView *_mColorSectionView;
@property (nonatomic,weak) IBOutlet UIView *_mSoundVibSectionView;
@property (nonatomic,weak) IBOutlet UIView *_mThemeSectionView;

//Functions
- (IBAction)onButtonPress:(id)sender;

@end
