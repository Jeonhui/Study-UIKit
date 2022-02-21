//
//  ViewController.swift
//  ch17 sketch
//
//  Created by 이전희 on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblLineWidth: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLineWidth.text = String(describing: lineSize)
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imageView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imageView)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imageView)
        imageView.image?.draw(in: CGRect(x:0,y:0,width: imageView.frame.size.width,height: imageView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x:lastPoint.x,y:lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x:currPoint.x,y:currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        lastPoint = currPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imageView.image?.draw(in: CGRect(x:0,y:0,width: imageView.frame.size.width,height: imageView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x:lastPoint.x,y:lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x:lastPoint.x,y:lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            imageView.image = nil
        }
    }
    @IBAction func btnColorBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    @IBAction func btnColorRed(_ sender: UIButton) {
        lineColor = UIColor.systemRed.cgColor
    }
    @IBAction func btnColorGreen(_ sender: UIButton) {
        lineColor = UIColor.systemGreen.cgColor
    }
    @IBAction func btnColorBlue(_ sender: UIButton) {
        lineColor = UIColor.systemBlue.cgColor
    }
    
    @IBAction func changeLineWidth(_ sender: UITextField) {
        lineSize = CGFloat((sender.text! as NSString).floatValue)
    }
    
}

