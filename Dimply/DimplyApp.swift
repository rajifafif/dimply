//
//  DimplyApp.swift
//  Dimply
//
//  Created by Rajif Afif on 18/08/23.
//

import SwiftUI
//import CoreLocation
//import UserNotifications

@main
struct DimplyApp: App {
//    @UIApplicationDelegateAdaptor(GeofencingNotifications.self) var appDelegate
    let persistenceController = PersistenceController.shared
    @StateObject var geofencingManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(geofencingManager)
        }
    }
}
