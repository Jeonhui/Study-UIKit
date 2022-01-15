//
//  ViewController.swift
//  ch08
//
//  Created by 이전희 on 2022/01/14.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
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
    
    
    func goLocation(latitudeValue:CLLocationDegrees, longitudeValue:CLLocationDegrees, delta span :Double)->CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue:CLLocationDegrees, longitudeValue:CLLocationDegrees, delta span:Double, title strTitle:String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation  = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!,completionHandler: {
            (placemarks, error)->Void in
            let pm = placemarks!.first
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
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManger.startUpdatingLocation()

        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.33739753631028, longitudeValue: 127.26574656604181, delta: 0.1, title: "한국외대 글로벌", subtitle: "경기도 용인시 처인구 모현읍 외대로 81")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "김포고등학교"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.61856537391298, longitudeValue: 126.71250125599356, delta: 0.1, title: "김포고등학교", subtitle: "경기도 김포시 봉화로 51번길")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "김포고등학교"
            
        }
        
    }
    

}

