//
//  ViewController.swift
//  Jeonhui
//
//  Created by 이전희 on 2022/06/24.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet var myView: UIView!
    
    var popupClosure: (()->Void)?
    
    var popupDelegate: popupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 5
    }

    @IBAction func onBgCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //MARK: Move Btn
    
    @IBAction func loadPortfolio(_ sender: UIButton) {
        print("PopUpViewController - loadPortfolio called")
        if let popupClosure = popupClosure {
            popupClosure()
        }
    }
    //protocol delegate
    @IBAction func loadGithub(_ sender: UIButton) {
        print("PopUpViewController - loadGithub called")
        popupDelegate?.loadGithub()
        self.dismiss(animated: true)
    }
    @IBAction func loadWordle(_ sender: UIButton) {
        print("PopUpViewController - loadWordle called")
        popupDelegate?.loadWordle()
        self.dismiss(animated: true)
    }
    @IBAction func loadGoogle(_ sender: UIButton) {
        print("PopUpViewController - loadGoogle called")
        popupDelegate?.loadGoogle()
        self.dismiss(animated: true)
    }
    @IBAction func loadNaver(_ sender: UIButton) {
        print("PopUpViewController - loadNaver called")
        popupDelegate?.loadNaver()
        self.dismiss(animated: true)
    }
    
    // Notification Center
    @IBAction func loadApple(_ sender: UIButton) {
        print("PopUpViewController - loadApple called")
        NotificationCenter.default.post(name: Notification.Name(notificationName), object: nil)
        self.dismiss(animated: true)
    }
    
    
}

