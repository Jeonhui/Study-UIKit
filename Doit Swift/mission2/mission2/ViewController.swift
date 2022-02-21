import UIKit

class ViewController: UIViewController {
    let timeSelector = #selector(ViewController.updateTime)
    let interval = 1.0
    var onOff = true

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var signal: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aa"
        lblTime.text = formatter.string(from: sender.date)
    }
    
    @IBAction func OnOff(_ sender: UISwitch) {
        if sender.isOn {
            onOff = true
            lblTime.textColor = UIColor.white
        }else{
            onOff = false
            lblTime.textColor = UIColor.darkGray
        }
    }
    
    @IBOutlet var aaa: UILabel!
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aa"
        lblCurrentTime.text = formatter.string(from: date as Date)
        
        if lblTime.text == lblCurrentTime.text && onOff{
            signal.startAnimating()
        }else{
            signal.stopAnimating()
        }
    }
}

