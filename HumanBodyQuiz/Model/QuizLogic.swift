//
//  QuizLogic.swift
//  HumanBodyQuiz
//
//  Created by Jandir Porta on 9/19/20.
//  Copyright © 2020 Jandir Porta. All rights reserved.
//

import UIKit

class QuizLogic{
    
    var questionIndex : Int = 0
    
    let questionArray : [Question] = [
        Question(text: "How many chambers does the heart have?", choiceOne: "Three", choiceTwo: "Four", choiceThree: "Two", choiceFour: "One", correctAnswer: "Four"),
        Question(text: "What is the largest organ of the body?", choiceOne: "Brain", choiceTwo: "Heart", choiceThree: "Skin", choiceFour: "Lungs", correctAnswer: "Skin"),
        Question(text: "What is the top layer of skin called?", choiceOne: "Hypodermis", choiceTwo: "Epidermis", choiceThree: "Dermis", choiceFour: "Endothelium", correctAnswer: "Epidermis"),
        Question(text: "Which of this is not an axial bone?", choiceOne: "Cranium", choiceTwo: "Ribs", choiceThree: "Shoulder", choiceFour: "Patella", correctAnswer: "Shoulder"),
        Question(text: "What quadrant is the liver located?", choiceOne: "Right upper quadrant", choiceTwo: "Left upper quadrant", choiceThree: "Right lower quadrant", choiceFour: "Left lower quadrant", correctAnswer: "Right upper quadrant"),
        Question(text: "How many lobes does the brain have?", choiceOne: "Five", choiceTwo: "Four", choiceThree: "Six", choiceFour: "Two", correctAnswer: "Four"),
        Question(text: "Which of the following is the most superficial?", choiceOne: "Bones", choiceTwo: "Skin", choiceThree: "Sternum", choiceFour: "Lungs", correctAnswer: "Skin"),
        Question(text: "What is the main function of  the temporal lobe?", choiceOne: "Sight", choiceTwo: "Cognitive functions", choiceThree: "Heart rate", choiceFour: "Hearing", correctAnswer: "Hearing"),
        Question(text: "Which is the most lateral?", choiceOne: "Heart", choiceTwo: "Arm", choiceThree: "Sternum", choiceFour: "Pollex", correctAnswer: "Pollex"),
        Question(text: "What muscle does the axillary artery pass beneath?", choiceOne: "Sub scapularis", choiceTwo: "Pectoralis Minor", choiceThree: "Pectoralis Major", choiceFour: "Biceps Brachii", correctAnswer: "Pectoralis Minor")
    ]
    
    func getQuestionText() -> String{
        return questionArray[questionIndex].text
    }
    
    func getChoiceOneText() -> String{
        return questionArray[questionIndex].choiceOne
    }
    
    func getChoiceTwoText() -> String{
        return questionArray[questionIndex].choiceTwo
    }
    
    func getChoiceThreeText() -> String{
        return questionArray[questionIndex].choiceThree
    }
    
    func getChoiceFourText() -> String{
        return questionArray[questionIndex].choiceFour
    }
    
    func getAnswer() -> String{
        return questionArray[questionIndex].correctAnswer
    }
    
    func getIndexNumber() -> Int{
        return questionIndex
    }
    
    func getQuestionNumber() -> Int {
        return questionIndex + 1
    }
    
    func getProgress() -> Float{
        let progress = Float(questionIndex + 1) / Float(questionArray.count)
        return progress
    }
    
    func updateIndex(){
        if questionIndex  < questionArray.count - 1{
            questionIndex += 1
        }
    }
    
    func resetIndex(){
        questionIndex = 0
    }
    
    
    
}
