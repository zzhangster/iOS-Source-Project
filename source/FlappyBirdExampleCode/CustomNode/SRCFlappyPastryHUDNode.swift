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

import Foundation
import UIKit
import SpriteKit

enum SPZFlappyGamePlayNodeHUDState {
    case IntroHUD
    case GameplayHUD
    case ResultHUD
}

protocol SRCFlappyPastryHUDNodeDelegate:class {
    func flappyPastryHUDNodeOnIntroClick();
    func flappyPastryHUDNodeOnGameplayClick();
    func flappyPastryHUDNodeOnRetryClick();
}

class SRCFlappyPastryHUDNode:SKNode {
    
    //Variables
    var _mHudState:SPZFlappyGamePlayNodeHUDState!;
    var _mScreenSize:CGSize!;
    weak var _mDelegate:SRCFlappyPastryHUDNodeDelegate?;
    
    //Intro Section Variables
    var _mTapToFlappyIntroNode:SKSpriteNode!;
    
    //Gameplay Section Variables
    var _mTapToFlappyCounterNode:SKLabelNode!;
    
    //End Game Variables
    var _mTapToFlappyTryAgainNode:SKSpriteNode!;
    
    //Background
    var _mBackgroundNode:SKSpriteNode!;
    
    //Tracking Counter
    var _mScoreTracking:NSInteger!;

   /*==========================================
    * init
    * -----------------------------------------
    * Standard Init
    * -----------------------------------------
    *==========================================*/
    override init() {
        super.init();
    }
    
   /*==========================================
    * init - NSCoder
    * -----------------------------------------
    * Init With NSCoder
    * -----------------------------------------
    *==========================================*/
    required init?(coder aDecoder: NSCoder) {
        // Super Init
        super.init(coder: aDecoder);
    }
    
   /*==========================================
    * init - Size And Delegate
    * -----------------------------------------
    * init With Size And Delegate
    * -----------------------------------------
    *==========================================*/
    init(size:CGSize, delegate:SRCFlappyPastryHUDNodeDelegate) {
        super.init();
        
        //Set HUD State
        self._mHudState = SPZFlappyGamePlayNodeHUDState.IntroHUD;
        
        self._mBackgroundNode = SKSpriteNode(color: UIColor(white: 1.0, alpha: 1.0), size: size);
        self._mBackgroundNode.position = CGPoint(x: size.width/2, y: size.height/2);
        self._mBackgroundNode.alpha = 0.0;
        self.addChild(self._mBackgroundNode);
        
        //Set Integer
        self._mScoreTracking = 0;
        
        //Set Size
        self._mScreenSize = size;
        
        //Set Delegate
        self._mDelegate = delegate;
        
        //Set User Interaction
        self.userInteractionEnabled = true;
        
        //Intro Section - Set To Neutral
        self._mTapToFlappyIntroNode = SKSpriteNode(imageNamed: "ui-tap-to-flappy");
        self._mTapToFlappyIntroNode.position = CGPoint(x: size.width/2, y: size.height/2 + 20);
        self._mTapToFlappyIntroNode.alpha = 1;
        self.addChild(self._mTapToFlappyIntroNode);
        
        //Gameplay Section - Set To Neutral Position
        self._mTapToFlappyCounterNode = SKLabelNode(fontNamed: "angrybirds-regular");
        self._mTapToFlappyCounterNode.fontSize = 55;
        self._mTapToFlappyCounterNode.text = "\(self._mScoreTracking)";
        self._mTapToFlappyCounterNode.fontColor = UIColor(white: 0.0, alpha: 1.0);
        self._mTapToFlappyCounterNode.position = CGPoint(x: size.width/2, y: size.height + 200);
        self.addChild(self._mTapToFlappyCounterNode);
        
        //Result Section - Set To Neutral Position
        self._mTapToFlappyTryAgainNode = SKSpriteNode(imageNamed: "button-retry-normal");
        self._mTapToFlappyTryAgainNode.position = CGPoint(x: size.width/2, y: -200);
        self._mTapToFlappyTryAgainNode.name = "RetryButtonNode";
        self.addChild(self._mTapToFlappyTryAgainNode);
    }
    
   /*==========================================
    * touchesBegan
    * -----------------------------------------
    * Touch Begain
    * -----------------------------------------
    *==========================================*/
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Get Current State
        var mCurrentState:SPZFlappyGamePlayNodeHUDState = self._mHudState;
        var touch:UITouch = touches.anyObject()! as UITouch;
        var node:SKNode = self.nodeAtPoint(touch.locationInNode(self));
        
        // Switch Statemenet
        switch (mCurrentState) {
        case .IntroHUD:
            self._mDelegate?.flappyPastryHUDNodeOnIntroClick();
        case .GameplayHUD:
            self._mDelegate?.flappyPastryHUDNodeOnGameplayClick();
        case .ResultHUD:
            if (node.name == "RetryButtonNode") {
                self.hideResultState();
                self._mDelegate?.flappyPastryHUDNodeOnRetryClick();
            }
        }
    }
    
   /*==========================================
    * updateHUDScoreByInt
    * -----------------------------------------
    * Update Score
    * -----------------------------------------
    *==========================================*/
    func updateHUDScoreByInt(score: NSInteger) {
        self._mScoreTracking = self._mScoreTracking + score;
        self._mTapToFlappyCounterNode.text = "\(self._mScoreTracking)";
    }
    
   /*==========================================
    * hideCurrentStateAndShowNewState
    * -----------------------------------------
    * Hide Current State And Show New State
    * Also Execute Completion Handler
    * -----------------------------------------
    *==========================================*/
    func showHUDState(state:SPZFlappyGamePlayNodeHUDState,completionHandler:()->()) {
        // Get Current State
        var mCurrentState:SPZFlappyGamePlayNodeHUDState = self._mHudState;
        
        // Actions
        var mShowAction:SKAction;
        var mWaitAction:SKAction;
        var mHideAction:SKAction;
        var mCompletionWaitAction:SKAction;
        
        // Declare Hide Actions
        switch mCurrentState {
        case .IntroHUD:
            mHideAction = SKAction.runBlock(self.hideIntroState);
            mWaitAction = SKAction.waitForDuration(1);
        case .GameplayHUD:
            mHideAction = SKAction.runBlock(self.hideGameplayState);
            mWaitAction = SKAction.waitForDuration(1);
        case .ResultHUD:
            mHideAction = SKAction.runBlock(self.hideResultState);
            mWaitAction = SKAction.waitForDuration(1);
        }
        
        // Declare Show Actions
        switch state {
        case .IntroHUD:
            mShowAction = SKAction.runBlock(self.showIntroState);
            mCompletionWaitAction = SKAction.waitForDuration(1);
        case .GameplayHUD:
            mShowAction = SKAction.runBlock(self.showGameplayState);
            mCompletionWaitAction = SKAction.waitForDuration(1);
        case .ResultHUD:
            mShowAction = SKAction.runBlock(self.showResultState);
            mCompletionWaitAction = SKAction.waitForDuration(1);
        }
        
        // Update HUD State
        self._mHudState = state;
        
        // Perform Sequence
        self.runAction(SKAction.sequence([mHideAction,mWaitAction,mShowAction,mCompletionWaitAction]));
    }
    
   /*==========================================
    * showIntroState
    * -----------------------------------------
    * Show Intro State
    * -----------------------------------------
    *==========================================*/
    func showIntroState() {
        //Run Fade Into
        self._mTapToFlappyIntroNode.runAction(SKAction.fadeAlphaTo(1.0, duration:1.0));
    }
    
   /*==========================================
    * showGameplayState
    * -----------------------------------------
    * Show Gameplay State
    * -----------------------------------------
    *==========================================*/
    func showGameplayState() {
        self._mTapToFlappyCounterNode.runAction(SKAction.moveTo(CGPointMake(self._mScreenSize.width/2,self._mScreenSize.height - 100), duration: 1));
    }
    
   /*==========================================
    * showResultState
    * -----------------------------------------
    * Hide Result State
    * -----------------------------------------
    *==========================================*/
    func showResultState() {
        self._mTapToFlappyTryAgainNode.runAction(SKAction.moveTo(CGPointMake(self._mScreenSize.width/2,200),
            duration: 1.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2));
    }
    
   /*==========================================
    * hideIntroState
    * -----------------------------------------
    * Hide Intro State
    * -----------------------------------------
    *==========================================*/
    func hideIntroState() {
        self._mTapToFlappyIntroNode.runAction(SKAction.fadeAlphaTo(0.0, duration:1.0));
    }
    
   /*==========================================
    * hideGameplayState
    * -----------------------------------------
    * Hide Gameplay State
    * -----------------------------------------
    *==========================================*/
    func hideGameplayState() {
        self._mBackgroundNode.runAction(SKAction.sequence([SKAction.fadeAlphaTo(1.0, duration: 0),SKAction.fadeAlphaTo(0.0, duration: 0.2)]));
        self._mTapToFlappyCounterNode.runAction(SKAction.moveTo(CGPointMake(self._mScreenSize.width/2, self._mScreenSize.height + 200), duration: 1));
    }
    
   /*==========================================
    * hideResultState
    * -----------------------------------------
    * Hide Result State
    * -----------------------------------------
    *==========================================*/
    func hideResultState() {
        self._mTapToFlappyTryAgainNode.runAction(SKAction.moveTo(CGPointMake(self._mScreenSize.width/2,-200), duration: 1));
    }
}