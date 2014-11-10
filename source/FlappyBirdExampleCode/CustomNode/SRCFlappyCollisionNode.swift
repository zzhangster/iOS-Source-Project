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

class SRCFlappyCollisionNode:SRCFlappyBaseNode {
    
    var _mVelocity:CGVector!;
    
   /*==========================================
    * init
    * -----------------------------------------
    * Standard Init
    * -----------------------------------------
    *==========================================*/
    required override init() {
        super.init();
        self._mVelocity = CGVectorMake(0, 0);
    }
    
   /*==========================================
    * init - NSCoder
    * -----------------------------------------
    * Init With NSCoder
    * -----------------------------------------
    *==========================================*/
    override init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._mVelocity = CGVectorMake(0, 0);
    }
    
  /*==========================================
    * init - Texture Color Size
    * -----------------------------------------
    * Init
    * -----------------------------------------
    *==========================================*/
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size);
        self._mVelocity = CGVectorMake(0, 0);
    }
    
   /*==========================================
    * initialization
    * -----------------------------------------
    * initialization Other Variables
    * -----------------------------------------
    *==========================================*/
    func initialization(position:CGPoint, velocity:CGVector) {
        self.position = position;
        self._mVelocity = velocity;
    }
    
   /*==========================================
    * update
    * -----------------------------------------
    * init With Size And Delegate
    * -----------------------------------------
    *==========================================*/
    override func update(currentTime: NSTimeInterval) {
        self.position = CGPointMake((self.position.x + CGFloat(currentTime) * self._mVelocity.dx),
                                    (self.position.y + CGFloat(currentTime) * self._mVelocity.dy));
    }
}