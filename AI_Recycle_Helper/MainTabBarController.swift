//
//  MainTabBarController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-03-27.
//

import UIKit
import CoreML
import Vision
import Social


class MainTabBarController: UITabBarController, UIImagePickerControllerDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate{
    
    var r = ["","",""]
    var UIimage = UIImage()
    var imagePicker2 = UIImagePickerController()
 
    var classificationResults : [VNClassificationObservation] = []
 
    let button = UIButton.init(type: .custom)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.delegate=self
        imagePicker2.delegate = self
         print("hey")
        // Do any additional setup after loading the view.
        
        

        button.backgroundColor = UIColor(red:176.0/255.0, green:176.0/255.0, blue:176.0/255.0, alpha: 1.0)
        button.setImage(UIImage(named: "cameraImage"), for: .normal)
        button.layer.cornerRadius = 27.5
        //button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.addTarget(self,
                          action: #selector(cameraButtonisPress(_:)),
                           for: .touchUpInside)
        
        self.view.insertSubview(button, aboveSubview: self.tabBar)
        
    }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // safe place to set the frame of button manually
        print(self.view.bounds.height)
        
        //self.tabBar.center.x - width/2
        button.frame = CGRect.init(x: self.tabBar.center.x-27.5, y: self.view.bounds.height*(8/9), width: 55, height: 55)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   /*
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 3 {
                print(viewController.tabBarItem.tag)
            return false
        } else {
            return true
        }
    }
    */
    
    func detect(image: CIImage) {
        print("decting...............")
        // Load the ML model through its generated class
        guard let model = try? VNCoreMLModel(for: AIDetectModel().model) else {
            fatalError("can't load ML model")
        }
 
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first
                 
                else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }
            for i in 0..<3{
                self.r[i] = results[i].identifier
                
            }
            print(self.r)
            //print("third \(results[2].identifier)")
        }
 
        let handler = VNImageRequestHandler(ciImage: image)
 
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        performSegue(withIdentifier: "goToAIDetectResult", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToAIDetectResult" {
                let destinationVC = segue.destination as! AIViewController
                destinationVC.results = r
                //print("The image2", UIimage)
                destinationVC.theImage = UIimage
                
                
           }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
        if let image = info[.originalImage] as? UIImage {
            self.UIimage = image
            //self.photoImageView.image = image
            self.imagePicker2.dismiss(animated: true, completion: nil)
            guard let ciImage = CIImage(image: image) else {
                fatalError("couldn't convert uiimage to CIImage")
            }
            self.detect(image: ciImage)
            
            //print("The image" , image)
        }
        
    }
    
    
    @IBAction func cameraButtonisPress(_ sender:UIButton){
        openCamers()
           // print("press")
      
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if item.tag == 1 {

               // openCamers()
                
                
//                let secondVC = storyboard?.instantiateViewController(identifier: "homeViewController") as! HomeViewController
//
//                        //secondVC.modalPresentationStyle = .fullScreen
//                        //secondVC.modalTransitionStyle = .crossDissolve
//                self.definesPresentationContext = true
//                    secondVC.modalPresentationStyle = .currentContext
//                        present(secondVC, animated: true, completion: nil)
            
                print(selectedIndex)
                print("iam here")
            }
        
          
    }
    
    func openCamers(){
        self.imagePicker2.sourceType = .camera
        self.imagePicker2.allowsEditing = false
        present(imagePicker2, animated: true, completion: nil)
    }
}
    
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

