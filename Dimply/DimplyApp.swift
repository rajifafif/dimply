//
//  DimplyApp.swift
//  Dimply
//
//  Created by Rajif Afif on 18/08/23.
//

import SwiftUI

@main
struct DimplyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
