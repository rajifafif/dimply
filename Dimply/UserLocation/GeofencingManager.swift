//
//  GeofencingManager.swift
//  Dimply
//
//  Created by Theresa Tiffany on 22/08/23.
//

import UIKit
import CoreLocation

class GeofencingManager: UIViewController {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()
        
        
        // Your coordinates go here (lat, lon)
        let geofenceRegionCenter = CLLocationCoordinate2D(
            latitude: -6.30222,
            longitude: 106.65222
        )
//        let geofenceRegionCenter = CLLocationCoordinate2D(
//            latitude: -6.22552,
//            longitude: 106.65076
//        )
//        let geofenceRegionCenter = CLLocationCoordinate2D(
//            latitude: 37.33233141,
//            longitude: -122.0312186
//        )
        
        /* Create a region centered on desired location,
         choose a radius for the region (in meters)
         choose a unique identifier for that region */
        let geofenceRegion = CLCircularRegion(
            center: geofenceRegionCenter,
            radius: 10,
            identifier: "UniqueIdentifier"
        )
        
        geofenceRegion.notifyOnEntry = true
        geofenceRegion.notifyOnExit = true
        
        self.locationManager.startMonitoring(for: geofenceRegion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


