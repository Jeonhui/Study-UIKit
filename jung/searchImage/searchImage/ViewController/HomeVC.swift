//
//  ViewController.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: BaseVC,  UISearchBarDelegate, UIGestureRecognizerDelegate {
    var isPicSearch:Bool = true
    var picSearchString:String = ""
    var userSearchString:String = ""
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var CSegment: UISegmentedControl!
    @IBOutlet var CSearchBar: UISearchBar!
    @IBOutlet var CIndicator: UIActivityIndicatorView!
    @IBOutlet var searchBtn: UIButton!
    
    var keyboardDissmissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:nil)
    
    override func viewDidAppear(_ animated: Bool) {
        self.CSearchBar.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeVC - viewDidLoad()")
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        self.config()
        
    }
    fileprivate func config(){
        self.CSearchBar.delegate = self // 연결
        self.keyboardDissmissTabGesture.delegate = self
        self.view.addGestureRecognizer(keyboardDissmissTabGesture)
    }
    
    
    @IBAction func onChangeMode(_ sender: UISegmentedControl) {
        var searchbarTitle = ""
        switch sender.selectedSegmentIndex{
        case 0:
            searchbarTitle = "사진 키워드"
            userSearchString = CSearchBar.text ?? ""
            CSearchBar.text = picSearchString
        case 1:
            searchbarTitle = "사용자 이름"
            picSearchString = CSearchBar.text ?? ""
            CSearchBar.text = userSearchString
        default:
            searchbarTitle = "사진 키워드"
        }
        self.CSearchBar.placeholder = searchbarTitle + " 입력"
        
        self.CSearchBar.becomeFirstResponder() // focusing
        
    }
    
    
    fileprivate func pushVC(){
        var segueID:String = ""
        switch CSegment.selectedSegmentIndex{
        case 0:
            segueID = "goToPhotoCollectionVC"
        case 1:
            segueID = "goToUserListVC"
        default:
            segueID = "goToPhotoCollectionVC"
        }
        
        //        let url = API.BASE_URL + "search/photos"
        
        guard let userInput = self.CSearchBar.text else {return}
        
        //        let queryParm = ["query": userInput,"client_id" : API.CLIENT_ID]
        //        AF.request(url, method: .get,parameters: queryParm).responseData(completionHandler: { response in
        //            debugPrint(response)
        //        })
        
        var urlToCall: URLRequestConvertible?
        
        switch CSegment.selectedSegmentIndex {
        case 0:
            urlToCall = router.searchPhotos(term: userInput)
        case 1:
            urlToCall = router.serchUsers(term: userInput)
        default:
            print("default")
        }
        
        if let urlConvertible = urlToCall {
            AlamofireManager
                .shared
                .session
                .request(urlConvertible)
                .validate()
                .responseData { response in
                    
                    self.performSegue(withIdentifier: segueID, sender: self)
                }
        }
    }
    
    
    @IBAction func onSearchBtn(_ sender: UIButton) {
        self.pushVC()
        
    }
    
    //MARK: - UISearchBar Delegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty){
            self.searchBtn.isHidden = true
            self.CSearchBar.resignFirstResponder() // focusing 해제
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                searchBar.resignFirstResponder()
            }
        }else{
            self.searchBtn.isHidden = false
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        if inputTextCount > 12 {
            self.view
                .makeToast("12자까지만 입력이 가능합니다.", duration: 1.0, position: .center)
            return false
        }else{
            return true
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let userInputString = searchBar.text else { return }
        if userInputString.isEmpty{
            self.view
                .makeToast("검색 키워드를 입력해주세요.", duration: 1.0, position: .center)
        }else{
            self.pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("gestureRecognizer")
        if touch.view?.isDescendant(of: CSegment) == true {
            print("segment touch")
            return false
        }else if touch.view?.isDescendant(of: CSearchBar) == true {
            print("searchbar touch")
            return false
        } else {
            view.endEditing(true)
            self.CSearchBar.resignFirstResponder()
        }
        return true
    }
    
    
    //MARK: 화면 넘어가기전에 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare \(segue.identifier!)")
        switch segue.identifier{
        case SEGUE_ID.USER_LIST_VC:
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue = self.CSearchBar.text else {return}
            nextVC.vcTitle = userInputValue + "👤"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            let nextVC = segue.destination as! PhotoCollectionVC
            guard let userInputValue = self.CSearchBar.text else {return}
            nextVC.vcTitle = userInputValue + "🏙"
        default:
            return
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear()")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear()")
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        print("HomeVC - keyboardWillShow")
        //키보드 사이즈 가져오기
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        {
            if keyboardSize.height < CSegment.frame.origin.y + 50{
                let distance = keyboardSize.height - (CSegment.frame.origin.y + 60)
                self.view.frame.origin.y = distance
            }
            print("\(keyboardSize.height) \(CSegment.frame.origin.y + 50)")
            
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        print("HomeVC - keyboardWillHide")
        self.view.frame.origin.y = 0
    }
    
}

