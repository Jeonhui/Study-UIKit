//
//  ViewController.swift
//  06 Alert
//
//  Created by 이전희 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imgOn
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if (!isLampOn){
            isLampOn = true
            imageView.image = imgOn
        }else{
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if (isLampOn){
            let lampOffAlert = UIAlertController(title: "Lamp Off", message: "끔?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "ㅇㅇ", style: UIAlertAction.Style.default,handler: { ACTION in
                self.isLampOn = false
                self.imageView.image = self.imgOff
                
            })
            
            let cancleAction = UIAlertAction(title: "ㄴㄴ", style: UIAlertAction.Style.default,handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancleAction)
            
            present(lampOffAlert,animated: true, completion: nil)
        }else{
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default,handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert,animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampOffAlert = UIAlertController(title: "램프 제거", message: "제거?", preferredStyle: UIAlertController.Style.alert)
        
        let onAction = UIAlertAction(title: "켬", style: UIAlertAction.Style.default,handler: { ACTION in
            self.isLampOn = true
            self.imageView.image = self.imgOn
        })
        let offAction = UIAlertAction(title: "끔", style: UIAlertAction.Style.default,handler: { ACTION in
            self.isLampOn = false
            self.imageView.image = self.imgOff
        })
        let removeAction = UIAlertAction(title: "제거", style: UIAlertAction.Style.default,handler: { ACTION in
            self.isLampOn = false
            self.imageView.image = self.imgRemove
        })
        
        lampOffAlert.addAction(onAction)
        lampOffAlert.addAction(offAction)
        lampOffAlert.addAction(removeAction)
        
        present(lampOffAlert,animated: true, completion: nil)
    }
    
    
}

