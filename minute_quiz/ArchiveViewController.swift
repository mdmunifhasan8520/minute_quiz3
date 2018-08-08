//
//  ArchiveViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ArchiveViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vc = QuestionBank()
    var playerImage: [UIImage] = []
    var playerName: [String] = []
    var correctAnswerArray: [Int] = []
    var correctQuestion: [Int] = []
    var shortnoteArray: [String] = []
    //var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        correctAnswerArray = UserDefaults.standard.array(forKey: "scaarr") as! [Int]
        
        for questionImageid in correctAnswerArray {
            let correctQuestion = vc.list.first { (question) -> Bool in
                return questionImageid == question.id
            }
            let correctQuestion2 = vc.list.first { (question) -> Bool in
                return questionImageid == question.id
            }
            playerImage.append((correctQuestion?.questionImage)!)
            playerName.append((correctQuestion2?.character)!)
            shortnoteArray.append((correctQuestion?.shortDescription)!)
            //print("hello:\(shortnoteArray)")
        }
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.myImageView.image = playerImage[indexPath.item]
        //cell.myLabel.text = playerName[indexPath.item]
        cell.myLabel.text = playerName[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
       let desVc = storyboard?.instantiateViewController(withIdentifier: "ArchiveDetailsViewController") as! ArchiveDetailsViewController
       
       desVc.image = playerImage[indexPath.item]
        // print(playerImage[indexPath.item])
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("prep")
        // print(segue)
        if segue.destination is ArchiveDetailsViewController
        {
            let vc = segue.destination as? ArchiveDetailsViewController
            print(collectionView)
            let index = collectionView.indexPath(for: sender as! UICollectionViewCell)
            vc?.image = self.playerImage[(index?.item)!]
            vc?.name = self.playerName[(index?.item)!]
            vc?.shortnote = self.shortnoteArray[(index?.item)!]
            //self.vc
           // print(sender)
           // print("this is:\(vc?.shortnote)")
        }
    }

}
