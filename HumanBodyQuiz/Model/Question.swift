//
//  Question.swift
//  HumanBodyQuiz
//
//  Created by Jandir Porta on 9/19/20.
//  Copyright © 2020 Jandir Porta. All rights reserved.
//

import UIKit

struct Question {
    var text : String
    var choiceOne : String
    var choiceTwo : String
    var choiceThree : String
    var choiceFour : String
    var correctAnswer : String
    
    init(text : String, choiceOne : String, choiceTwo : String, choiceThree : String, choiceFour : String, correctAnswer : String) {
        self.text = text
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
        self.choiceThree = choiceThree
        self.choiceFour = choiceFour
        self.correctAnswer = correctAnswer
    }
}
