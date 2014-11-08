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

#import "SRCMainViewController.h"

@interface SRCMainViewController ()

@end

@implementation SRCMainViewController

/*==================================
 * viewDidLoad
 * ---------------------------------
 * Standard viewDidLoad
 * ---------------------------------
 *==================================*/
- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

/*==================================
 * viewWillAppear
 * ---------------------------------
 * Standard viewWillAppear
 * ---------------------------------
 *==================================*/
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

/*==================================
 * didReceiveMemoryWarning
 * ---------------------------------
 * Standard didReceiveMemoryWarning
 * ---------------------------------
 *==================================*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CollectionView Delegates
/*==================================
 * cellForItemAtIndexPath
 * ---------------------------------
 * The Collection Cell
 * ---------------------------------
 *==================================*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SRCMainViewCollectionViewCell *cell = (SRCMainViewCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"MainMenuCell" forIndexPath:indexPath];
    
    // Cell Customization
    switch (indexPath.row) {
        case 0:
            cell._mIconTextLabel.text = @"Bots";
            cell._mIconImageView.image = [UIImage imageNamed:@"bots_game_icon.png"];
            cell._mPreviewImageView.image = [UIImage imageNamed:@"bots_game_preview.png"];
            break;
        case 1:
            cell._mIconTextLabel.text = @"Chocolate Rain";
            cell._mIconImageView.image = [UIImage imageNamed:@"make_it_rain_icon.png"];
            cell._mPreviewImageView.image = [UIImage imageNamed:@"make_it_rain_preview.png"];
            break;
        case 2:
            cell._mIconTextLabel.text = @"Flappy Pastry";
            cell._mIconImageView.image = [UIImage imageNamed:@"flappy-pastry-icon.png"];
            cell._mPreviewImageView.image = [UIImage imageNamed:@"flappy-pastry-preview.png"];
            break;
        default:
            break;
    }
    
    // Add Corner To Icon
    cell._mIconImageView.layer.cornerRadius = 15.0f;
    cell._mIconImageView.layer.masksToBounds = NO;
    cell._mIconImageView.clipsToBounds = YES;
    
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
    return 3;
}

/*================================
 * didSelectItemAtIndexPath
 * -------------------------------
 * Select Item At Index Path
 * -------------------------------
 *================================*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //Push To View
    [self performSegueWithIdentifier:[NSString stringWithFormat:@"segue_to_mini_app_%ld",(indexPath.row + 1)]
                              sender:self];
}

/*================================
 * scrollViewDidScroll
 * -------------------------------
 * Control Parallax By Content
 * Offset Of Collection View
 * -------------------------------
 *================================*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //Ratio
    float mRatio = 0.3;
    
    //Parallax The Background Image
    self._mBackgroundImageView.transform = CGAffineTransformMakeTranslation(-scrollView.contentOffset.x * mRatio,
                                                                            -scrollView.contentOffset.y * mRatio);
}

#pragma mark Status Bar Style
/*================================
 * preferredStatusBarStyle
 * -------------------------------
 * Set Status Bar Color
 * -------------------------------
 *================================*/
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
