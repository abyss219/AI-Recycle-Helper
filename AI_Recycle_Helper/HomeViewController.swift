//
//  HomeViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import UIKit
import WebKit
class HomeViewController: UIViewController,WKUIDelegate {

    @IBOutlet weak var webPage: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let myURL = URL(string:"https://recyclebc.ca/category/education/")
        webPage.load(URLRequest(url:URL(string:"https://recyclebc.ca/category/education/")!))
        webPage.uiDelegate = self
    }
    

    @IBAction func goToPrevious(_ sender: Any) {
        if (webPage.canGoBack){
            webPage.goBack()
        }
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if let frame = navigationAction.targetFrame,
                frame.isMainFrame {
                return nil
            }
            webView.load(navigationAction.request)
            return nil
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
