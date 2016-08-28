//
//  ViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import UIKit
import CoreMotion

class StartViewController: UIViewController {

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

    @IBAction func start(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(["Akshat", "Password"], forKey: "login")
        NSUserDefaults.standardUserDefaults().synchronize()
        let loginCredentials = NSUserDefaults.standardUserDefaults().objectForKey("login") as! [String]
        if loginCredentials[0] == "Akshat" && loginCredentials[1] == "Password"
            {
                self.performSegueWithIdentifier("loggedIn", sender: self)
        }
        else {
            self.performSegueWithIdentifier("login", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func quit(sender: AnyObject) {
        exit(0)
    }

}

