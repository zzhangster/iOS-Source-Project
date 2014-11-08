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

#import "SRCBotsMainMenuViewController.h"
#import "SRCGlobalHelperFunctions.h"

@interface SRCBotsMainMenuViewController ()

@end

@implementation SRCBotsMainMenuViewController


#pragma mark Standard Functions
/*================================
 * initWithNibName
 * -------------------------------
 * 1.) Setup initWithNibName
 * -------------------------------
 *================================*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*================================
 * viewDidLoad
 * -------------------------------
 * 1.) Setup viewDidLoad
 * -------------------------------
 *================================*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Disable iOS 7 back gesture
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

/*================================
 * viewDidAppear
 * -------------------------------
 * 1.) Setup viewDidAppear
 * -------------------------------
 *================================*/
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Initial View Setup
    [self initialViewSetup];
    [self onEnterAnimations];
}

/*================================
 * viewDidLayoutSubviews
 * -------------------------------
 * 1.) Setup viewDidLayoutSubviews
 * -------------------------------
 *================================*/
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

/*================================
 * didReceiveMemoryWarning
 * -------------------------------
 * 1.) Setup didReceiveMemoryWarning
 * -------------------------------
 *================================*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Initialize
/*================================
 * initialViewSetup
 * -------------------------------
 * 1.) Setup Initial View
 * -------------------------------
 *================================*/
- (void) initialViewSetup {
    
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    //Set Initial Frames
    [self._mTitleImageView setFrame:CGRectMake(self._mTitleImageView.frame.origin.x,
                                               self._mTitleImageView.frame.origin.y - 100,
                                               self._mTitleImageView.frame.size.width,
                                               self._mTitleImageView.frame.size.height)];
    [self._mTopBorderView setFrame:CGRectMake(mScreenRect.size.width/2 - 1,
                                              self._mTopBorderView.frame.origin.y,
                                              2,
                                              self._mTopBorderView.frame.size.height)];
    [self._mBottomBorderView setFrame:CGRectMake(mScreenRect.size.width/2 - 1,
                                                 self._mBottomBorderView.frame.origin.y,
                                                 2,
                                                 self._mBottomBorderView.frame.size.height)];
    
    [self._mBackButton setFrame:CGRectMake(self._mBackButton.frame.origin.x - 100,
                                           self._mBackButton.frame.origin.y,
                                           self._mBackButton.frame.size.width,
                                           self._mBackButton.frame.size.height)];
    [self._mTrophyButton setFrame:CGRectMake(self._mTrophyButton.frame.origin.x,
                                             self._mTrophyButton.frame.origin.y + 200,
                                             self._mTrophyButton.frame.size.width,
                                             self._mTrophyButton.frame.size.height)];
    [self._mTBotsButton setFrame:CGRectMake(self._mTBotsButton.frame.origin.x,
                                             self._mTBotsButton.frame.origin.y + 200,
                                             self._mTBotsButton.frame.size.width,
                                             self._mTBotsButton.frame.size.height)];
    [self._mGearButton setFrame:CGRectMake(self._mGearButton.frame.origin.x,
                                             self._mGearButton.frame.origin.y + 200,
                                             self._mGearButton.frame.size.width,
                                             self._mGearButton.frame.size.height)];
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
    
    //Borders
    [UIView animateWithDuration:0.5 animations:^{
        [self._mTopBorderView setFrame:CGRectMake(40, self._mTopBorderView.frame.origin.y, mScreenRect.size.width - 80, self._mTopBorderView.frame.size.height)];
        [self._mBottomBorderView setFrame:CGRectMake(40, self._mBottomBorderView.frame.origin.y, mScreenRect.size.width - 80, self._mBottomBorderView.frame.size.height)];
    } completion:^(BOOL finished) {
    }];
    
    //Top Title View
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTitleImageView setFrame:CGRectMake(self._mTitleImageView.frame.origin.x,
                                                                    27,
                                                                    self._mTitleImageView.frame.size.width,
                                                                    self._mTitleImageView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    //Back Button
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mBackButton setFrame:CGRectMake(self._mBackButton.frame.origin.x + 100,
                                                                self._mBackButton.frame.origin.y,
                                                                self._mBackButton.frame.size.width,
                                                                self._mBackButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    //Bottom Buttons
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTrophyButton setFrame:CGRectMake(self._mTrophyButton.frame.origin.x,
                                                                  mScreenRect.size.height - 55,
                                                                  self._mTrophyButton.frame.size.width,
                                                                  self._mTrophyButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:0.1
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTBotsButton setFrame:CGRectMake(self._mTBotsButton.frame.origin.x,
                                                                 mScreenRect.size.height - 55,
                                                                 self._mTBotsButton.frame.size.width,
                                                                 self._mTBotsButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:0.2
         usingSpringWithDamping:0.8
          initialSpringVelocity:14
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mGearButton setFrame:CGRectMake(self._mGearButton.frame.origin.x,
                                                                mScreenRect.size.height - 55,
                                                                self._mGearButton.frame.size.width,
                                                                self._mGearButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    //Collection View Scroll
    [self._mSPZBotsUICollectionView onEnterAnimations];
    
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
    
    //Title Image
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTitleImageView setFrame:CGRectMake(self._mTitleImageView.frame.origin.x,
                                                                    self._mTitleImageView.frame.origin.y - 100,
                                                                    self._mTitleImageView.frame.size.width,
                                                                    self._mTitleImageView.frame.size.height)];
                     } completion:^(BOOL finished) {
                     }];
    
    //Back Button
    [UIView animateWithDuration:0.1
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mBackButton setFrame:CGRectMake(self._mBackButton.frame.origin.x - 100,
                                                                self._mBackButton.frame.origin.y,
                                                                self._mBackButton.frame.size.width,
                                                                self._mBackButton.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                     }];
    
    //Borders
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTopBorderView setFrame:CGRectMake(mScreenRect.size.width/2 - 1, self._mTopBorderView.frame.origin.y, 2, self._mTopBorderView.frame.size.height)];
                         [self._mBottomBorderView setFrame:CGRectMake(mScreenRect.size.width/2 - 1, self._mBottomBorderView.frame.origin.y, 2, self._mBottomBorderView.frame.size.height)];
                     } completion:^(BOOL finished) {
                     }];
    //Center Entries
    [self._mSPZBotsUICollectionView onExitAnimations];
    
    //Bottom Buttons
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self._mTrophyButton setFrame:CGRectMake(self._mTrophyButton.frame.origin.x,
                                                                  self._mTrophyButton.frame.origin.y + 200,
                                                                  self._mTrophyButton.frame.size.width,
                                                                  self._mTrophyButton.frame.size.height)];
                         [self._mTBotsButton setFrame:CGRectMake(self._mTBotsButton.frame.origin.x,
                                                                  self._mTBotsButton.frame.origin.y + 200,
                                                                  self._mTBotsButton.frame.size.width,
                                                                  self._mTBotsButton.frame.size.height)];
                         [self._mGearButton setFrame:CGRectMake(self._mGearButton.frame.origin.x,
                                                                  self._mGearButton.frame.origin.y + 200,
                                                                  self._mGearButton.frame.size.width,
                                                                  self._mGearButton.frame.size.height)];
                         
                     } completion:^(BOOL finished) {
                         completion();
                     }];
}

#pragma mark Enable/Disable Screens
/*================================
 * enableScreen
 * -------------------------------
 * 1.) Enable Touch Screen
 * -------------------------------
 *================================*/
- (void) enableScreen {
    [self.view setUserInteractionEnabled:YES];
}

/*================================
 * disableScreen
 * -------------------------------
 * 1.) Disable Touch Screen
 * -------------------------------
 *================================*/
- (void) disableScreen {
    [self.view setUserInteractionEnabled:NO];
}

#pragma mark CollectionView Delegates
/*==================================
 * cellForItemAtIndexPath
 * ---------------------------------
 * The Collection Cell
 * ---------------------------------
 *==================================*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SRCBotsUICollectionViewCell *cell = (SRCBotsUICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SRCBotsUICollectionViewCell" forIndexPath:indexPath];
    [cell initViewSetup];
    
    // cell customization
    switch (indexPath.row) {
        case 0:
            cell._mCollectionLabel.text = @"Smile";
            [cell._mCollectionLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:16]];
            cell._mCollectionImageView.image = [UIImage imageNamed:@"button_smile.png"];
            break;
        case 1:
            cell._mCollectionLabel.text = @"Shock";
            [cell._mCollectionLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:16]];
            cell._mCollectionImageView.image = [UIImage imageNamed:@"button_shock.png"];
            break;
        case 2:
            cell._mCollectionLabel.text = @"Cringe";
            [cell._mCollectionLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:16]];
            cell._mCollectionImageView.image = [UIImage imageNamed:@"button_cringe.png"];
            break;
        case 3:
            cell._mCollectionLabel.text = @"Happy";
            [cell._mCollectionLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:16]];
            cell._mCollectionImageView.image = [UIImage imageNamed:@"button_happy.png"];
            break;
        default:
            break;
    }
    
    return cell;
}

/*==================================
 * numberOfSectionsInCollectionView
 * ---------------------------------
 * Number Of Sections
 * ---------------------------------
 *==================================*/
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/*================================
 * numberOfItemsInSection
 * -------------------------------
 * How many items in Section
 * -------------------------------
 *================================*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

/*================================
 * didSelectItemAtIndexPath
 * -------------------------------
 * Select Item At Index Path
 * -------------------------------
 *================================*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //Push To View
    [self onExitAnimations:^{
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SRCBotsSettingsViewController"]
                                             animated:NO];
    }];
}

#pragma mark Back Button Press
/*================================
 * popToMainMenu
 * -------------------------------
 * Back Button To Pop View
 * -------------------------------
 *================================*/
- (IBAction)popToMainMenu:(id)sender {
    [self onExitAnimations:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

/*================================
 * pushToSettingsSegue
 * -------------------------------
 * Move To Settings View
 * -------------------------------
 *================================*/
#pragma mark Page Transition To Settings
- (IBAction)pushToSettingsSegue:(id)sender {
    [self onExitAnimations:^{
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SRCBotsSettingsViewController"]
                                             animated:NO];
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
