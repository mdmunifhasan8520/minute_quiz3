//
//  QuestionBank.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class QuestionBank {
    
    //create an array of question object
    var list = [Question]()
    
    init() {
        //creating a quiz item and appending it to the list
        let item = Question(id: 1, image: UIImage(named: "Diego Maradona_A")!, text: "Is It Madona?", correctAnswer: false, character: "Maradona")
        
        //add the Questin to the list of question
        list.append(item)
        
        list.append(Question(id: 2, image: UIImage(named: "pele_A")!, text: "Here is pele...", correctAnswer: true,character: "Pele"))
        list.append(Question(id: 3, image: UIImage(named: "David Beckham_A")!, text: "David Bhuiya!...", correctAnswer: false,character: "Beckham"))
        list.append(Question(id: 4, image: UIImage(named: "Socrates_A")!, text: "Yes Socrates", correctAnswer: true,character: "Socrates"))
        list.append(Question(id: 5, image: UIImage(named: "Roberto Carlos_A")!, text: "I think ronaldo?", correctAnswer: false,character: "Roberto Carlos"))
        list.append(Question(id: 6, image: UIImage(named: "Garrincha_A")!, text: "I think ronaldo?", correctAnswer: false,character: "Roberto Carlos"))
        list.append(Question(id: 7, image: UIImage(named: "Garrincha_A")!, text: "I think ronaldo?", correctAnswer: false,character: "Roberto Carlos"))
      
   
    }
}
