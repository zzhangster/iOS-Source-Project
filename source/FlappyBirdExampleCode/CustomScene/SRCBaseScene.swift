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

class SRCBaseScene:SKScene {

    //BackGround
    var _mDirtParallax:SKSpriteNode!;
    var _mBushParallax:SKSpriteNode!;
    var _mFenceParrallax:SKSpriteNode!;
    var _mFrontHillParrallax:SKSpriteNode!;
    var _mMiddleHillParrallax:SKSpriteNode!;
    var _mBackHillParrallax:SKSpriteNode!;
    var _mFrontCloudsParrallax:SKSpriteNode!;
    var _mBackCloudsParrallax:SKSpriteNode!;
    var _mSky:SKSpriteNode!;
    
   /*==========================================
    * init
    * -----------------------------------------
    * Init
    * -----------------------------------------
    *==========================================*/
    override init() {
        super.init();
    }
   
   /*==========================================
    * init
    * -----------------------------------------
    * Init With NSCoder
    * -----------------------------------------
    *==========================================*/
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
   /*==========================================
    * init
    * -----------------------------------------
    * Init With Size
    * -----------------------------------------
    *==========================================*/
    override init(size: CGSize)  {
        super.init(size: size);
        
        //Setup Each Sprite Node
        self._mSky = SKSpriteNode(imageNamed: "background-sky");
        self._mSky.size = size;
        self._mSky.position = CGPoint(x: size.width/2, y: size.height/2);
        
        //Setup Dirt
        self._mDirtParallax = SKSpriteNode(imageNamed: "background-dirt");
        self._mDirtParallax.position = CGPoint(x: self._mDirtParallax.size.width/2, y: self._mDirtParallax.size.height/2);
        self._mDirtParallax.zPosition = 100;
        
        //Setup Fence
        self._mFenceParrallax = SKSpriteNode(imageNamed: "background-fence");
        self._mFenceParrallax.position = CGPoint(x: self._mFenceParrallax.size.width/2, y: self._mFenceParrallax.size.height/2 + self._mDirtParallax.size.height - 2);
        
        //Setup Front Hill
        self._mFrontHillParrallax = SKSpriteNode(imageNamed: "background-front-hill");
        self._mFrontHillParrallax.position = CGPoint(x: self._mFrontHillParrallax.size.width/2, y: self._mFrontHillParrallax.size.height/2 + self._mDirtParallax.size.height - 5);
        
        //Setup Middle Hill
        self._mMiddleHillParrallax = SKSpriteNode(imageNamed: "background-center-hill");
        self._mMiddleHillParrallax.position = CGPoint(x: self._mMiddleHillParrallax.size.width/2 - 300, y: self._mMiddleHillParrallax.size.height/2 + self._mDirtParallax.size.height - 55);
        
        //Setup Back Hill
        self._mBackHillParrallax = SKSpriteNode(imageNamed: "background-back-hill");
        self._mBackHillParrallax.position = CGPoint(x: self._mBackHillParrallax.size.width/2 + 400, y: self._mBackHillParrallax.size.height/2 + self._mDirtParallax.size.height - 5);
        
        //Setup Front Clouds
        self._mFrontCloudsParrallax = SKSpriteNode(imageNamed: "background-front-clouds");
        self._mFrontCloudsParrallax.position = CGPoint(x: self._mFrontCloudsParrallax.size.width/2 + 25, y: size.height - 100);
        
        //Setup Back Clouds
        self._mBackCloudsParrallax = SKSpriteNode(imageNamed: "background-back-clouds");
        self._mBackCloudsParrallax.position = CGPoint(x: self._mBackCloudsParrallax.size.width/2 + 150, y: size.height - 200);
        
        //Setup Bush
        self._mBushParallax = SKSpriteNode(imageNamed: "background-brush");
        self._mBushParallax.position = CGPoint(x: self._mBushParallax.size.width/2, y: self._mBushParallax.size.height/2 + self._mDirtParallax.size.height - 5);
        
        //Add Each In Particular Order
        self.addChild(self._mSky);
        self.addChild(self._mBackHillParrallax);
        self.addChild(self._mMiddleHillParrallax);
        self.addChild(self._mFrontHillParrallax);
        self.addChild(self._mBushParallax);
        self.addChild(self._mFenceParrallax);
        self.addChild(self._mBackCloudsParrallax);
        self.addChild(self._mFrontCloudsParrallax);
        self.addChild(self._mDirtParallax);
        
        //======================================
        // Setup Dirt Parallax Movement
        //======================================
        var mMoveAction:SKAction = SKAction.moveByX(-992, y: 0, duration: 8);
        var mResetPositionAction:SKAction = SKAction.moveToX(self._mDirtParallax.size.width/2, duration: 0);
        
        //Create Sequence And Repeat
        var mSequence:SKAction = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mDirtParallax.runAction(mSequence);
        
        //======================================
        // Setup Fence Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-1019, y: 0, duration: 12);
        mResetPositionAction = SKAction.moveToX(self._mFenceParrallax.size.width/2, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mFenceParrallax.runAction(mSequence);
        
        //======================================
        // Setup Bush Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-580, y: 0, duration: 16);
        mResetPositionAction = SKAction.moveToX(self._mBushParallax.size.width/2, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mBushParallax.runAction(mSequence);
        
        //======================================
        // Setup Front Hill Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-671, y: 0, duration: 24);
        mResetPositionAction = SKAction.moveToX(self._mFrontHillParrallax.size.width/2, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mFrontHillParrallax.runAction(mSequence);
        
        //======================================
        // Setup Middile Hill Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-643, y: 0, duration: 34);
        mResetPositionAction = SKAction.moveToX(self._mMiddleHillParrallax.size.width/2 - 300, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mMiddleHillParrallax.runAction(mSequence);
        
        //======================================
        // Setup Back Clouds Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-725, y: 0, duration: 90);
        mResetPositionAction = SKAction.moveToX(self._mBackCloudsParrallax.size.width/2 + 150, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mBackCloudsParrallax.runAction(mSequence);
        
        //======================================
        // Setup Front Clouds Parallax Movement
        //======================================
        mMoveAction = SKAction.moveByX(-678, y: 0, duration: 45);
        mResetPositionAction = SKAction.moveToX(self._mFrontCloudsParrallax.size.width/2 + 25, duration: 0);
        
        //Create Sequence And Repeat
        mSequence = SKAction.sequence([mMoveAction,mResetPositionAction]);
        mSequence = SKAction.repeatActionForever(mSequence);
        
        //Set To Parralax
        self._mFrontCloudsParrallax.runAction(mSequence);
    }
    
    func stopBackgroundAnimation() {
        self._mDirtParallax.removeAllActions();
        self._mBushParallax.removeAllActions();
        self._mFenceParrallax.removeAllActions();
        self._mFrontHillParrallax.removeAllActions();
        self._mMiddleHillParrallax.removeAllActions();
        self._mBackHillParrallax.removeAllActions();
    }

   /*==========================================
    * showSceneAnimation
    * -----------------------------------------
    * Show Scene Animation
    * -----------------------------------------
    *==========================================*/
    func showSceneAnimation() {
        
    }
    
   /*==========================================
    * showSceneAnimationComplete
    * -----------------------------------------
    * Completion Handler From Show
    * -----------------------------------------
    *==========================================*/
    func showSceneAnimationComplete() {
    }
    
   /*==========================================
    * hideNodeAnimation
    * -----------------------------------------
    * Hide Scene Animation
    * -----------------------------------------
    *==========================================*/
    func hideSceneAnimation() {
        
    }
    
   /*==========================================
    * hideSceneAnimationComplete
    * -----------------------------------------
    * Completion Handler From Hide
    * -----------------------------------------
    *==========================================*/
    func hideSceneAnimationComplete() {
    }

}