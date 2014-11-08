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

protocol SRCFlappyIntroSceneDelegate:class {
    func flappyIntroSceneShowComplete();
    func flappyIntroSceneHideComplete();
}

class SRCFlappyIntroScene:SRCBaseScene {
    
    //Interactive Object
    var _mLogoSpriteNode:SKSpriteNode!;
    var _mPlayButtonNode:SKSpriteNode!;
    var _mMockPastrySpriteNode:SKSpriteNode!;
    var _mBlackOutSpriteNode:SKSpriteNode!;
    weak var _mDelegate:SRCFlappyIntroSceneDelegate?;
    var _mScreenSize:CGSize!;
    
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
    init(size:CGSize, delegate:SRCFlappyIntroSceneDelegate) {
        // Super Init
        super.init(size: size);
        
        // Initialize Values
        self._mScreenSize = size;
        
        // Logo Sprite Node
        self._mLogoSpriteNode = SKSpriteNode(imageNamed: "icon-flappy-pastry");
        self._mLogoSpriteNode.position = CGPoint(x: size.width/2, y: size.height + self._mLogoSpriteNode.size.height/2 + 50);
        self._mLogoSpriteNode.zPosition = 200;
        
        // Play Button
        self._mPlayButtonNode = SKSpriteNode(imageNamed: "button-play-normal");
        self._mPlayButtonNode.position = CGPoint(x: size.width/2, y: -self._mPlayButtonNode.size.height);
        self._mPlayButtonNode.name = "PlayButtonNode";
        self._mPlayButtonNode.zPosition = 300;
        
        // Black Out Node
        self._mBlackOutSpriteNode = SKSpriteNode(color: UIColor.blackColor(), size: self._mScreenSize);
        self._mBlackOutSpriteNode.position = CGPoint(x: size.width/2, y: size.height/2);
        self._mBlackOutSpriteNode.zPosition = 400;
        self._mBlackOutSpriteNode.alpha = 0;
        
        // Pastry Node
        self._mMockPastrySpriteNode = SKSpriteNode(imageNamed: "flappy-pastry-01");
        self._mMockPastrySpriteNode.position = CGPoint(x: -self._mMockPastrySpriteNode.size.width, y: size.height/2 - 20);
        self._mBlackOutSpriteNode.zPosition = 500;
        
        // Add Child
        self.addChild(self._mLogoSpriteNode);
        self.addChild(self._mPlayButtonNode);
        self.addChild(self._mMockPastrySpriteNode);
        
        // Set Delegate
        self._mDelegate = delegate;
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
    * touchesBegan
    * -----------------------------------------
    * Touch Begain
    * -----------------------------------------
    *==========================================*/
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var touch:UITouch = touches.anyObject()! as UITouch;
        var node:SKNode = self.nodeAtPoint(touch.locationInNode(self));
        
        if (node.name == "PlayButtonNode") {
            self.hideSceneAnimation();
        }
    }
    
   /*==========================================
    * showSceneAnimation
    * -----------------------------------------
    * Show Scene Animation
    * -----------------------------------------
    *==========================================*/
    override func showSceneAnimation() {
        // Set Pastry Animation
        self._mMockPastrySpriteNode.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "flappy-pastry-01"),
            SKTexture(imageNamed: "flappy-pastry-02"),
            SKTexture(imageNamed: "flappy-pastry-03"),
            SKTexture(imageNamed: "flappy-pastry-04")],timePerFrame: 0.07)));
        
        //Run Show Animations
        self._mLogoSpriteNode.runAction(SKAction.moveBy(CGVectorMake(0,-self._mLogoSpriteNode.size.height),
            duration: 1.5,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2));
        
        self._mMockPastrySpriteNode.runAction(SKAction.moveBy(CGVectorMake(self._mScreenSize.width/2 + self._mMockPastrySpriteNode.size.width,0),
            duration: 2.5,
            delay: 0.5,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2));
        
        self._mPlayButtonNode.runAction(SKAction.moveBy(CGVectorMake(0,self._mPlayButtonNode.size.height + 110),
            duration: 1.5,
            delay: 1.5,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2));
        
        //Delay Completion Call
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("showSceneAnimationComplete"), userInfo: nil, repeats: false);
    }
   
   /*==========================================
    * showSceneAnimationComplete
    * -----------------------------------------
    * Completion Hander On Show Complete
    * -----------------------------------------
    *==========================================*/
    override func showSceneAnimationComplete() {
        self.userInteractionEnabled = true;
    }
    
   /*==========================================
    * hideSceneAnimation
    * -----------------------------------------
    * Hide Scene Animation
    * -----------------------------------------
    *==========================================*/
    override func hideSceneAnimation() {
        self.userInteractionEnabled = false;
        
        //Move Logo Up
        self._mLogoSpriteNode.runAction(SKAction.moveBy(CGVectorMake(0,self._mLogoSpriteNode.size.height),
            duration: 1.5,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2));
        
        //Fade To Transparent Black Screen
        self.addChild(self._mBlackOutSpriteNode);
        self._mMockPastrySpriteNode.removeFromParent();
        self.addChild(self._mMockPastrySpriteNode);
        
        //Move Pastry
        self._mMockPastrySpriteNode.runAction(SKAction.moveTo(CGPoint(x: 90, y: self._mScreenSize.height/2 - 20), duration: 0.5));
        
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
            self._mDelegate?.flappyIntroSceneHideComplete();
        }
    }
    
}