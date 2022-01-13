import UIKit

class ViewController: UIViewController {
    
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var lblTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let Date = sender.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: Date)
    }
    
    @objc func updateTime(){
        lblTimer.text = "타이머: " + String(count)
        count+=1
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    

}

