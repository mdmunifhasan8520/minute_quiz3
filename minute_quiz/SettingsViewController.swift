//
//  SettingsViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 8/3/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func RESET(_ sender: Any) {
        UserDefaults.standard.set([], forKey: "name")
        UserDefaults.standard.set(0, forKey: "hscore")
        UserDefaults.standard.set([], forKey: "scaarr")
        
        //print("hello")
    }

    @IBAction func backToHomeScreen(_ sender: Any) {
         //print("settings:\(highestScore)")
        print("back to home")
    }


}
