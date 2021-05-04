//
//  ScoreViewController.swift
//  HumanBodyQuiz
//
//  Created by Jandir Porta on 9/23/20.
//  Copyright © 2020 Jandir Porta. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    var score : Int?
    var name : String?
    
    @IBOutlet weak var performanceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFeedback()
    }
    
    func setFeedback(){
        
        if let name = name{
            nameLabel.text = name
        }
        if let score = score{
            scoreLabel.text = String(score)
            performanceLabel.text = calculatePerformanceText(score: score)
            view.backgroundColor = calculateBackgroundColor(score: score)
        }
        
    }
    
    func calculatePerformanceText(score : Int) -> String{
        if score <= 4{
            return "STUDY MORE"
        }
        else if score <= 6 {
            return "GOOD JOB"
        }
        else{
            return "FANTASTIC"
        }
    }
    
    func calculateBackgroundColor(score : Int) -> UIColor{
        if score <= 4{
            return UIColor.red
        }
        else if score <= 6 {
            return UIColor.yellow
        }
            
        else{
            return UIColor.green
        }
    }
    
    @IBAction func tryAgainButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

