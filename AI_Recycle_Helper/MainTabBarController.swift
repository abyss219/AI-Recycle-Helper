//
//  MainTabBarController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-03-27.
//

import UIKit

class MainTabBarController: UITabBarController {
  
    var aiVC = AiDetectViewController();
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        return true
    }
    
    
    
    
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if item.tag == 1 {
                //aiVC.openCamers()
                print("1")
            }

          
    }
    
}
