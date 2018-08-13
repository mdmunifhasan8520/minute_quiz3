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
    
   // var QuestionSet = QuestionBank()
    //var myVc = ViewController()
    
    //var questionNumber = 0
    var segueShouldOccur = true
    
    var name = ["Level 1","Level 2","Level 3","Level 4","Level 5"]
    var myLevelIndex = 0
    var mycellValue: [String] = []
    
    var vc = ViewController()
    
    //var levelUpCounter: Int = 0
    var levelUp: Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //levelUp = vc.levelUpCounter
        levelUp = UserDefaults.standard.integer(forKey: "levelUpVariabel")
        print("lllup")
        print(levelUp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LEVEL_CELL", for: indexPath) as! LevelViewCell
        //cell.MyLabelName.text = name[indexPath.item]
        cell.NameLabel.text = name[indexPath.item]
        
        cell.isUserInteractionEnabled = true
       
      
        print("thid id \(myLevelIndex)")
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myLevelIndex = indexPath.item + 1
        print("3rd\(myLevelIndex)")
  
        let cell = collectionView.cellForItem(at: indexPath) as! LevelViewCell
       
             cell.backgroundColor = UIColor.blue
             //cell.isUserInteractionEnabled = false

    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("prepare")
        //shouldPerformSegueWithIdentifier(identifier: "LEVEL_SEGUE", sender: (Any).self as AnyObject)
        if segue.destination is ViewController
        {
            
            let vc = segue.destination as? ViewController
            let index = LevelCollectionView.indexPath(for: sender as! UICollectionViewCell)
            //print("welcome:\(index)")
            vc?.selectedLevel = ((index?.item)! + 1)
        
            myLevelIndex = (vc?.selectedLevel)!
            //shouldPerformSegueWithIdentifier(identifier: "LEVEL_SEGUE", sender: (Any).self as AnyObject)
            print("hi hi hi\(myLevelIndex)")
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("2nd prepare")
        if identifier == "LEVEL_SEGUE" {
            let index = LevelCollectionView.indexPath(for: sender as! UICollectionViewCell)
            // perform your computation to determine whether segue should occur
           // print("here is \(index?.item)")
            if (index?.item)! > levelUp {
                print("now \(vc.levelUpCounter)")
                print("nowup \(levelUp)")
                return false // you determine this
              
            }
           
        }
        // by default perform the segue transitio
        return true
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
