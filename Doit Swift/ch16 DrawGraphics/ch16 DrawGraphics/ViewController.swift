//
//  ViewController.swift
//  ch16 DrawGraphics
//
//  Created by 이전희 on 2022/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x:70,y:50))
        context.addLine(to: CGPoint(x:270,y:250))
        context.strokePath()
        
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.move(to: CGPoint(x:170,y:200))
        context.addLine(to: CGPoint(x:270,y: 350))
        context.addLine(to: CGPoint(x:70,y: 350))
        context.addLine(to: CGPoint(x:170,y: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x:70,y:100,width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(x:70,y:50,width: 200,height: 100))
        context.strokePath()
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.addEllipse(in: CGRect(x:70,y:200,width: 200,height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x:100,y:50))
        context.addArc(tangent1End: CGPoint(x:250,y:50), tangent2End: CGPoint(x:250,y:200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x:250,y:200))
        
        context.move(to: CGPoint(x:100,y:250))
        context.addArc(tangent1End: CGPoint(x:270,y:250), tangent2End: CGPoint(x:100,y:400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x:100,y:400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        let rectangle = CGRect(x:70,y:50,width:200,height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        let circle = CGRect(x:70,y:200,width: 200,height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x:170,y:350))
        context.addLine(to: CGPoint(x:270,y:450))
        context.addLine(to: CGPoint(x:70,y:450))
        context.addLine(to: CGPoint(x:170,y:350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnFlower(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.systemGreen.cgColor)
        context.move(to: CGPoint(x:170,y:200))
        context.addLine(to: CGPoint(x:200,y:450))
        context.addLine(to: CGPoint(x:140,y:450))
        context.addLine(to: CGPoint(x:170,y:200))
        context.fillPath()
        context.strokePath()
        
        
        
        
        context.setStrokeColor(UIColor.systemPink.cgColor)
        context.setFillColor(UIColor.systemPink.cgColor)
        context.addEllipse(in: CGRect(x:170,y:150,width: 100,height: 100))
        context.addEllipse(in: CGRect(x:70,y:150,width: 100,height: 100))
        context.addEllipse(in: CGRect(x:120,y:100,width: 100,height: 100))
        context.addEllipse(in: CGRect(x:120,y:200,width: 100,height: 100))
        context.fillPath()
        context.strokePath()
        
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.setFillColor(UIColor.yellow.cgColor)
        context.addEllipse(in: CGRect(x:120,y:150,width: 100,height: 100))
        context.fillPath()
        context.strokePath()
        
        
        
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    

}

