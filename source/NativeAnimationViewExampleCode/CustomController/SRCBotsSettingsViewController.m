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
#import "SRCBotsSettingsViewController.h"

@interface SRCBotsSettingsViewController ()

@end

@implementation SRCBotsSettingsViewController

#pragma mark Standard Functions
/*=====================================
 * initWithNibName
 * ------------------------------------
 * 1.) Standard initWithNibName
 * ------------------------------------
 *=====================================*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*=====================================
 * viewDidLoad
 * ------------------------------------
 * 1.) Standard viewDidLoad
 * ------------------------------------
 *=====================================*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Change Font To Custom
    [self._mTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:25]];
    
    // Section Title Labels
    [self._mNickNameTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    [self._mColorTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    [self._mSoundTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    [self._mVibrationTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    [self._mThemeTitleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    
    // Setion Main Labels
    [self._mNickNameLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:35]];
    [self._mSoundLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:35]];
    [self._mVibrationLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:35]];
    [self._mThemeLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:35]];
}

/*=====================================
 * viewDidAppear
 * ------------------------------------
 * 1.) Standard viewDidAppear
 * ------------------------------------
 *=====================================*/
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //Initial Setup And Animation
    [self initialViewLayoutSetup];
    [self onEnterAnimations];
}

/*=====================================
 * didReceiveMemoryWarning
 * ------------------------------------
 * 1.) Standard didReceiveMemoryWarning
 * ------------------------------------
 *=====================================*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*=====================================
 * viewDidLayoutSubviews
 * ------------------------------------
 * 1.) Standard viewDidLayoutSubviews
 * ------------------------------------
 *=====================================*/
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Initial View Setup
}

#pragma mark Initialize
/*=====================================
 * initialViewLayoutSetup
 * ------------------------------------
 * 1.) Standard initialViewLayoutSetup
 * ------------------------------------
 *=====================================*/
- (void) initialViewLayoutSetup {
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    // Settings Label
    [self._mTitleLabel setFrame:CGRectMake(self._mTitleLabel.frame.origin.x,
                                           self._mTitleLabel.frame.origin.y - 200,
                                           self._mTitleLabel.frame.size.width,
                                           self._mTitleLabel.frame.size.height)];
    
    // Back Button
    [self._mBackButton setFrame:CGRectMake(self._mBackButton.frame.origin.x - 100,
                                           self._mBackButton.frame.origin.y,
                                           self._mBackButton.frame.size.width,
                                           self._mBackButton.frame.size.height)];
    
    // Save Button
    [self._mSaveButton setFrame:CGRectMake(self._mSaveButton.frame.origin.x,
                                           self._mSaveButton.frame.origin.y + 300,
                                           self._mSaveButton.frame.size.width,
                                           self._mSaveButton.frame.size.height)];
    
    // Borders
    [self._mTopBorder setFrame:CGRectMake(mScreenRect.size.width/2 - 1, self._mTopBorder.frame.origin.y, 2, self._mTopBorder.frame.size.height)];
    [self._mBottomBorder setFrame:CGRectMake(mScreenRect.size.width/2 - 1, self._mBottomBorder.frame.origin.y, 2, self._mBottomBorder.frame.size.height)];
    
    // Setup Views
    [self._mNickNameSectionView setFrame:CGRectMake(self._mNickNameSectionView.frame.origin.x + mScreenRect.size.width,
                                                    self._mNickNameSectionView.frame.origin.y,
                                                    self._mNickNameSectionView.frame.size.width,
                                                    self._mNickNameSectionView.frame.size.height)];
    [self._mColorSectionView setFrame:CGRectMake(self._mColorSectionView.frame.origin.x + mScreenRect.size.width,
                                                 self._mColorSectionView.frame.origin.y,
                                                 self._mColorSectionView.frame.size.width,
                                                 self._mColorSectionView.frame.size.height)];
    [self._mSoundVibSectionView setFrame:CGRectMake(self._mSoundVibSectionView.frame.origin.x + mScreenRect.size.width,
                                                    self._mSoundVibSectionView.frame.origin.y,
                                                    self._mSoundVibSectionView.frame.size.width,
                                                    self._mSoundVibSectionView.frame.size.height)];
    [self._mThemeSectionView setFrame:CGRectMake(self._mThemeSectionView.frame.origin.x + mScreenRect.size.width,
                                                 self._mThemeSectionView.frame.origin.y,
                                                 self._mThemeSectionView.frame.size.width,
                                                 self._mThemeSectionView.frame.size.height)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Button Press
/*================================
 * onButtonPress
 * -------------------------------
 * 1.) Pop View Controller
 * -------------------------------
 *================================*/
- (IBAction)onButtonPress:(id)sender {
    [self onExitAnimations:^{
        [self.navigationController popViewControllerAnimated:NO];
    }];
}

#pragma mark Screen Animations
/*================================
 * onEnterAnimations
 * -------------------------------
 * 1.) Run Animation When Screen
 * Enters View
 * -------------------------------
 *================================*/
- (void) onEnterAnimations {
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    // Settings Title
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTitleLabel setFrame:CGRectMake(self._mTitleLabel.frame.origin.x,
                                                                20,
                                                                self._mTitleLabel.frame.size.width,
                                                                self._mTitleLabel.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Back Button
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self._mBackButton setFrame:CGRectMake(5,
                                                                self._mBackButton.frame.origin.y,
                                                                self._mBackButton.frame.size.width,
                                                                self._mBackButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Save Button
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self._mSaveButton setFrame:CGRectMake(self._mSaveButton.frame.origin.x,
                                                                mScreenRect.size.height - 56,
                                                                self._mSaveButton.frame.size.width,
                                                                self._mSaveButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Borders
    [UIView animateWithDuration:0.5 animations:^{
        [self._mTopBorder setFrame:CGRectMake(30, self._mTopBorder.frame.origin.y, mScreenRect.size.width - 60, self._mTopBorder.frame.size.height)];
        [self._mBottomBorder setFrame:CGRectMake(0, self._mBottomBorder.frame.origin.y, mScreenRect.size.width, self._mBottomBorder.frame.size.height)];
    } completion:^(BOOL finished) {
    }];
    
    // NickName Section
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mNickNameSectionView setFrame:CGRectMake(16,
                                                                         self._mNickNameSectionView.frame.origin.y,
                                                                         self._mNickNameSectionView.frame.size.width,
                                                                         self._mNickNameSectionView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Color Section
    [UIView animateWithDuration:0.5
                          delay:0.1
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mColorSectionView setFrame:CGRectMake(16,
                                                                      self._mColorSectionView.frame.origin.y,
                                                                      self._mColorSectionView.frame.size.width,
                                                                      self._mColorSectionView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // SoundVib Section
    [UIView animateWithDuration:0.5
                          delay:0.2
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mSoundVibSectionView setFrame:CGRectMake(16,
                                                                         self._mSoundVibSectionView.frame.origin.y,
                                                                         self._mSoundVibSectionView.frame.size.width,
                                                                         self._mSoundVibSectionView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Theme Section
    [UIView animateWithDuration:0.5
                          delay:0.3
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mThemeSectionView setFrame:CGRectMake(16,
                                                                      self._mThemeSectionView.frame.origin.y,
                                                                      self._mThemeSectionView.frame.size.width,
                                                                      self._mThemeSectionView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
}

/*================================
 * onExitAnimations
 * -------------------------------
 * 1.) Run Animation When Screen
 * Exits View
 * -------------------------------
 *================================*/
- (void) onExitAnimations:(void (^)(void))completion {
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    // Buttons And Title
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTitleLabel setFrame:CGRectMake(self._mTitleLabel.frame.origin.x,
                                                                         self._mTitleLabel.frame.origin.y - 200,
                                                                         self._mTitleLabel.frame.size.width,
                                                                         self._mTitleLabel.frame.size.height)];
                         [self._mBackButton setFrame:CGRectMake(self._mBackButton.frame.origin.x - 100,
                                                                self._mBackButton.frame.origin.y,
                                                                self._mBackButton.frame.size.width,
                                                                self._mBackButton.frame.size.height)];
                         [self._mSaveButton setFrame:CGRectMake(self._mSaveButton.frame.origin.x,
                                                                self._mSaveButton.frame.origin.y + 300,
                                                                self._mSaveButton.frame.size.width,
                                                                self._mSaveButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Borders
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTopBorder setFrame:CGRectMake(mScreenRect.size.width/2 - 1,
                                                               self._mTopBorder.frame.origin.y,
                                                               2,
                                                               self._mTopBorder.frame.size.height)];
                         [self._mBottomBorder setFrame:CGRectMake(mScreenRect.size.width/2 - 1,
                                                                  self._mBottomBorder.frame.origin.y,
                                                                  2,
                                                                  self._mBottomBorder.frame.size.height)];
                     } completion:^(BOOL finished) {
                     }];
    
    // Sections
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mNickNameSectionView setFrame:CGRectMake(self._mNickNameSectionView.frame.origin.x + mScreenRect.size.width,
                                                                         self._mNickNameSectionView.frame.origin.y,
                                                                         self._mNickNameSectionView.frame.size.width,
                                                                         self._mNickNameSectionView.frame.size.height)];
                         [self._mColorSectionView setFrame:CGRectMake(self._mColorSectionView.frame.origin.x + mScreenRect.size.width,
                                                                      self._mColorSectionView.frame.origin.y,
                                                                      self._mColorSectionView.frame.size.width,
                                                                      self._mColorSectionView.frame.size.height)];
                         [self._mSoundVibSectionView setFrame:CGRectMake(self._mSoundVibSectionView.frame.origin.x + mScreenRect.size.width,
                                                                         self._mSoundVibSectionView.frame.origin.y,
                                                                         self._mSoundVibSectionView.frame.size.width,
                                                                         self._mSoundVibSectionView.frame.size.height)];
                         [self._mThemeSectionView setFrame:CGRectMake(self._mThemeSectionView.frame.origin.x + mScreenRect.size.width,
                                                                      self._mThemeSectionView.frame.origin.y,
                                                                      self._mThemeSectionView.frame.size.width,
                                                                      self._mThemeSectionView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         completion();
                     }];
}

#pragma mark Status Bar
/*==========================================
 * prefersStatusBarHidden
 * -----------------------------------------
 * Hide Status Bar
 * -----------------------------------------
 *==========================================*/
- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
