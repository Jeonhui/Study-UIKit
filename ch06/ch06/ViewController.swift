//
//  ViewController.swift
//  ch06
//
//  Created by 이전희 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRmv = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imgOn
    }
    
    @IBAction func btnOn(_ sender: UIButton) {
        if isLampOn == true {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
        }else{
            imageView.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func btnOff(_ sender: UIButton) {
        if isLampOn == true{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.imageView.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    @IBAction func btnRmv(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imgRmv
            self.isLampOn = false
        })
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imgOn
            self.isLampOn = true
        })
        
        lampRemoveAlert.addAction(removeAction)
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    

}

