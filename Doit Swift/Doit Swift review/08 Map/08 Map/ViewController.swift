//
//  ViewController.swift
//  08 Map
//
//  Created by 이전희 on 2022/05/18.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation,span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudevalue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudevalue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last
        
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placeMarks, error) -> Void in
            let pm = placeMarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManger.stopUpdatingLocation()
        
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            //현재 위치
            self.lblLocationInfo2.text = ""
            self.lblLocationInfo2.text = ""
            locationManger.startUpdatingLocation()

        }else if sender.selectedSegmentIndex == 1{
            //한국외국어대학교
            setAnnotation(latitudevalue: 37.337300, longitudeValue: 127.265520, delta: 0.01, title: "한국외국어대학교", subtitle: "경기 용인시 처인구 모현읍 외대로 81 한국외국어대학교")
            lblLocationInfo1.text = "보고 계신 위치"
            lblLocationInfo2.text = "한국외국어대학교 글로벌 캠퍼스"
        }else if sender.selectedSegmentIndex == 2{
            //카카오
            setAnnotation(latitudevalue: 37.402089, longitudeValue: 127.108442, delta: 0.01, title: "카카오 판교 오피스", subtitle: "경기 성남시 분당구 판교역로 235 에이치스퀘어 엔동")
            lblLocationInfo1.text = "보고 계신 위치"
            lblLocationInfo2.text = "카카오 판교 오피스"
        }
    }
    
}

