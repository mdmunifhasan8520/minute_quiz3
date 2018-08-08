//
//  ArchiveDetailsViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 8/3/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ArchiveDetailsViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    //@IBOutlet weak var ShortDescription: UICollectionView!
    @IBOutlet weak var shortnoteLabel: UITextView!
    
    
    var avc = ArchiveViewController()
    
    var image = UIImage()
    var shortnote = String()
    var name = String()
    
override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = image
        
        NameLabel.text = name
        shortnoteLabel.text = shortnote
        //print(image)
        //print(name)
    }
}
