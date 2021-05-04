//
//  QuizViewController.swift
//  HumanBodyQuiz
//
//  Created by Jandir Porta on 9/19/20.
//  Copyright © 2020 Jandir Porta. All rights reserved.
//

import UIKit

class QuizViewController : UIViewController{
    
    @IBOutlet weak var quizProgressView: UIProgressView!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var viewScoreOutlet: UIButton!
    //referencing all the buttons
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var choiceFourButton: UIButton!
    
    //initializing the variable that will store the name from the WelcomeViewController
    var name : String?
    
    //initializing the variable that will keep track of the right answers
    var score : Int = 0
    
    //initalizing the QuizLogic Object
    let quizLogic : QuizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScoreOutlet.isEnabled = false
        viewScoreOutlet.backgroundColor = UIColor.green
        updateText()
    }
    
    @IBAction func choiceButtonClicked(_ sender: UIButton) {
        
        let correctAnswer : String = quizLogic.getAnswer()
        let userAnswer : String = sender.title(for: .normal)!
        
        checkAnswer(userAnswer: userAnswer, correctAnswer: correctAnswer)
        
        if quizLogic.getIndexNumber() == quizLogic.questionArray.count - 1{
            disableChoiceButtons()
            viewScoreOutlet.isEnabled = true
            viewScoreOutlet.backgroundColor = UIColor.red
        }
        
        quizLogic.updateIndex()
        updateText()
        
    }
    
    func checkAnswer(userAnswer : String, correctAnswer : String){
        if userAnswer == correctAnswer{
            score += 1
        }
    }
    
    
    func updateText() {
        questionLabel.text = quizLogic.getQuestionText()
        choiceOneButton.setTitle(quizLogic.getChoiceOneText(), for: .normal)
        choiceTwoButton.setTitle(quizLogic.getChoiceTwoText(), for: .normal)
        choiceThreeButton.setTitle(quizLogic.getChoiceThreeText(), for: .normal)
        choiceFourButton.setTitle(quizLogic.getChoiceFourText(), for: .normal)
        quizProgressView.progress = quizLogic.getProgress()
        
    }
    
    func disableChoiceButtons(){
        choiceOneButton.isEnabled = false
        choiceTwoButton.isEnabled = false
        choiceThreeButton.isEnabled = false
        choiceFourButton.isEnabled = false
    }
    
    func enableChoiceButtons(){
        choiceOneButton.isEnabled = true
        choiceTwoButton.isEnabled = true
        choiceThreeButton.isEnabled = true
        choiceFourButton.isEnabled = true
    }
    
    
    
    @IBAction func viewScoreButtonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToScore", sender: self)
        perform(#selector(self.resetQuiz), with: nil, afterDelay: 1)
    }
    
    @objc func resetQuiz(){
        score = 0
        quizLogic.questionIndex = 0
        self.enableChoiceButtons()
        self.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScore"{
            let scoreViewController = segue.destination as! ScoreViewController
            scoreViewController.score = score
            scoreViewController.name = name
        }
        
    }
    
}
