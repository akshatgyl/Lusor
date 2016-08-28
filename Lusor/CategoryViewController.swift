//
//  CategoryViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController, UIBarPositioningDelegate {
    @IBOutlet weak var myBackgroundView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = 10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        myBackgroundView.addMotionEffect(group)
    }
    
    @IBAction func back(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}
