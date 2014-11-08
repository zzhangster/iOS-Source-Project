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

class SRCFlappySKView:SKView,SRCFlappyIntroSceneDelegate,SRCFlappyGameplaySceneDelegate {
    
    //Properties
    var _mFlappyScene:SKScene!;
    
   /*==========================================
    * init
    * -----------------------------------------
    * Init With NSCoder
    * -----------------------------------------
    *==========================================*/
    required init(coder aDecoder: NSCoder) {
        // Super Init Call
        super.init(coder: aDecoder);
        
        // Call Initial Scene Setup
        self.initialSceneSetup();
    }
    
   /*==========================================
    * init
    * -----------------------------------------
    * Init With Frame
    * -----------------------------------------
    *==========================================*/
    override init(frame: CGRect) {
        // Super Init Call
        super.init(frame: frame);
        
        // Call Initial Scene Setup
        self.initialSceneSetup();
    }
    
   /*==========================================
    * initialSceneSetup
    * -----------------------------------------
    * Setup Initial Scene Function
    * -----------------------------------------
    *==========================================*/
    func initialSceneSetup() {
        // Screen Size
        var mFrame:CGRect = UIScreen.mainScreen().bounds;
        
        // Create And Configure Scene
        self._mFlappyScene = SRCFlappyIntroScene(size: CGSizeMake(mFrame.size.width, mFrame.size.height), delegate:self);
        self._mFlappyScene.scaleMode = SKSceneScaleMode.AspectFill;
        
        // Present The Scene
        self.presentScene(self._mFlappyScene);
    }
    
   /*==========================================
    * flappyIntroSceneShowComplete
    * -----------------------------------------
    * When Intro Show Scene Is Complete
    * -----------------------------------------
    *==========================================*/
    func flappyIntroSceneShowComplete() {
    }
    
   /*==========================================
    * flappyIntroSceneHideComplete
    * -----------------------------------------
    * When Intro Scene Completes, Load
    * Next Logical Scene (GameplayScene)
    * -----------------------------------------
    *==========================================*/
    func flappyIntroSceneHideComplete() {
        // Screen Size
        var mFrame:CGRect = UIScreen.mainScreen().bounds;
        self._mFlappyScene = SRCFlappyGameplayScene(size: CGSizeMake(mFrame.size.width, mFrame.size.height), delegate:self);
        self._mFlappyScene.scaleMode = SKSceneScaleMode.AspectFill;
        
        // Present The Scene
        self.presentScene(self._mFlappyScene);
    }
    
   /*==========================================
    * flappyGameplaySceneShowComplete
    * -----------------------------------------
    * When Gameplay Show Scene Is Complete
    * -----------------------------------------
    *==========================================*/
    func flappyGameplaySceneShowComplete() {
    }
    
   /*==========================================
    * flappyGameplaySceneHideComplete
    * -----------------------------------------
    * When Gameplay Hide Scene Is Complete
    * Use It For Retry
    * -----------------------------------------
    *==========================================*/
    func flappyGameplaySceneHideComplete() {
        // Screen Size
        var mFrame:CGRect = UIScreen.mainScreen().bounds;
        self._mFlappyScene = SRCFlappyGameplayScene(size: CGSizeMake(mFrame.size.width, mFrame.size.height), delegate:self);
        self._mFlappyScene.scaleMode = SKSceneScaleMode.AspectFill;
        
        // Present The Scene
        self.presentScene(self._mFlappyScene);
    }
}
