//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falsebutton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Compare user's answer with actual quiz answer
        
        let userAnswer = sender.currentTitle!
        
        let result = quizBrain.checkAnswer(userAnswer)
        
         if(result) {
             sender.backgroundColor = UIColor.green
         }
         else {
             sender.backgroundColor = UIColor.red
         }
        
        quizBrain.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        // reset to buttton color clear
        trueButton.backgroundColor = UIColor.clear
        falsebutton.backgroundColor = UIColor.clear
        
        // show next question
        questionLabel.text = quizBrain.getQuestionText()
        
        progressBar.progress = quizBrain.getProgress()
    
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    

}

