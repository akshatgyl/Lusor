//
//  MusicViewController.swift
//  Lusor
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Akshat. All rights reserved.
//

import Foundation
import UIKit

class MusicViewController: UIViewController, UIBarPositioningDelegate {

    @IBOutlet weak var questionTextfield: UILabel!
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
    var questions = ["This is ground control. Who is the astronaut in David Bowie's 'Space Oddity'?", "Ziggy Stardust", "Major Tom", "The Thin White Duke", "Starr Mann", "In 1999, she planned to become a female priest named Mother Bernadette. In 2000 she declares her lesbianism. Who is she?", "Sinead O' Connor", "Bjork", "Fiona Apple", "Marilyn Manson", "Which band did Christine McVie rejoin for the first time in 16 years in 2014?", "Mamas and the Papas", "Heart", "Garbage", "Fleetwood Mac", "What is the title of Imagine Dragons' 2015 album?", "Boys + Girls", "Smoke + Mirrors", "Milk + Honey", "Day + Night", "Who was the first South American to have a #1 Billboard song?", "Shakira", "Ricky Martin" ,"Christine Aguilera", "Carlos Santana", "As of 2013, which of these Billboard records is held by Beatles?", "Most Hot 100 songs", "Most #1 songs", "Most Top 40 songs", "Most Top 10 songs", "Who sampled Dido's 'Thank You' on his hit song 'Stan,' about an obsessed fan?", "Michael Jackson", "Puff Daddy", "Eminem", "Shaggy", "In 2014 which band released their first single in nine years called 'Gift Wrapped Kiss'?", "Pink Floyd", "American Football", "TLC", "L7", "What footwear and clothing did Run-DMC associate themselves with?", "Reebok", "Adidas", "Nike", "Puma", "Which artist had a hit Runaway (U & I) in 2015?", "Galantis", "CAZZETTE", "Zedd", "The Chainsmokers", "Who had a hit with 'Love me Like You Do' in 2015?", "Ellie Goulding", "Lily Allen", "Sia", "Jessie J", "Which legendary sixties band did a reunion concert at the Austin Psych Fest in 2015?"," Moby Grape", "The 13th Floor Elevators", "Ultimate Spinach", "The Electric Prunes", "Who released the album 'Uptown Special' in 2015?", "Young Thug", "Mark Ronson", "Tyler, The Creator", "Action Bronson", "Years before his son Jaden was born, who rapped that 'parents just don't understand?", "Puff Daddy", "Will Smith", "Dr Dre", "Chuck D", "Which Beatle came closest to having a movie career, with roles in 'Caverman', 'Sextette' and 'Candy'?", "Paul", "George", "John", "Ringo", "Mariah Carey is the only artist to have a number one hit every single year of any decade. Which one?", "1960s", "1970s", "1980s", "1990s", "When was the famous 'Live Aid' concert held?", "1985", "1987", "1990", "1979", "The title od the Weekend's 2015 album'Beauty Behind The ____'?", "Madness", "Moss", "Moon", "Mask", "What is the title of Leonard Cohen's 2014 album?", "Popular Problems", "Proud Poison", "Prime Piggies", "Pointless Prayers", "What Cee Lo Green song became an instant hit in 2010?", "I Love You", "Screw You", "Forget You (or F*** You)", "Crazy"]
    var answers = ["Major Tom","Sinead O' Connor", "Fleetwood Mac", "Smoke + Mirrors", "Shakira", "Most #1 songs", "Eminem", "TLC", "Adidas", "Galantis", "Ellie Goulding", "The 13th Floor Elevators", "Mark Ronson", "Will Smith", "Ringo", "1990s", "1985", "Madness", "Popular Problems", "Forget You (or F*** You)"]
    
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
        questionTextfield.text = questions[indexQuestion]
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
        questionTextfield.text = questions[indexQuestion]
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
