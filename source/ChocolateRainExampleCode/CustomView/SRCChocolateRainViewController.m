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

#import "SRCChocolateRainViewController.h"

@interface SRCChocolateRainViewController ()

@end

@implementation SRCChocolateRainViewController

#pragma mark Standard Function
/*======================================
 * initWithNibName
 * -------------------------------------
 * 1.) Standard initWithNibName
 * -------------------------------------
 *======================================*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*======================================
 * viewDidLoad
 * -------------------------------------
 * 1.) Standard viewDidLoad
 * -------------------------------------
 *======================================*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
}

/*======================================
 * viewDidAppear
 * -------------------------------------
 * 1.) Standard viewDidAppear
 * -------------------------------------
 *======================================*/
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Initial View Setup
    [self initialViewSetup];
    [self onEnterAnimations];
    
}

/*======================================
 * viewWillDisappear
 * -------------------------------------
 * 1.) Standard viewWillDisappear
 * -------------------------------------
 *======================================*/
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self onExitAnimations:^{
        
    }];
}

/*======================================
 * didReceiveMemoryWarning
 * -------------------------------------
 * 1.) Standard didReceiveMemoryWarning
 * -------------------------------------
 *======================================*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*======================================
 * viewDidLayoutSubviews
 * -------------------------------------
 * 1.) Standard viewDidLayoutSubviews
 * -------------------------------------
 *======================================*/
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark Initialize
/*================================
 * initialViewSetup
 * -------------------------------
 * 1.) Initial View Setup
 * -------------------------------
 *================================*/
- (void) initialViewSetup {
    self._mSRCChocolateRainWidgetViewBeginRect = CGRectMake(self._mSRCChocolateRainWidgetView.frame.origin.x,
                                                 self._mSRCChocolateRainWidgetView.frame.origin.y + 600,
                                                 self._mSRCChocolateRainWidgetView.frame.size.width,
                                                 self._mSRCChocolateRainWidgetView.frame.size.height);
    self._mSRCChocolateRainCounterWidgetBeginRect = CGRectMake(self._mSRCChocolateRainCounterWidget.frame.origin.x,
                                                  self._mSRCChocolateRainCounterWidget.frame.origin.y - 140,
                                                  self._mSRCChocolateRainCounterWidget.frame.size.width,
                                                  self._mSRCChocolateRainCounterWidget.frame.size.height);
    self._mOptionsViewBeginRect = CGRectMake(self._mOptionsView.frame.origin.x,
                                             self._mOptionsView.frame.origin.y + 60,
                                             self._mOptionsView.frame.size.width,
                                             self._mOptionsView.frame.size.height);
    self._mBackbuttonBeginRect = CGRectMake(self._mBackbutton.frame.origin.x,
                                            self._mBackbutton.frame.origin.y - 140,
                                            self._mBackbutton.frame.size.width,
                                            self._mBackbutton.frame.size.height);
    
    self._mSRCChocolateRainWidgetViewEndRect = self._mSRCChocolateRainWidgetView.frame;
    self._mSRCChocolateRainCounterWidgetEndRect = self._mSRCChocolateRainCounterWidget.frame;
    self._mOptionsViewEndRect = self._mOptionsView.frame;
    self._mBackbuttonEndRect = self._mBackbutton.frame;
    
    //Set Delegates
    [self._mSRCChocolateRainWidgetView setDelegate:self];
    
    //Start Timer
    [self startTimer];
}

#pragma mark Timed Counters
/*================================
 * startTimer
 * -------------------------------
 * 1.) Start The Timer
 * 2.) If Another Timer Exist
 * Then Quit
 * -------------------------------
 *================================*/
- (void) startTimer {
    NSLog(@"Start Timer");
    if (self._mTimer != nil) {
        [self._mTimer invalidate];
        self._mTimer = nil;
    }
    self._mTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(updateSwipeRate)
                                                  userInfo:nil
                                                   repeats:YES];
}

/*================================
 * updateSwipeRate
 * -------------------------------
 * 1.) Background Color During
 *     Swipe
 * 2.) Also Update Rate Label
 * -------------------------------
 *================================*/
- (void) updateSwipeRate {
    // Update Background Color
    NSString *mBackgroundColorString = @"FFC15F";
    switch (self._mChocoCounter/100) {
        case 0:
            mBackgroundColorString = @"FFC15F";
            break;
        case 1:
            mBackgroundColorString = @"E8AA55";
            break;
        case 2:
            mBackgroundColorString = @"FFB35D";
            break;
        case 3:
            mBackgroundColorString = @"FFB35D";
            break;
        case 4:
            mBackgroundColorString = @"FFA55D";
            break;
        case 5:
            mBackgroundColorString = @"FF9B60";
            break;
        case 6:
            mBackgroundColorString = @"E88556";
            break;
        case 7:
            mBackgroundColorString = @"FF8B5F";
            break;
        case 8:
            mBackgroundColorString = @"E87654";
            break;
        case 9:
            mBackgroundColorString = @"E87654";
            break;
        case 10:
            mBackgroundColorString = @"FF6F61";
            break;
        case 11:
            mBackgroundColorString = @"E85D57";
            break;
        case 12:
            mBackgroundColorString = @"FF5F61";
            break;
        case 13:
            mBackgroundColorString = @"E8556E";
            break;
        case 14:
            mBackgroundColorString = @"FF5F94";
            break;
        case 15:
            mBackgroundColorString = @"FF5F94";
            break;
        default:
            mBackgroundColorString = @"FF5F94";
            break;
    }
    
    //Animate The Background Color
    [UIView animateWithDuration:0.8
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self._mBackgroundView setBackgroundColor:[SRCGlobalHelperFunctions colorWithHexString:mBackgroundColorString
                                                                                                          alpha:1]];
                     }
                     completion:^(BOOL finished){
                     }];
    
    // Update Swipe Rate
    [self._mSRCChocolateRainCounterWidget updateCounterRate:self._mChocoCounter];
    self._mChocoCounter = 0;
}

/*================================
 * stopTimer
 * -------------------------------
 * 1.) Stops Timer
 * -------------------------------
 *================================*/
- (void) stopTimer {
    NSLog(@"Stop Timer");
    if (self._mTimer != nil) {
        [self._mTimer invalidate];
        self._mTimer = nil;
    }
}

#pragma mark SPZChocolateRainWidgetDelegate
/*================================
 * chocolateRainWidgetSwipped
 * -------------------------------
 * 1.) Chocolate Rain Widget
 *     Swipped
 * -------------------------------
 *================================*/
- (void) chocolateRainWidgetSwipped {
    // Get Screen Size
    CGRect mScreenRect = [[UIScreen mainScreen] bounds];
    
    // Update Swipe Counter
    self._mChocoCounter+= 100;
    
    // Update Counter View
    [self._mSRCChocolateRainCounterWidget updateCountBy:100];
    
    //Create Choco Rain
    for (int i = 0; i < 4; i++) {
        SRCChocolateRainDropView *mChocoRain = [[SRCChocolateRainDropView alloc]initWithFrame:CGRectMake(arc4random_uniform(mScreenRect.size.width) - 36,
                                                                                                         -100,
                                                                                                         72,
                                                                                                         93)];
        [self._mBackgroundView insertSubview:mChocoRain atIndex:1000];
    }
}

#pragma mark Button Action
/*================================
 * backButtonPressed
 * -------------------------------
 * 1.) Back Button Pressed
 * -------------------------------
 *================================*/
- (IBAction)backButtonPressed:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
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
    //Inital Section Layout
    [self._mSRCChocolateRainWidgetView setFrame:self._mSRCChocolateRainWidgetViewBeginRect];
    [self._mSRCChocolateRainCounterWidget setFrame:self._mSRCChocolateRainCounterWidgetBeginRect];
    [self._mOptionsView setFrame:self._mOptionsViewBeginRect];
    [self._mBackbutton setFrame:self._mBackbuttonBeginRect];
    
    //Section Animations
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self._mSRCChocolateRainWidgetView setFrame:self._mSRCChocolateRainWidgetViewEndRect];
                         [self._mSRCChocolateRainCounterWidget setFrame:self._mSRCChocolateRainCounterWidgetEndRect];
                         [self._mOptionsView setFrame:self._mOptionsViewEndRect];
                         [self._mBackbutton setFrame:self._mBackbuttonEndRect];
                     }
                     completion:^(BOOL finished){
                         [self._mSRCChocolateRainCounterWidget onEnterAnimations];
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
    //Section Animations
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self._mSRCChocolateRainWidgetView setFrame:self._mSRCChocolateRainWidgetViewBeginRect];
                         [self._mSRCChocolateRainCounterWidget setFrame:self._mSRCChocolateRainCounterWidgetBeginRect];
                         [self._mOptionsView setFrame:self._mOptionsViewBeginRect];
                         [self._mBackbutton setFrame:self._mBackbuttonBeginRect];
                     }
                     completion:^(BOOL finished){
                     }];
}

/*================================
 * dealloc
 * -------------------------------
 * 1.) Stop Tracking Timer
 *     On Dealloc
 * -------------------------------
 *================================*/
- (void) dealloc {
    [self stopTimer];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
