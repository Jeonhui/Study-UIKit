//
//  EditViewController.swift
//  ch11 navigation
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

protocol EditDeligate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDeligate?


    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
        }
        _ = navigationController?.popViewController(animated: true)
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
