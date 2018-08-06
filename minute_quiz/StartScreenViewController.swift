//
//  StartScreenViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
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
        
        print("start:\(highestScore)")
        //collectionImage.image = userDefaults.object(forKey: "image") as? UIImage
        //let data = userDefaults.object(forKey: "savedImage") as! NSData
        //collectionImage.image = UIImage(data: data as Data)
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

}
