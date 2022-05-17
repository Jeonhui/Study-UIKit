//
//  ViewController.swift
//  04 DatePicker
//
//  Created by 이전희 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var cTime:Date?
    var pTime:Date?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var lblCnt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분 EEE"
        lblPickerTime.text = "선택 시간 : "+formatter.string(from: datePickerView.date)
        pTime = datePickerView.date
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분 EEE"
        lblCurrentTime.text = "현재 시간" + formatter.string(from: date as Date)
        cTime = date as Date
        
        _ = cTime?.compare(pTime ?? Date())
    }
}

