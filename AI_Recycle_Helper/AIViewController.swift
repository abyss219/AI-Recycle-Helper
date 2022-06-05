//
//  AIViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-04-03.
//
import UIKit


class AIViewController: UIViewController{

    
    @IBOutlet weak var resultText: UILabel!
    
    @IBOutlet weak var detectImage: UIImageView!


    var results = ["","","","",""]
    var theImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultText.text=results[0]
        print("the image 3",theImage)
        detectImage.image = theImage
       
    }
  
   

}
