//
//  ViewController.swift
//  mission3
//
//  Created by 이전희 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var cnt = 0
    var alarmOn = true
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var pickerTime: UILabel!
    
    @IBOutlet var check: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 HH:mm"
        pickerTime.text = formatter.string(from: datePickerView.date)
        alarmOn = true
        cnt = 0
        check.text = String(cnt)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 HH:mm"
        currentTime.text = formatter.string(from: date as Date)
        
        if pickerTime.text == currentTime.text && alarmOn{
            let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
            let yesAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {
                ACTION in self.alarmOn = false
                self.cnt = 0
            })
            alarmAlert.addAction(yesAction)
            present(alarmAlert, animated: true, completion: nil)
        }
        
        if alarmOn == false{
            cnt += 1
            if cnt>60{
                alarmOn = true
                cnt = 0
            }
            check.text = String(cnt)
        }
        
    }
}

