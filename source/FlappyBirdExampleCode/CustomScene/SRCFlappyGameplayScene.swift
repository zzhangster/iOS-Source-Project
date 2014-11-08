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

protocol SRCFlappyGameplaySceneDelegate:class {
    func flappyGameplaySceneShowComplete();
    func flappyGameplaySceneHideComplete();
}

class SRCFlappyGameplayScene:SRCBaseScene,SRCFlappyPastryHUDNodeDelegate {
    // Background
    var _mBlackOutSpriteNode:SKSpriteNode!;
    // HUD
    var _mHudNode:SRCFlappyPastryHUDNode!;
    // Delegate
    weak var _mDelegate:SRCFlappyGameplaySceneDelegate?;
    // Screen Size
    var _mScreenSize:CGSize!;
    // Collision Array
    var _mCollisionSpriteNodes:[SRCFlappyCollisionNode]!;
    // Rewards Nodes
    var _mScoringSpriteNodes:[SRCFlappyCollisionNode]!;
    // Pastry Node
    var _mPastryNode:SRCFlappyPastryNode!;
    // Start Level
    var _mStartLevel:Bool!;
    // Spawn Rate
    var _mSpawnObstacleRate:Double!;
    var _mSpawnCurrentSpawnTime:Double!;
    // Time Difference
    var _mCurrentTime:NSTimeInterval!;
    
   /*==========================================
    * init
    * -----------------------------------------
    * Standard init
    * -----------------------------------------
    *==========================================*/
    override init() {
        super.init();
    }
    
   /*==========================================
    * init - NSCoder
    * -----------------------------------------
    * init with NSCoder
    * -----------------------------------------
    *==========================================*/
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
   /*==========================================
    * init - Size
    * -----------------------------------------
    * init with Size
    * -----------------------------------------
    *==========================================*/
    override init(size: CGSize) {
        super.init(size: size);
    }
    
   /*==========================================
    * init - Size And Delegate
    * -----------------------------------------
    * init With Size And Delegate
    * -----------------------------------------
    *==========================================*/
    init(size:CGSize, delegate:SRCFlappyGameplaySceneDelegate) {
        // Super Init
        super.init(size: size);
        
        // Initialize Values
        self._mScreenSize = size;
        
        // Set Delegate
        self._mDelegate = delegate;
        
        // Set Level
        self._mStartLevel = false;
        
        // Level Attributes
        self._mSpawnObstacleRate = 3.0;
        self._mSpawnCurrentSpawnTime = 0.0;
        
        // Add Collision Sprites
        var mBottomCollision:SRCFlappyCollisionNode = SRCFlappyCollisionNode(color: UIColor.whiteColor(), size: CGSizeMake(self._mScreenSize.width, 88));
        mBottomCollision.position = CGPointMake(self._mScreenSize.width/2, 44);
        
        var mTopCollision:SRCFlappyCollisionNode = SRCFlappyCollisionNode(color: UIColor.whiteColor(), size: CGSizeMake(self._mScreenSize.width, 88));
        mTopCollision.position = CGPointMake(self._mScreenSize.width/2, self._mScreenSize.height + 44);
        
        // Add To Map
        self.addChild(mBottomCollision);
        self.addChild(mTopCollision);
        
        // Add To Collision Tracker
        self._mCollisionSpriteNodes = [mBottomCollision,mTopCollision];
        
        self._mScoringSpriteNodes = [];
        
        // Add Background
        self._mBlackOutSpriteNode = SKSpriteNode(color: UIColor(white: 0.0, alpha: 1.0), size: size);
        self._mBlackOutSpriteNode.position = CGPoint(x: size.width/2, y: size.height/2);
        self._mBlackOutSpriteNode.zPosition = 200;
        self.addChild(self._mBlackOutSpriteNode);
        
        // Setup Sections
        self._mPastryNode = SRCFlappyPastryNode(imageNamed: "flappy-pastry-01");
        self._mPastryNode.position = CGPoint(x: 90, y: size.height/2 - 20);
        self._mPastryNode.zPosition = 300;
        self._mPastryNode.startAnimation();
        self.addChild(self._mPastryNode);
        
        // Setup And Add HUD
        self._mHudNode = SRCFlappyPastryHUDNode(size: size, delegate: self);
        self._mHudNode.zPosition = 400;
        self.addChild(self._mHudNode);
        
        // Run All Animations
        self.showSceneAnimation();
    }
    
   /*==========================================
    * update
    * -----------------------------------------
    * Update Function
    * -----------------------------------------
    *==========================================*/
    override func update(currentTime: NSTimeInterval) {
        // Start Level
        if (self._mStartLevel == true) {
            // Update Pastry Node
            self.updateLevel(currentTime - self._mCurrentTime);
        }
        
        // Set Current Time
        self._mCurrentTime = currentTime;
    }
    
   /*==========================================
    * startLevel
    * -----------------------------------------
    * Start Level Function
    * -----------------------------------------
    *==========================================*/
    func startLevel() {
        self._mStartLevel = true;
    }
    
   /*==========================================
    * updateLevel
    * -----------------------------------------
    * Update Level Function
    * -----------------------------------------
    *==========================================*/
    func updateLevel(currentTime: NSTimeInterval) {
        // Update Collision Component Time
        for mEntry in self._mCollisionSpriteNodes {
            mEntry.update(currentTime);
        }
        
        // Update Core Component Time
        for mEntry in self._mScoringSpriteNodes {
            mEntry.update(currentTime);
        }
        
        // Update Pastry Position
        self._mPastryNode.update(currentTime);
        
        // Update Spawn Time
        self._mSpawnCurrentSpawnTime = self._mSpawnCurrentSpawnTime + currentTime;
        
        // Spawn On Time Greater
        if (self._mSpawnCurrentSpawnTime >= self._mSpawnObstacleRate) {
            // Random Opening
            var mRandomHeight:Float = Float(self._mScreenSize.height/2) + Float(self.randomInt(Int(-self._mScreenSize.height/6), max: Int(self._mScreenSize.height/6)));
            
            // Add Top
            var mSRCFlappyCollisionNode:SRCFlappyCollisionNode = SRCFlappyCollisionNode(imageNamed:"wood-barrier-top");
            mSRCFlappyCollisionNode.initialization(CGPointMake(self._mScreenSize.width + 100,CGFloat(mRandomHeight) + 275),velocity:CGVectorMake(-90, 0));
            self._mCollisionSpriteNodes.append(mSRCFlappyCollisionNode);
            self.addChild(mSRCFlappyCollisionNode);
            
            // Add Bottom
            mSRCFlappyCollisionNode = SRCFlappyCollisionNode(imageNamed:"wood-barrier-bottom");
            mSRCFlappyCollisionNode.initialization(CGPointMake(self._mScreenSize.width + 100,CGFloat(mRandomHeight) - 275),velocity:CGVectorMake(-90, 0));
            self._mCollisionSpriteNodes.append(mSRCFlappyCollisionNode);
            self.addChild(mSRCFlappyCollisionNode);
            
            // Add Score Node
            mSRCFlappyCollisionNode = SRCFlappyCollisionNode(color: UIColor.clearColor(), size: CGSizeMake(60, 150));
            mSRCFlappyCollisionNode.initialization(CGPointMake(self._mScreenSize.width + 100,CGFloat(mRandomHeight)),velocity:CGVectorMake(-90, 0));
            self._mScoringSpriteNodes.append(mSRCFlappyCollisionNode);
            self.addChild(mSRCFlappyCollisionNode);
            
            // Reset Spawn Rate
            self._mSpawnCurrentSpawnTime = 0;
        }
        
        // Check Any Collision Or Score Box Out Of Screen
        var mRemoveArray:[Int] = [];
        for (mIndex, mEntry) in enumerate(self._mCollisionSpriteNodes) {
            if (mEntry.x < -200) {
                mEntry.removeFromParent();
                mRemoveArray.insert(mIndex, atIndex: 0);
            }
        }
        
        // Remove Collision Node From Array And Parent
        for mEntry in mRemoveArray {
            self._mCollisionSpriteNodes[mEntry].removeFromParent();
            self._mCollisionSpriteNodes.removeAtIndex(mEntry);
        }
        
        // Check For Any Scoring And Remove Score Items
        for (mIndex, mEntry) in enumerate(self._mScoringSpriteNodes) {
            if (CGRectIntersectsRect(mEntry.frame, self._mPastryNode.frame)) {
                self._mHudNode.updateHUDScoreByInt(1);
                
                // Remove From Parent And Array
                mEntry.removeFromParent();
                self._mScoringSpriteNodes.removeAtIndex(mIndex);
                break;
            }
        }
        
        // Check For Any Collision
        for mEntry in self._mCollisionSpriteNodes {
            if (CGRectIntersectsRect(mEntry.frame, self._mPastryNode.frame)) {
                self.endLevel();
                break;
            }
        }
    }
    
   /*==========================================
    * endLevel
    * -----------------------------------------
    * End Level Function
    * -----------------------------------------
    *==========================================*/
    func endLevel() {
        // End Level Loop
        self._mStartLevel = false;
        
        // Stop Background Parallax
        self.stopBackgroundAnimation();
        
        // Update Pastry KO
        self._mPastryNode.updateVisualToKO();
        
        // Animate Pastry Downward
        var mDuration:Double = 0;
        
        if (self._mPastryNode.position.y < 100) {
            mDuration = 0;
        } else {
            mDuration = (Double(self._mPastryNode.position.y) - 100) / 700.0;
        }
        
        self._mPastryNode.runAction(SKAction.moveTo(CGPointMake(self._mPastryNode.position.x, 100), duration: mDuration));
        
        // Switch To GamePlay HUD
        self._mHudNode.showHUDState(SPZFlappyGamePlayNodeHUDState.ResultHUD,{});
    }
    
   /*==========================================
    * didMoveToView
    * -----------------------------------------
    * Did Move To View
    * -----------------------------------------
    *==========================================*/
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view);
        self.showSceneAnimation();
    }
    
   /*==========================================
    * showSceneAnimation
    * -----------------------------------------
    * Show Scene Animation
    * -----------------------------------------
    *==========================================*/
    override func showSceneAnimation() {
        //Run Intro Black Fade
        self._mBlackOutSpriteNode.runAction(SKAction.fadeAlphaTo(0.0, duration:0.5));
    }
    
   /*==========================================
    * showSceneAnimationComplete
    * -----------------------------------------
    * Completion Hander On Show Complete
    * -----------------------------------------
    *==========================================*/
    override func showSceneAnimationComplete() {
    }
    
   /*==========================================
    * hideSceneAnimation
    * -----------------------------------------
    * Hide Scene Animation
    * -----------------------------------------
    *==========================================*/
    override func hideSceneAnimation() {
        //Blackens Screen
        self._mBlackOutSpriteNode.zPosition = 500;
        self._mBlackOutSpriteNode.runAction(SKAction.fadeAlphaTo(1.0, duration: 1.0, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0));
        
        //Delay Completion Call
        NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: Selector("hideSceneAnimationComplete"), userInfo: nil, repeats: false);
    }
    
   /*==========================================
    * hideSceneAnimationComplete
    * -----------------------------------------
    * Hide Scene Animation Completion Handler
    * -----------------------------------------
    *==========================================*/
    override func hideSceneAnimationComplete() {
        if (self._mDelegate != nil) {
            self._mDelegate?.flappyGameplaySceneHideComplete();
        }
    }

   /*==========================================
    * flappyPastryHUDNodeOnIntroClick
    * -----------------------------------------
    * On Hud Intro Clicked
    * -----------------------------------------
    *==========================================*/
    func flappyPastryHUDNodeOnIntroClick() {
        // Switch To GamePlay HUD
        self._mHudNode.showHUDState(SPZFlappyGamePlayNodeHUDState.GameplayHUD,{});
        
        // Update And Start Level
        self.startLevel();
        self._mPastryNode.updateWithUserTap();
    }
   
   /*==========================================
    * flappyPastryHUDNodeOnGameplayClick
    * -----------------------------------------
    * Hud Tapped On Gameplay Click
    * -----------------------------------------
    *==========================================*/
    func flappyPastryHUDNodeOnGameplayClick() {
        // Update Pastry With Tap
        self._mPastryNode.updateWithUserTap();
    }
    
   /*==========================================
    * flappyPastryHUDNodeOnRetryClick
    * -----------------------------------------
    * Hud Tapped On End Of Game Clicked
    * -----------------------------------------
    *==========================================*/
    func flappyPastryHUDNodeOnRetryClick() {
        self.hideSceneAnimation();
    }
    
   /*==========================================
    * randomInt
    * -----------------------------------------
    * Return Random Int
    * -----------------------------------------
    *==========================================*/
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}