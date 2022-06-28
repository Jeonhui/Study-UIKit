//
//  ViewController.swift
//  Picture_practice
//
//  Created by 이전희 on 2022/06/24.
//

import UIKit
import YPImagePicker


class ViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileChangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.profileImage.layer.cornerRadius = profileImage.frame.height/2
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }
    
    // 프사 변경 버튼이 클릭되었을 때
    @objc fileprivate func onProfileChangeBtnClicked(){
        
        // 카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        // config.screens = [.library,.photo, .video]
        config.screens = [.library]
        
        
        print("ViewController - onProfileChangeBtnClicked() called")
        let picker = YPImagePicker(configuration: config)
        
        // 사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                // 프사 이미지를 변경한다.
                self.profileImage.image = photo.image
            }
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
    }

    
}


