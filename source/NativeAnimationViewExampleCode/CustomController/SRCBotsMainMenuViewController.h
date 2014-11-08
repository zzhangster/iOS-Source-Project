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
#import "SRCBotsUICollectionView.h"
#import "SRCBotsUICollectionViewCell.h"

@interface SRCBotsMainMenuViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *_mTitleImageView;
@property (nonatomic,weak) IBOutlet SRCBotsUICollectionView *_mSPZBotsUICollectionView;
@property (nonatomic,weak) IBOutlet UIView *_mTopBorderView;
@property (nonatomic,weak) IBOutlet UIView *_mBottomBorderView;
@property (nonatomic,weak) IBOutlet UIButton *_mTrophyButton;
@property (nonatomic,weak) IBOutlet UIButton *_mTBotsButton;
@property (nonatomic,weak) IBOutlet UIButton *_mGearButton;
@property (nonatomic,weak) IBOutlet UIButton *_mBackButton;

- (IBAction)pushToSettingsSegue:(id)sender;

@end
