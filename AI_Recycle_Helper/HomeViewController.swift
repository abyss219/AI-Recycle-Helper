//
//  HomeViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import UIKit
import WebKit
class HomeViewController: UIViewController,WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var lastPageButton: UIButton!
    
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var homePageButton: UIButton!
    
    @IBOutlet weak var webPage: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let myURL = URL(string:"https://recyclebc.ca/category/education/")
        webPage.load(URLRequest(url:URL(string:"https://recyclebc.ca/category/education/")!))
        webPage.uiDelegate = self
        webPage.navigationDelegate = self
    }
    

    @IBAction func goToPrevious(_ sender: Any) {
        if (webPage.canGoBack){
            webPage.goBack()
        }

        
    }
    
    @IBAction func goToNext(_ sender: Any) {
        if (webPage.canGoForward){
            webPage.goForward()
        }

    }


    @IBAction func homeButton(_ sender: UIButton) {
        viewDidLoad()
    }
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        
            if let frame = navigationAction.targetFrame,
                frame.isMainFrame {
                return nil
            }
            webView.load(navigationAction.request)
            return nil
        
        }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) { // triggers when loading is complete
        if (webView.canGoForward){
            nextPageButton.tintColor=UIColor(red: 151/255, green: 202/255, blue: 86/255, alpha: 1.0)
        }else{
            nextPageButton.tintColor=UIColor(red: 142/255, green: 142/255, blue: 148/255, alpha: 1.0)
        }
        
        if (webView.canGoBack){
            lastPageButton.tintColor=UIColor(red: 151/255, green: 202/255, blue: 86/255, alpha: 1.0)
        }
        else{
            lastPageButton.tintColor=UIColor(red: 142/255, green: 142/255, blue: 148/255, alpha: 1.0)
        }
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
