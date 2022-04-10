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
    
    var r = ["","","","",""]
    
    var imagePicker2 = UIImagePickerController()
 
    var classificationResults : [VNClassificationObservation] = []
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.delegate=self
        imagePicker2.delegate = self
         print("hey")
        // Do any additional setup after loading the view.
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
 
        return true
    }
    
    
    func detect(image: CIImage) {
        print("decting...............")
        // Load the ML model through its generated class
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("can't load ML model")
        }
 
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first
                 
                else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }
            for i in 0...4{
                self.r[i] = results[i].identifier
            }
            
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
        
           }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
        if let image = info[.originalImage] as? UIImage {
 
            //self.photoImageView.image = image
            self.imagePicker2.dismiss(animated: true, completion: nil)
            guard let ciImage = CIImage(image: image) else {
                fatalError("couldn't convert uiimage to CIImage")
            }
            self.detect(image: ciImage)
        }
    }
    
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if item.tag == 3 {
                openCamers()
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

