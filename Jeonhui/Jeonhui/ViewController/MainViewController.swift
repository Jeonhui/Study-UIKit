//
//  ViewController.swift
//  Jeonhui
//
//  Created by 이전희 on 2022/06/24.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification" // 방송 주파수 이름

class MainViewController: UIViewController, popupDelegate {

    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWeb("https://www.google.com")
        
        // notification이라는 방송 수신기를 장착
        // observer 감지할 VC, selector는 action, name 주파수 이름, object 이벤트 전달 데이터
        NotificationCenter.default.addObserver(self , selector: #selector(self.loadApple), name: NSNotification.Name(notificationName), object: nil)
    }
    @objc fileprivate func loadApple(){
        print("MainViewController - loadApple called")
        loadWeb("https://www.apple.com/kr")
    }
    //할당 해제 될 때
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func onPopUpViewBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil) // 스토리 보드 위치
        let popupViewController = storyboard.instantiateViewController(withIdentifier: "popup") as! PopUpViewController // 스토리보드 아이디
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        
        // closure 설정
        popupViewController.popupClosure = loadPortfolio
        // Delegate 설정
        popupViewController.popupDelegate = self
        self.present(popupViewController, animated: true)
    }
    
    private func loadWeb(_ url: String){
        let url = URLRequest(url: URL(string: url)!)
        myWebView.load(url)
    }
    
    //MARK: Closure
    func loadPortfolio() {
        print("MainViewController - loadPortfolio called")
        loadWeb("https://jeonhui.github.io")
    }
    
    //MARK: popupDelegate methods
    func loadGithub() {
        print("MainViewController - loadGithub called")
        loadWeb("https://www.github.com")
    }
    func loadWordle() {
        print("MainViewController - loadWordle called")
        loadWeb("https://jeonhui.github.io/wordle")
    }
    func loadGoogle() {
        print("MainViewController - loadGoogle called")
        loadWeb("https://www.google.com")
    }
    func loadNaver() {
        print("MainViewController - loadNaver called")
        loadWeb("https://www.naver.com")
    }
}

