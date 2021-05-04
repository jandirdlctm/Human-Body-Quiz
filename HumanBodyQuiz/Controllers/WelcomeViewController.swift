//
//  ViewController.swift
//  HumanBodyQuiz
//
//  Created by Jandir Porta on 9/18/20.
//  Copyright © 2020 Jandir Porta. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var startQuizButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var nameInput : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    //when the user presses "return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        return true
    }
    
    //What you want the textfield to do when the user is done editting.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = nameTextField.text{
            nameInput = name
        }
    }
    
    //when you want to not let the user leave the editing of the textfield, because they have not typed anything.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Please enter your nickname"
            return false
        }
    }
    
    //dismissing the keyboard
    @IBAction func dismissKeyboard(_sender: UITapGestureRecognizer){
        nameTextField.resignFirstResponder()
    }


    @IBAction func startQuizClicked(_ sender: UIButton) {
        if nameTextField.text == ""{
            nameTextField.placeholder = "Please enter your nickname"
        }
        if let name = nameInput{
            print(name)
            self.performSegue(withIdentifier: "goToQuiz", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuiz"{
            let quizViewController = segue.destination as! QuizViewController
            quizViewController.name = nameInput
        }
    }
    
}

