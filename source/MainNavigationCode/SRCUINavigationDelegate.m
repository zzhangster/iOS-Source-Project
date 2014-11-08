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

#import "SRCUINavigationDelegate.h"

@implementation SRCUINavigationDelegate

#pragma mark Init Functions
- (void)awakeFromNib {
    
    //Add View Experiment
    CGRect mViewRect = CGRectMake(0, 0, 20, self._mNavigationController.view.frame.size.height);
    UIView* mSliderOverview = [[UIView alloc] initWithFrame:mViewRect];
    [mSliderOverview setBackgroundColor:[UIColor clearColor]];
    [self._mNavigationController.view addSubview:mSliderOverview];
    
    self._mInteractiveGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleTransitionGesture:)];
    self._mInteractiveGestureRecognizer.delegate = self;
    ((UIScreenEdgePanGestureRecognizer*)self._mInteractiveGestureRecognizer).edges = UIRectEdgeLeft;
    [mSliderOverview addGestureRecognizer:self._mInteractiveGestureRecognizer];
    self._mTransition = [SPZScaleTransition new];
    
}

#pragma mark - UINavigationController Delegates
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    switch (operation) {
        case UINavigationControllerOperationPush: {
            [self._mTransition setToPresentTransition];
            return self._mTransition;
            break;
        }
        case UINavigationControllerOperationPop: {
            [self._mTransition setToDismissTransition];
            return self._mTransition;
            break;
        }
        default:
            break;
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self._mInteractiveTransition;
}

#pragma mark - Percentage Calculation

- (void)handleTransitionGesture:(UIPanGestureRecognizer *)recognizer {
    
    //CGFloat progress = [recognizer translationInView:recognizer.view].x / recognizer.view.frame.size.width;
    
    
    CGFloat progress = [recognizer translationInView:self._mNavigationController.view].x / self._mNavigationController.view.frame.size.width;
    //NSLog(@"Progress: %f , %f",[recognizer translationInView:recognizer.view].x, progress);
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            self._mInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self._mNavigationController popViewControllerAnimated:YES];
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            [self._mInteractiveTransition updateInteractiveTransition:progress];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            if (progress > 0.35)
                [self._mInteractiveTransition finishInteractiveTransition];
            else
                [self._mInteractiveTransition cancelInteractiveTransition];
            break;
        }
            
        default:
            break;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self._mNavigationController.transitionCoordinator isAnimated] || self._mNavigationController.viewControllers.count < 2) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (gestureRecognizer == self._mInteractiveGestureRecognizer) {
        return NO;
    } else {
        return NO;
    }
}

@end
