//
//  EditViewController.swift
//  11 Navigation
//
//  Created by 이전희 on 2022/05/19.
//

import UIKit

protocol EditDelegate { // protocol 형태의 delegate 생성
    func didMessageEditDone(_ controller:EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    
    var isOn  = false
    
    var delegate: EditDelegate? // delegate 변수 생성 (ViewController가 EidtDelegate를 상속받아서 가능)
    
    @IBOutlet var lblWay: UILabel!
    // 전달 받은 형태
    @IBOutlet var txMessage: UITextField!
    // 입력 메시지
    @IBOutlet var swIsOn: UISwitch!
    
    
    // (2) ViewController에서 edit Button 또는 edit Bar Button을 눌렀을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        //실행 되기 전에 ViewController로 부터 textWayValue와 textMessage를 전달 받았음
        lblWay.text = textWayValue
        txMessage.text = textMessage
        
        swIsOn.isOn = isOn
    }
    
    // (3)
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            // delegate의 didMessageEditDone 함수 호출
            // ViewController에서 delagate에 self를 전달 해줬음
            delegate?.didMessageEditDone(self, message: "edit : " + txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: self.isOn)
        } // delegate를 제대로 불러왔으면, 수정 화면의 텍스트 필드 내용을 메시지 문자열로 전달
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }
    
}
