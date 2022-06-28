//
//  ViewController.swift
//  11 Navigation
//
//  Created by 이전희 on 2022/05/19.
//

import UIKit


class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
    }
    
    
    // view -> edit(done) -> view
    // (1) editButton 또는 editBarButton을 눌렀을 때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        // as! (다운 캐스팀) segue.desination을 EditViewController class 로 변환
        
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        //editViewController의 textWayValue의 문자열을 변경
        
        editViewController.textMessage =  "main : " + txMessage.text!
        //editViewController의 textMessage를 ViewController의 txMessage의 text로 변경
        
        editViewController.isOn = isOn
        
        editViewController.delegate = self
        // editViewController의 delegate에 자기 자신을 전달
    }
    
    
    
    // (4) delegate로 전달 받은 것을 txMessage.text에 저장
    // Edit Delegate 함수 생성
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
        // message 전달 받은 것을 txMessage에 저장
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool){
        if isOn{
            self.isOn = true
            imgView.image = imgOn
        }else{
            self.isOn = false
            imgView.image = imgOff
        }
    }
    
}

