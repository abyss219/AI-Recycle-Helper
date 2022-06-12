//
//  HomeViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import UIKit
import WebKit
class HomeViewController: UIViewController {

    @IBOutlet weak var webPage: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let myURL = URL(string:"https://recyclebc.ca/category/education/")
        webPage.load(URLRequest(url:URL(string:"https://recyclebc.ca/category/education/")!))
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
