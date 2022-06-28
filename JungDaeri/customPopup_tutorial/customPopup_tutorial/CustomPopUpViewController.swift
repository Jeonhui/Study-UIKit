import UIKit

class CustomPopUpViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    
    var moveBtnCompletionClosure: (()->Void)?
    
    var myPopUpDelegate : popupDelegate? // 리모컨을 가져옴
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("CustomPopUpviewController")
        contentView.layer.cornerRadius = 30
    }

    //MARK: - Action
    @IBAction func move(_ sender: UIButton) {
        self.dismiss(animated: true)
        //아무것도 안하지만 알려줌
        if let moveBtnCompletionClosure = moveBtnCompletionClosure {//main에 알린다.
            moveBtnCompletionClosure()
        }
    }
    
    @IBAction func move2(_ sender: UIButton) {
        print("move2 called")
        myPopUpDelegate?.onMove2() // 리모컨을 누른 것
        self.dismiss(animated: true)
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

