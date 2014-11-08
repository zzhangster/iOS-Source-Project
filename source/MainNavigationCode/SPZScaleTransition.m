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

#import "SPZScaleTransition.h"

@implementation SPZScaleTransition

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UICollectionViewController *fromVC = (UICollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UICollectionViewController *toVC = (UICollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self._mIsPresent) {
        // Transition Add
        [transitionContext.containerView addSubview:toVC.view];
        
        // Animation Setup
        toVC.view.transform = CGAffineTransformMakeTranslation(toVC.view.frame.size.width,0);
        fromVC.view.alpha = 1.0f;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toVC.view.transform = CGAffineTransformIdentity;
                             fromVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.90, 0.90);
                             fromVC.view.alpha = 0.0f;
                         }
                         completion:^(BOOL finished) {
                             fromVC.view.transform = CGAffineTransformIdentity;
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    } else {
        // Transition Add
        [transitionContext.containerView addSubview:toVC.view];
        [transitionContext.containerView addSubview:fromVC.view];
        
        // Animation Setup
        toVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.90, 0.90);
        toVC.view.alpha = 0.0f;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toVC.view.transform = CGAffineTransformIdentity;
                             toVC.view.alpha = 1.0f;
                             fromVC.view.transform = CGAffineTransformMakeTranslation(toVC.view.frame.size.width,0);
                         }
                         completion:^(BOOL finished) {
                             toVC.view.transform = CGAffineTransformIdentity;
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

@end
