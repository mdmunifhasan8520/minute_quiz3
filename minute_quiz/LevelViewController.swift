//
//  LevelViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 8/9/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    @IBOutlet weak var LevelCollectionView: UICollectionView!
    
    var name = ["Level 1","Level 2","Level 3","Level 4","Level 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "LEVEL_CELL", for: indexPath) as! CollectionViewCell
        //cell.myLabel.text = name[indexPath.item]
        //cell2.NameLabel.text = name[indexPath.item]
        
        cell2.MyLabelName.text = name[indexPath.item]
        
        return cell2
        
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
