//
//  ViewController.swift
//  ch11 navigation
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController,EditDeligate {
    
    @IBOutlet var txtMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewContoller = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewContoller.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton"{
            editViewContoller.textWayValue = "segue : use Bar button"
        }
        editViewContoller.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
}

