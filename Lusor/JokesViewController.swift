//
//  JokesViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class JokesViewController: UIViewController, UIBarPositioningDelegate {
    
    var questions = ["Which insect runs away from everything?", "A bee", "A mosquito", "A flea", "A cockroach", "What did the grape do when it got stepped on?", "It screamed and shout", "Grapes have no feeling", "It let out a little wine", "It bled to death", "What kind of cats like to go bowling?", "Bowl cats", "Alley cats", "Grandiloquent kittens", "Cats can't bowl", "What do whales like to chew?", "Fish and ship", "Whaleson", "Choo-tram", "Blubbergum", "What kind of clothes do clouds wear?", "Rain boots", "No clothes", "Thunderwear", "Raincoats", "What do you get when you cross a fish and an elephant?", "French Friens", "Swimming trunks", "Fishfry", "Huge fish", "Which bird can lift the most?", "A peacock", "A crow", "A penguin", "A crane", "What did the computer do at lunchtime?", "Had a byte to eat", "Downlaod a show to watch" ,"Shut down" ,"Went to sleep", "What keeps jazz musicians down to earth?", "Earth at first sight", "Jazz punk", "Groovity", "Party jazzy", "What part of a fish weighs the most?", "The scales", "The jaw", "The fins", "The gills", "What book tells you all about chickens?", "A hencyclopedia", "A roosteristy", "A chicken book", "A chickotomafia", "What did one plate say to the other plate?", "Leave the food to me", "We're buddies, aren't we?", "Stop bickering over my fork", "Lunch is on me", "What is the same size and shape as an elephant but weighs nothing?", "A hole in your pocket", "The fur of the elephant", "The elephant's shadow", "The sunny shade", "What kind of mistake does a ghost make?", "Halloween", "Goo for fools", "A scare gone wrong", "A boo-boo", "Who serves ice cream faster than a speeding bullet?", "Puddingman", "Scooperman", "Atrocity, no such forces", "Ice cream delivery man", "What do you call a duck that gets straight A's in school?", "Saruman the White", "Smartypants", "A wise-quacker", "A cracker", "Where do fish wash their hands?", "They don't need to wash", "In a riverbannk", "In a river basin", "The ocean floor", "Why did the boy throw a glass of water out the window?", "To drink it afterwards", "To see a waterfall", "It was an order from Mindy", "He was insane", "What do you call a mosquito with a tin suit?", "A bite in shining armor", "Nice suit, buddy!", "Ferocious bite", "Mosquito knight", "What did the jack say to the car?", "I want to smack you", "Like a somebody", "Can I give you a lift?", "I will carry you"]
    
    var answers = ["A flea", "It let out a little wine", "Alley cats","Blubbergum", "Thunderwear", "Swimming trunks", "A crane", "Had a byte to eat", "Groovity", "The scales", "A hencyclopedia", "Lunch is on me", "The elephant's shadow", "A boo-boo", "Scooperman", "A wise-quacker", "In a river basin", "To see a waterfall", "A bite in shining armor", "Can I give you a lift?"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var AButton: QuestionButton!
    @IBOutlet weak var BButton: QuestionButton!
    @IBOutlet weak var CButton: QuestionButton!
    @IBOutlet weak var DButton: QuestionButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var timer = NSTimer()
    var time = 10
    var indexQuestion = 0
    var indexAnswer = 0
    var points = 0
    
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
            points++
            pointsLabel.text = "Points : \(points)"
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
    
    @IBAction func googleThis(sender: AnyObject) {
        timer.invalidate()
        let replaced = questions[indexQuestion - 5].stringByReplacingOccurrencesOfString(" ", withString: "+")
        let searchString = "https://google.com/#q=\(replaced)"
        print(searchString)
        if let url = NSURL(string: searchString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
