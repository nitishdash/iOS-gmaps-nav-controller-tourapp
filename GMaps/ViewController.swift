//
//  ViewController.swift
//  GMaps
//
//  Created by Nitish Dash on 4/11/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}

class ViewController: UIViewController {

    var mapView: GMSMapView?
    
//    var currentDestination = VacationDestination(name: "IGI Airport", location: CLLocationCoordinate2DMake(28.5561015, 77.0954995), zoom: 12)
    
    var currentDestination: VacationDestination?
    
    let destinations = [VacationDestination(name: "Hauz Khas Village", location: CLLocationCoordinate2DMake(28.5519493, 77.1941111), zoom: 12)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GMSServices.provideAPIKey("AIzaSyCcggx1VXRsmf7n16epL2OsEcQxZ8MUGN4")
        
        let camera = GMSCameraPosition.camera(withLatitude: 28.5561015, longitude: 77.0954995, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(28.5561015, 77.0954995)
        let marker = GMSMarker(position: currentLocation)
        
        marker.title="IGI Airport"
        marker.snippet="Welcome to New Delhi! 😄"
        marker.map = mapView
        

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "NEXT", style: UIBarButtonItemStyle.plain , target: self, action: #selector(ViewController.next as (ViewController) -> () -> ()))
        
//        28.5519493 77.1941111
  
        
        
    }
    
    
//    9777002455 girishparida78@gmail.com
    
    
    
    func next(){
        print("NEXT STUFF")
        
        if currentDestination == nil {
            currentDestination = destinations.first!
            
            mapView?.camera = GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: 12)
            
            let marker = GMSMarker(position: (currentDestination?.location)!)
            marker.title="Hauz Khas Village!"
            marker.snippet="HKV is the party capital of New Delhi. Epic nightlife, sky roof eateries and dining spots make this a must visit for those socialites! 😄"
            marker.map = mapView
        }
        
//        let nextLocation = CLLocationCoordinate2DMake(28.5519493, 77.1941111)
//        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 12)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

