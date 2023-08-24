//
//  Location.swift
//  Dimply
//
//  Created by Theresa Tiffany on 20/08/23.
//

import CoreLocation
import UserNotifications
import UIKit
//import UIKit

class LocationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate{
    var manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    @Published var distance: CLLocationDistance = 0.0
    
    var notificationCenter: UNUserNotificationCenter!
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.allowsBackgroundLocationUpdates = true
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG: Not determined")
        case .restricted:
            print("DEBUG: Not determined")
        case .denied:
            print("DEBUG: Denied")
        case .authorizedAlways:
            print("DEBUG: Auth always")
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
