//
//  LocationView.swift
//  Dimply
//
//  Created by Theresa Tiffany on 20/08/23.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group{
            if locationManager.userLocation == nil {
               LocationRequestView()
            } else if let location = locationManager.userLocation{
                Text("\(location)")
                    .onAppear {
                        locationManager.requestLocation()
                    }
                    .padding()
                
                Button {
                    
                    print("activated")
                    print("\(location)")

                } label: {
                    Text("Start Geofencing")
                }

                
                // User Notification
                Button {
                    notify.askPermission()
                } label: {
                    Text("Request Permission")
                }
                
                
                DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
    
                Button {
                    notify.sendNotification(date: selectedDate, type: "date", title: "Great", body: "This is a reminder you set from the picker")
                } label: {
                    Text("Scheduled Notifications")
                        .tint(.orange)
                }

                Button {
                    notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: "Hai", body: "This is a reminder")
                    print("success")
                } label: {
                    Text("Remind me in 5 seconds")
                }

                

            }
        }
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
