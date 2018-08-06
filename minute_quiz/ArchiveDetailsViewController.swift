//
//  ArchiveDetailsViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 8/3/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ArchiveDetailsViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var shortnoteLabel: UITextView!
    
    var image = UIImage ()
    var shortnote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = image
        // Do any additional setup after loading the view.
        print("hello")
        print(image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
