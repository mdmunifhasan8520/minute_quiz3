//
//  ViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create a QuestioBank object
    let allQuestions = QuestionBank()
    
    //create a variable
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    //for track the score
    var homeBestScore: Int = 0
    var bestScore: Int = 0
    var score : Int = 0
    
    //for track the current and wrong answer
    var correctAnswerCount : Int = 0
    var wrongAnswerCount : Int = 0
    
    //correct answer collection
    var myCorrectAnswerCollecction = [Int]()
    var myWrongAnswerCollecction = [Int]()
    
    var storedCorrentAnswerArr = [Int]()
    var storedWrongAnswerArr = [Int]()
    
    //@IBOutlet weak var highestScoreLabel: UILabel!
    
    //for the Timer
    var startInt = 2
    var startTimer = Timer()
 
    
    @IBOutlet weak var Button1Label: UIButton!
    
    //ui elements from the storyboard
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var correctAnswerCountLabel: UILabel!
    @IBOutlet weak var wrongAnswerCountLabel: UILabel!
    @IBOutlet weak var progressHud: UIImageView!
    
    
    
    //create instance of UserDefaults
    let userDefaults = UserDefaults.standard
    
    //for animation
    var isGoingToNext = false
    var heartImages: [UIImage] = []
    
    
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        
        return imageArray
    }
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    
    /*
    @objc func addPulse() {
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: Button1Label.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        
        self.view.layer.insertSublayer(pulse, below: Button1Label.layer)
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        Button1Label.addGestureRecognizer(tapGestureRecognizer)
        
        */
        
        heartImages = createImageArray(total: 24, imagePrefix: "heart")
    
        bestScore = userDefaults.integer(forKey: "hscore")
        homeBestScore = userDefaults.integer(forKey: "hscoreforGamePlay")
        storedCorrentAnswerArr = userDefaults.object(forKey: "scaarr") as? [Int] ?? [Int]()
        storedWrongAnswerArr = userDefaults.object(forKey: "swaarr") as? [Int] ?? [Int]()
        
        //print("bestScore:\(bestScore)")
        gameStart()
    }

    @IBAction func Home(_ sender: AnyObject) {
        /*if bestScore > homeBestScore {
            bestScore = homeBestScore
        }*/
        //userDefaults.set("\(imageArray[0])", forKey: "savedImage")
        //UserDefaults.standard.set(use.text, forKey: "name")
    
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if(isGoingToNext) {return}
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        //after checking the answer proceed to the next question
        isGoingToNext = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.questionNumber = self.questionNumber + 1
            self.nextQuestion()
            self.isGoingToNext = false
        })
        
        }
    
    func gameStart() {
        myCorrectAnswerCollecction.removeAll()
        myWrongAnswerCollecction.removeAll()
        allQuestions.list.sort { (a, b) -> Bool in (arc4random() % 6) > 3}
        
        //for start the timer
        timer.text = "\(startInt)"
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startGameTimer), userInfo: nil, repeats: true)
        
        nextQuestion()

    }
    
    func summeryUI() {
        //for correct and wrong anser counter
        correctAnswerCountLabel.text = "\(correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(wrongAnswerCount)"
        scoreLabel.text = "Score: \(score)"
        
        //print("summary:scor\(score)")
        //print("summaryBest\(bestScore)")
        if score > bestScore {
            bestScore = score
            userDefaults.set("\(bestScore)", forKey: "hscore")
        }
        
        //for correct and wrong answer collection
        let newCorrectAnswers = myCorrectAnswerCollecction.filter { (id) -> Bool in
            return (storedCorrentAnswerArr.index(of: id) == nil) ? true : false
        }
        storedCorrentAnswerArr.append(contentsOf: newCorrectAnswers)
        //storedCorrentAnswerArr.sorted()
        userDefaults.set(storedCorrentAnswerArr.sorted(), forKey: "scaarr")
        print("sorted:\(storedCorrentAnswerArr.sorted())")
        
        //print(myCorrectAnswerCollecction)
        //print(newCorrectAnswers)
        //print(storedCorrentAnswerArr)
   }
    
    func updateUI() {
        //for correct and wrong anser counter
        correctAnswerCountLabel.text = "\(correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(wrongAnswerCount)"
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 5"
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        if questionNumber <= allQuestions.list.count - 1{
            questionImage.image = allQuestions.list[questionNumber].questionImage
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        } else {
            
            summeryUI()
            
            startTimer.invalidate()
            
            //create an AlertViewController object
            let alert = UIAlertController(title: "Awesome", message: "You have finished the quiz", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        let currentQuestion = allQuestions.list[questionNumber]
        if currentQuestion.answer == pickedAnswer {
            print("you got it")
            animate(imageView: progressHud, images: heartImages)
            score = score + 1
            correctAnswerCount = correctAnswerCount + 1
            myCorrectAnswerCollecction.append(currentQuestion.id)
  
        } else {
            print("shame")
            wrongAnswerCount = wrongAnswerCount + 1
            myWrongAnswerCollecction.append(currentQuestion.id)
        }
    }
    
    func startOver() {
        wrongAnswerCount = 0
        correctAnswerCount = 0
        score = 0
        questionNumber = 0
        startInt = 3000
        
        gameStart()
    }
    
    @objc func startGameTimer() {
        startInt -= 1
        timer.text = "\(startInt)"
        
        if startInt == 0 {
            startTimer.invalidate()
            summeryUI()
            let alert = UIAlertController(title: "Times Up", message: "could not answer all question", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
}

