//
//  HintViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-02-13.
//

import UIKit

class HintViewController: UIViewController {
    var hint:String?
    @IBOutlet weak var hintText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hintText.text=hint
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
