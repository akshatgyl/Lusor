//
//  GKViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class GKViewController: UIViewController, UIBarPositioningDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
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
    var questions = ["What type of creature is a Gecko?", "Fish", "Insect", "Bird", "Lizard", "Who released an album called simply 'War'?", "U2", "Bruce Springsteen", "Nirvana", "Guns N' Roses", "What does an aardvark's diet mostly consist of?", "Ants & Termites", "Mice & rats", "Fruit & vegetables", "Spiders & locusts", "What part of the body is removed during a nephrectomy?", "Lung", "Heart", "Kidney", "Liver", "Turku, Tampere, and Espoo are cities in what country?", "Iceland", "Vanuatu", "Finland", "Estonia", "What country's second largest city is Bergen?", "Portugal", "The Netherlands", "Slovenia", "Norway", "Which large air conditioner manufacturer is named after the man who invented modern air conditioning in 1902?", "Trane", "Amana", "Carrier", "Lennox", "In which city were 3 people killed in a 2013 attack on the annual Marathon?", "Chicago", "London", "Boston", "Newcastle", "In the name of energy company EDF, what does the F stand for?", "France", "Fiji", "Fire", "Finland", "Forming the toe end of the Italian peninsula's 'boot', what is the southermost region of Italy, besides Sicily?", "Umbria", "Calabria", "Campania", "Abruzzo", "Which of the following is NOT a type of coal?", "Adamellite", "Anthracite", "Lignite", "Bituminous", "Which gas do plants produce as a waste product of photosynthesis?", "Helium", "Oxygen", "Carbon dioxide", "Methane", "What singer is know for her recording of 'At Last'?", "Lena Horne", "Dionne Warwick", "Etta James", "Nina Simone", "Audioblogging is now more commonly known as what?", "Selfies", "Mix Taping", "Podcasting", "Net Surfing", "Besides being smaller, the most obvious way in which an English saddle differs from a Western saddle is its lack of what?", "Pommel", "Skirt", "Horn", "Cantle", "In what year was the National Prohibition Act passed in the USA?", "1949", "1939", "1919", "1929", "What year saw the first commercially available electric guitars?", "1922", "1943" ,"1932", "1911", "Which 18th century German composer wrote the 'Brandenburg Concertos'?", "J.S Bach", "W.A.Mozart", "G.F.Handel", "L.van Beethoven", "In which mythology was Asgard the home of gods?", "Egyptian", "Roman", "Norse", "Greek", "Who won the Academy Award for Best Actor in 1993?","Anthony Hopkins", "Al Pacino", "Dustin Hoffman", "William Hurt"]
    
    var answers = ["Lizard", "U2", "Ants & Termites", "Kidney", "Finland", "Norway", "Carrier", "Boston", "France", "Calabria", "Adamellite", "Oxygen", "Etta James", "Podcasting", "Horn", "1919", "1932", "J.S Bach", "Norse", "Al Pacino"]
    
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
        points++
        pointsLabel.text = "Points : \(points)"
        time = 10
        if aLabel.text == answers[indexAnswer] {
            aLabel.textColor = UIColor.greenColor()
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