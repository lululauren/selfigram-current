//
//  ProfileViewController.swift
//  selfigram
//
//  Created by Lauren  Kemp on 2016-11-08.
//  Copyright © 2016 Lauren  Kemp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        usernameLabel.text = "Lauren"
    }

   

    

        @IBAction func cameraButtonPressed(sender: AnyObject) {
              print("Camera Button Pressed")
            
            let pickerController = UIImagePickerController()
            
    
            pickerController.delegate = self
            
            if TARGET_OS_SIMULATOR == 1 {
               
                pickerController.sourceType = .photoLibrary
            } else {
               
                pickerController.sourceType = .camera
                pickerController.cameraDevice = .front
                pickerController.cameraCaptureMode = .photo
            }
                    self.present(pickerController, animated: true, completion: nil)
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 1. When the delegate method is returned, it passes along a dictionary called info.
        //    This dictionary contains multiple things that maybe useful to us.
        //    We are getting an image from the UIImagePickerControllerOriginalImage key in that dictionary
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //2. To our imageView, we set the image property to be the image the user has chosen
            profileImageView.image = image
            
        }
        
        //3. We remember to dismiss the Image Picker from our screen.
        dismiss(animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
