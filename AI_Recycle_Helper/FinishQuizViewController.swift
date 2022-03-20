//
//  FinishQuizViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-03-06.
//

import UIKit

class FinishQuizViewController: UIViewController {
    //var score=0;
    var score:Int?;
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = ("Your score: "+String(score!)+"/100")
        //scoreLabel.text = String(format:"%.0f",score);
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
