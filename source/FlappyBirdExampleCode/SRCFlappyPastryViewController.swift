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

class SRCFlappyPastryViewController:UIViewController {
    
    // Back Button
    @IBOutlet weak var _mBackButton:UIButton!
    
   /*==========================================
    * init
    * -----------------------------------------
    * Init Function
    * -----------------------------------------
    *==========================================*/
    required init(coder aDecoder: NSCoder) {
        // Super Init Call
        super.init(coder: aDecoder);
    }
    
   /*==========================================
    * viewDidLoad
    * -----------------------------------------
    * Standard viewDidLoad
    * -----------------------------------------
    *==========================================*/
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Set View Values
        var mSkView:SKView = self.view as SKView;
        mSkView.showsFPS = false;
        mSkView.showsNodeCount = false;
    }
    
   /*==========================================
    * viewDidAppear
    * -----------------------------------------
    * Standard viewDidAppear
    * -----------------------------------------
    *==========================================*/
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        self.onEnterAnimations();
    }
    
   /*==========================================
    * didReceiveMemoryWarning
    * -----------------------------------------
    * Standard didReceiveMemoryWarning
    * -----------------------------------------
    *==========================================*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   /*==========================================
    * prefersStatusBarHidden
    * -----------------------------------------
    * Hide Status Bar
    * -----------------------------------------
    *==========================================*/
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
   /*==========================================
    * onEnterAnimations
    * -----------------------------------------
    * On Enter Animations
    * -----------------------------------------
    *==========================================*/
    func onEnterAnimations() {
        // Set Initial Position
        self._mBackButton.frame = CGRectMake(self._mBackButton.frame.origin.x - 100,
            self._mBackButton.frame.origin.y,
            self._mBackButton.frame.size.width,
            self._mBackButton.frame.size.height);
        
        // Run Animation
        UIView.animateWithDuration(0.5,
            delay: 0.3,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 8,
            options: UIViewAnimationOptions.CurveLinear,animations: {
                self._mBackButton.frame = CGRectMake(self._mBackButton.frame.origin.x + 100,
                    self._mBackButton.frame.origin.y,
                    self._mBackButton.frame.size.width,
                    self._mBackButton.frame.size.height);
            }, completion: {
                (value: Bool) in
        });
    }
    
   /*==========================================
    * onExitAnimations
    * -----------------------------------------
    * On Exit Animations
    * -----------------------------------------
    *==========================================*/
    func onExitAnimations() {
    }
    
   /*==========================================
    * backButtonPressed
    * -----------------------------------------
    * Back Button Pressed
    * -----------------------------------------
    *==========================================*/
    @IBAction func backButtonPressed() {
        self.navigationController?.popViewControllerAnimated(true);
    }

}