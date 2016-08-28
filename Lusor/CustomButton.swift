//
//  CustomButton.swift
//  Lusor
//
//  Created by Apple on 10/18/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class QuestionButton: UIButton {
    var optionLabel: UILabel!
    var answerLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        optionLabel = UILabel()
        answerLabel = UILabel()
        
        self.addSubview(optionLabel)
        self.addSubview(answerLabel)
        
        // Saving
//        NSUserDefaults.standardUserDefaults().setObject(["Name",""], forKey: "Sort")
//        NSUserDefaults.standardUserDefaults().setObject("Priority", forKey: "Sort")
//        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Retrieving
//        let name = NSUserDefaults.standardUserDefaults().objectForKey("Sort")
        
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
        optionLabel.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 20).active = true
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
        answerLabel.leadingAnchor.constraintEqualToAnchor(optionLabel.trailingAnchor, constant: 20).active = true
        
        optionLabel.textColor = UIColor.redColor()
        answerLabel.textColor = UIColor.whiteColor()
        self.backgroundColor = nil
        
        self.addTarget(self, action: "showHighlight", forControlEvents: .TouchDown)
        self.addTarget(self, action: "hideHighlight", forControlEvents: [.TouchUpInside, .TouchUpOutside])
        
        
    }
    func showHighlight() {
        self.backgroundColor = UIColor.darkGrayColor()
    }
    func hideHighlight() {
        self.backgroundColor = nil
    }
}
