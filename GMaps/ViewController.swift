//
//  ViewController.swift
//  GMaps
//
//  Created by Nitish Dash on 4/11/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GMSServices.provideAPIKey("AIzaSyCcggx1VXRsmf7n16epL2OsEcQxZ8MUGN4")
        
        let camera = GMSCameraPosition.camera(withLatitude: 28.5561015, longitude: 77.0954995, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(28.5561015, 77.0954995)
        let marker = GMSMarker(position: currentLocation)
        
        marker.title="IGI Airport"
        marker.snippet="Welcome to New Delhi! 😄"
        marker.map = mapView
        

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "NEXT", style: UIBarButtonItemStyle.plain , target: self, action: #selector(ViewController.next as (ViewController) -> () -> ()))
    
  
    }
    
    
//    9777002455 girishparida78@gmail.com
    
    
    
    func next(){
        print("NEXT STUFF")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

