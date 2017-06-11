//
//  MapClass.swift
//  ClassProjectv1.1
//
//  Created by Eric Liu on 10/17/16.
//  Copyright © 2016 EricLiu. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    @IBAction func toggle(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            map.mapType = MKMapType.Satellite
        }
        else{
            map.mapType = MKMapType.Standard
        }
    }
    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.mapType = MKMapType.Satellite
        
        
        let addressString = "350 5th Avenue, New York City, NY, 10018"
        getDirections(addressString)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDirections(sender: AnyObject) {
        
        
        let address = ( sender as! NSString)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString (address as String, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]  {
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                self.map.setRegion(region, animated: true)
                let ani = MKPointAnnotation()
                ani.coordinate = placemark.location!.coordinate

                ani.title = "New York City, New York"
                
                
                self.map.addAnnotation(ani)
            }
        })
    }
    
    
}
