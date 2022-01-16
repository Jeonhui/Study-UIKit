//
//  EditViewController.swift
//  ch11 navigation
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

protocol EditDeligate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller:EditViewController, isOn:Bool)
    func didImageZoomDone(_ controller:EditViewController, isZoom:Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDeligate?
    
    var isOn = false
    var isZoom = true
    
    @IBOutlet var ZoomIsOn: UISwitch!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
        ZoomIsOn.isOn = isZoom
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: self.isOn)
            delegate?.didImageZoomDone(self, isZoom: self.isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }
    
    @IBAction func swZoomChange(_ sender: UISwitch) {
        if sender.isOn{
            isZoom = true
        }else{
            isZoom = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
