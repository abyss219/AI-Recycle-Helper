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
        if (Double(score!)/100 >= 0.8){
            medalImage!.image=#imageLiteral(resourceName: "goldMedal")
        }else if (Double(score!)/100 >= 0.6){
            medalImage!.image=#imageLiteral(resourceName: "silverMedal")
        }else{
            medalImage!.image=#imageLiteral(resourceName: "bronzeMedal")
        }
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
           
    let largeBoldDoc = UIImage(systemName: "arrow.clockwise", withConfiguration: largeConfig)

        restartIcon.setImage(largeBoldDoc, for: .normal)
            

    }
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var medalImage: UIImageView!
    
    @IBOutlet weak var restartIcon: UIButton!
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
