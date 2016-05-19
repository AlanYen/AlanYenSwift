//
//  ViewController.swift
//  21-Set Location
//
//  Created by AlanYen on 2016/5/19.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    var locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Set Location"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshButtonClicked(sender: UIButton) {
    
        locationLabel.text = "更新中..."
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func setup() {
        
        // CLLocationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
            case .NotDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .AuthorizedAlways, .AuthorizedWhenInUse:
                locationManager.startUpdatingLocation()
            default:
                print("didChangeAuthorizationStatus: \(status)")
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        locationManager.stopUpdatingLocation()

        // Current location
        userLocation = locations.last?.coordinate

        // Location to address
        reverseGeoCoding()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        locationLabel.text = "無法取得位置..."
        print("didFailWithError: \(error.description)")
    }
    
    func reverseGeoCoding() {
        
        if userLocation == nil {
            return
        }
    
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: userLocation!.latitude, longitude: userLocation!.longitude)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            let placeMark: CLPlacemark? = placemarks?[0]
            
            // Address dictionary
            if placeMark?.addressDictionary != nil {
                print(placeMark?.addressDictionary)
            }
            
            var fullAddress: String =
                String(format: "%.4f, %.4f\n\n", self.userLocation!.latitude, self.userLocation!.longitude)
            
            // Country
            if let country = placeMark?.addressDictionary?["Country"] as? String {
                fullAddress = fullAddress + " " + country
                print(country)
            }
            
            // Zip code
            if let zip = placeMark?.addressDictionary?["ZIP"] as? String {
                fullAddress = fullAddress + " " + zip
                print(zip)
            }
            
            // City
            if let city = placeMark?.addressDictionary?["City"] as? String {
                fullAddress = fullAddress + " " + city
                print(city)
            }
            
            // Street address
            if let street = placeMark?.addressDictionary?["Thoroughfare"] as? String {
                fullAddress = fullAddress + " " + street
                print(street)
            }
            
            self.locationLabel.text = fullAddress
            
        })
    }
}