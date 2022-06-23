import UIKit

class CustomPopUpViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    
    var moveBtnCompletionClosure: (()->Void)?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("CustomPopUpviewController")
        contentView.layer.cornerRadius = 30
    }

    @IBAction func move(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
        //아무것도 안하지만 알려줌
        if let moveBtnCompletionClosure = moveBtnCompletionClosure {//main에 알린다.
            moveBtnCompletionClosure()
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

