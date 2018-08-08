//
//  StartScreenViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var StartLabel: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    @IBOutlet weak var forGamePlayHighestScoreLabel: UILabel!
    
    @IBOutlet weak var settingsButtonLabel: UIButton!
  
    
    //create instance of UserDefaults
    let userDefaults = UserDefaults.standard
    
  
    @IBAction func Start(_ sender: AnyObject) {
        userNameLabel.text = nameField.text
        UserDefaults.standard.set(userNameLabel.text, forKey: "name")
        UserDefaults.standard.set(nameField.text, forKey: "name")
        //nameField.text = ""
        StartLabel.isUserInteractionEnabled = true
        //performSegue(withIdentifier: "LevelSegueID", sender: nil)
    }
    
    @IBAction func Settings(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegueID", sender: nil)
    }
    
    override func viewDidLoad() {
        //permanent highest score saved section
        let highestScore = userDefaults.integer(forKey: "hscore")
        let forGameplayhighestscore = userDefaults.integer(forKey: "hscoreforGamePlay")
        highestScoreLabel.text = "\(highestScore)"
        forGamePlayHighestScoreLabel.text = "\(forGameplayhighestscore)"
        
        //print("start:\(highestScore)")
        if let s = UserDefaults.standard.object(forKey: "name") as? String
        {
            userNameLabel.text = s
            nameField.text = s
        }
    }
    
   override func viewDidAppear(_ animated: Bool) {
        if let s = UserDefaults.standard.object(forKey: "name") as? String
        {
            userNameLabel.text = s
        }
    }
    
    /* pulse animation
     
    @objc func addPulse() {
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: StartLabel.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        
        self.view.layer.insertSublayer(pulse, below: StartLabel.layer)
    }
 */

}
