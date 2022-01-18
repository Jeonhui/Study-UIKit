//
//  ViewController.swift
//  ch15 CameraPhotoLibrary
//
//  Created by 이전희 on 2022/01/18.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage:UIImage!
    var videoURL:URL!
    var flagImageSave = false
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            present(imagePicker,animated: true,completion: nil)
        }else{
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker,animated: true,completion:nil)
        }else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
        
    }
    @IBAction func btnRecordViedeoFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            present(imagePicker,animated: true,completion: nil)
        }else{
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker,animated: true,completion:nil)
        }else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            imgView.image = captureImage
        }else if mediaType.isEqual(to: kUTTypeMovie as NSString as String){
            if flagImageSave{
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func myAlert(_ title:String, message:String){
        let alert = UIAlertController(title:title, message:message,preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title:"Ok",style: UIAlertAction.Style.default,handler: nil)
        
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }

}

