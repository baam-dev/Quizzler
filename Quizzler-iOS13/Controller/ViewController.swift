//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // initializing a new object from the quizBrain struct
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        // True or False
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        //
        if(userGotItRight)
        {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI ()
    {
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAlternatives()
        btn1.setTitle(answerChoices[0], for: .normal)
        btn2.setTitle(answerChoices[2], for: .normal)
        btn3.setTitle(answerChoices[1], for: .normal)
        
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Your Score: \(quizBrain.getScore())"
        btn1.backgroundColor = UIColor.clear
        btn2.backgroundColor = UIColor.clear
        btn3.backgroundColor = UIColor.clear
    }
}

