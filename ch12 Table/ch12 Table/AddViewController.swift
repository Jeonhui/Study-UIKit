//
//  AddViewController.swift
//  ch12 Table
//
//  Created by 이전희 on 2022/01/16.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 100
    
    let pickImgName = ["cart.png","clock.png","pencil.png"]
    var pickImg = [UIImage?]()
    
    var idx = 0
    
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pickerImage: UIImageView!
    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<pickImgName.count{
            let img = UIImage(named: pickImgName[i])
            pickImg.append(img)
        }
        tfAddItem.text=""
        pickerImage.image = pickImg[0]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(pickImgName[idx])
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickImgName.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let iv = UIImageView(image: pickImg[row])
        iv.frame = CGRect(x:0, y:0, width:100, height: 100)
        return iv
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerImage.image = pickImg[row]
        idx = row
    }
    
    
    
}
