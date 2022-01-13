//
//  ViewController.swift
//  mission1
//
//  Created by 이전희 on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    var numImage = 1
    let maxImage = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: String(numImage)+".png")
    }
    @IBAction func prevButton(_ sender: UIButton) {
        numImage = numImage-1
        if numImage < 1{
            numImage = maxImage
        }
        imgView.image = UIImage(named: String(numImage)+".png")
    }
    @IBAction func nextButton(_ sender: UIButton) {
        numImage = numImage+1
        if numImage > maxImage{
            numImage = 1
        }
        imgView.image = UIImage(named: String(numImage)+".png")
    }
}

