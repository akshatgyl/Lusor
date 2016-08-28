//
//  FriendsViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class FriendsViewController: UIViewController, UIBarPositioningDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var AButton: QuestionButton!
    @IBOutlet weak var BButton: QuestionButton!
    @IBOutlet weak var CButton: QuestionButton!
    @IBOutlet weak var DButton: QuestionButton!
    var timer = NSTimer()
    var time = 10
    var indexQuestion = 0
    var indexAnswer = 0
    var points = 0
    var questions = ["What was the first show that Joey was in?", "Doctors of our lives", "Days of Our Lives", "Dr. Drake", "Soap Opera", "What is the object that Ross and Chandler try to lug up a staircase?", "Chair", "Table", "Lamp", "Couch", "What is the name of Carol's wife?", "Lora", "Lesley", "Sophie", "Susan", "What was Ross's monkey named?", "Marcy", "Marcel", "Lacey", "Darcy", "What did Joey do when the fridge broke?", "Ate everything in it", "Went grocery shopping", "Got a new one", "Did Nothing", "Who told Rachel about the name Emma?", "Ross", "Chandler", "Monica", "Phoebe", "In the theme song, when do the four claps happen?", "After 'so no one told you life was gonna be this way'", "At the end", "After 'your jobs a joke your broke'", "At the beginning", "Who was Chandlers girlfriend that said 'oh my god'?", "Kristen", "Janice", "Carol", "Monica", "What is the name of Monica's way older boyfriend?", "Joey", "Palo", "Richard", "Chandler", "What was the weird costume that Ross wore?", "Spudnick", "Chandler", "Bunny", "Superwomen", "What is Pheobe's brother named?", "Frank", "Bob", "Luke", "Dave", "What was Rachel wearing in the beginning of the first episode?", "Wedding Dress", "Jacket", "Regualar clothes", "Bikini", "When did the first episode of friends come out?", "1993", "1994", "2000", "2004", "In the 2nd season, what is the name of Chandlers insane roommate?", "Ross", "Joey", "Eddie", "Mike", "Who is a vegetarian?", "Joey", "Monica", "Phoebe", "Chandler", "What is their apartment number?", "15", "20", "22", "72", "What is the name of the coffee shop?", "Coffee House", "Central Coffee", "Central Perk", "Rossade", "Who plays Phoebe?", "Kim Kardesian", "Courtney Cox", "Jennifer Aniston", "Lisa Kudrow", "Who had the habit of smoking?", "Ross", "Joey", "Chandler", "Monica", "What color are the dots in the title?", "Red, Blue", "Red, yellow, blue", "Green, Yellow", "Black, White", "In the Central Perk logo, how many coffee cups are there?", "2", "1", "4", "3", "Who went out with Pheobe's twin?", "Joey", "Chandler", "Ross", "Mike", "Who is the one boy out of the 3 in the apartment that Rachel hasn't dated?", "Ross", "Joey", "Chandler", "All of them" ]
    
    var answers = ["Days of Our Lives", "Couch", "Susan", "Marcel", "Ate everything in it", "Monica", "After 'so no one told you life was gonna be this way'", "Janice", "Richard", "Spudnick", "Frank", "Wedding Dress", "1994", "Eddie", "Phoebe", "20", "Central Perk", "Lisa Kudrow", "Chandler", "Red, yellow, blue", "1", "Joey", "Chandler"]
    override func viewDidLoad() {
        super.viewDidLoad()
        aLabel = AButton.answerLabel
        AButton.optionLabel.text = "A"
        bLabel = BButton.answerLabel
        BButton.optionLabel.text = "B"
        cLabel = CButton.answerLabel
        CButton.optionLabel.text = "C"
        dLabel = DButton.answerLabel
        DButton.optionLabel.text = "D"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decrement"), userInfo: nil, repeats: true)
        questionLabel.text = questions[indexQuestion]
        aLabel.text = questions[indexQuestion + 1]
        bLabel.text = questions[indexQuestion + 2]
        cLabel.text = questions[indexQuestion + 3]
        dLabel.text = questions[indexQuestion + 4]
        indexQuestion += 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func quit(sender: AnyObject) {
        exit(0)
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }

    func decrement() {
        time--
        timerLabel.text = "\(time)"
        
        if (time == 0) {
            timer.invalidate()
            if (aLabel.text == answers[indexAnswer]) {
                aLabel.textColor = UIColor.greenColor()
            }
            else if (bLabel.text == answers[indexAnswer]) {
                bLabel.textColor = UIColor.greenColor()
            } else if (cLabel.text == answers[indexAnswer]) {
                cLabel.textColor = UIColor.greenColor()
            } else {
                dLabel.textColor = UIColor.greenColor()
            }
            let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                if (self.indexQuestion < self.questions.count && self.indexAnswer < self.answers.count) {
                    self.next()
                } else {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                self.time = 10
            })
        }
    }

    
    func next() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decrement"), userInfo: nil, repeats: true)
        aLabel.textColor = UIColor.whiteColor()
        bLabel.textColor = UIColor.whiteColor()
        cLabel.textColor = UIColor.whiteColor()
        dLabel.textColor = UIColor.whiteColor()
        questionLabel.text = questions[indexQuestion]
        aLabel.text = questions[indexQuestion + 1]
        bLabel.text = questions[indexQuestion + 2]
        cLabel.text = questions[indexQuestion + 3]
        dLabel.text = questions[indexQuestion + 4]
        indexQuestion += 5
    }
    @IBAction func aButton(sender: AnyObject) {
        timer.invalidate()
        time = 10
        if aLabel.text == answers[indexAnswer] {
            aLabel.textColor = UIColor.greenColor()
            points++
            pointsLabel.text = "Points : \(points)"
        } else {
            aLabel.textColor = UIColor.redColor()
            if (bLabel.text == answers[indexAnswer]) {
                bLabel.textColor = UIColor.greenColor()
            } else if (cLabel.text == answers[indexAnswer]) {
                cLabel.textColor = UIColor.greenColor()
            } else {
                dLabel.textColor = UIColor.greenColor()
            }
        }
        indexAnswer++
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            if (self.indexQuestion < self.questions.count && self.indexAnswer < self.answers.count) {
                self.next()
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
        
    }
    @IBAction func bButton(sender: AnyObject) {
        timer.invalidate()
        time = 10
        if bLabel.text == answers[indexAnswer] {
            bLabel.textColor = UIColor.greenColor()
            points++
            pointsLabel.text = "Points : \(points)"
        } else {
            bLabel.textColor = UIColor.redColor()
            if (aLabel.text == answers[indexAnswer]) {
                aLabel.textColor = UIColor.greenColor()
            } else if (cLabel.text == answers[indexAnswer]) {
                cLabel.textColor = UIColor.greenColor()
            } else {
                dLabel.textColor = UIColor.greenColor()
            }
        }
        indexAnswer++
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            if (self.indexQuestion < self.questions.count && self.indexAnswer < self.answers.count) {
                self.next()
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    @IBAction func cButton(sender: AnyObject) {
        timer.invalidate()
        time = 10
        if cLabel.text == answers[indexAnswer] {
            cLabel.textColor = UIColor.greenColor()
        } else {
            cLabel.textColor = UIColor.redColor()
            if (bLabel.text == answers[indexAnswer]) {
                bLabel.textColor = UIColor.greenColor()
            } else if (aLabel.text == answers[indexAnswer]) {
                aLabel.textColor = UIColor.greenColor()
            } else {
                dLabel.textColor = UIColor.greenColor()
            }
        }
        indexAnswer++
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            if (self.indexQuestion < self.questions.count && self.indexAnswer < self.answers.count) {
                self.next()
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    @IBAction func dButton(sender: AnyObject) {
        timer.invalidate()
        time = 10
        if dLabel.text == answers[indexAnswer] {
            dLabel.textColor = UIColor.greenColor()
            points++
            pointsLabel.text = "Points : \(points)"
        } else {
            dLabel.textColor = UIColor.redColor()
            if (bLabel.text == answers[indexAnswer]) {
                bLabel.textColor = UIColor.greenColor()
            } else if (cLabel.text == answers[indexAnswer]) {
                cLabel.textColor = UIColor.greenColor()
            } else {
                aLabel.textColor = UIColor.greenColor()
            }
        }
        indexAnswer++
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            if (self.indexQuestion < self.questions.count && self.indexAnswer < self.answers.count
                ) {
                    self.next()
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }

    @IBAction func googleThis(sender: AnyObject) {
        timer.invalidate()
        let replaced = questions[indexQuestion - 5].stringByReplacingOccurrencesOfString(" ", withString: "+")
        let searchString = "https://google.com/#q=\(replaced)"
        print(searchString)
        if let url = NSURL(string: searchString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func askFriends(sender: AnyObject) {
        timer.invalidate()
        let postPhrase = "Anybody?"
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [postPhrase, image!], applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    
}
