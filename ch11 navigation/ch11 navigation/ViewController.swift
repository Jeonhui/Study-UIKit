//
//  ViewController.swift
//  ch11 navigation
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController,EditDeligate {
    
    let lampOn = UIImage(named: "lamp_on.png")
    let lampOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = true
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = lampOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let editViewContoller = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewContoller.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton"{
            editViewContoller.textWayValue = "segue : use Bar button"
        }
        
        editViewContoller.textMessage = txtMessage.text!
        editViewContoller.isOn = isOn
        editViewContoller.isZoom = isZoom
        editViewContoller.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imageView.image = lampOn
            self.isOn = true
        }else{
            imageView.image = lampOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        
        let scale:CGFloat = 2.0
        var newWidth:CGFloat = imageView.frame.width, newHeight:CGFloat = imageView.frame.height
        
        if !self.isZoom && isZoom{
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
            self.isZoom = true
        
        }else if self.isZoom && !isZoom{
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
            self.isZoom = false
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        
    }
}

