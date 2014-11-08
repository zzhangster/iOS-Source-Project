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

class SRCFlappyPastryNode:SRCFlappyBaseNode {
    var _mVelocity:Double = 0.0;
    var _mStationary:Bool!;
    var _mAcceleration:Double = 0.0;
    
    func startAnimation() {
        // Set Stationary
        self._mStationary = true;
        
        // Initial Values
        self._mAcceleration = 600;
        self._mVelocity = 0.0;
        
        // Run Animation
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "flappy-pastry-01"),
            SKTexture(imageNamed: "flappy-pastry-02"),
            SKTexture(imageNamed: "flappy-pastry-03"),
            SKTexture(imageNamed: "flappy-pastry-04")],
            timePerFrame: 0.07)));
    }
    
    func updateVisualToKO() {
        self.removeAllActions();
        self.texture = SKTexture(imageNamed: "flappy-pastry-ko");
        self.runAction(SKAction.rotateToAngle(CGFloat((-60.0 * 3.14159 / 180.0)), duration: 0));
    }
    
    func updateWithUserTap() {
        self._mVelocity = 315;
    }
    
    override func update(currentTime: NSTimeInterval) {
        // Angle Calculation
        var mAngle:Float = 0;
        
        if (self._mVelocity >= 315) {
            mAngle = 30;
        } else if (self._mVelocity <= -315) {
            mAngle = -60;
        } else {
            mAngle = 30.0 - (1.0 - ((Float(self._mVelocity) + 315) / 660.0)) * 90;
        }
        
        // Run Action
        self.runAction(SKAction.rotateToAngle(CGFloat((mAngle * 3.14159 / 180.0)), duration: 0));
        
        // Position Calculation
        self._mVelocity -= currentTime * self._mAcceleration;
        self.position = CGPoint(x:self.position.x,y:self.position.y + CGFloat(self._mVelocity * currentTime));
    }
}