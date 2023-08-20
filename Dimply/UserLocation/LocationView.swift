//
//  LocationView.swift
//  Dimply
//
//  Created by Theresa Tiffany on 20/08/23.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group{
            if locationManager.userLocation == nil {
               LocationRequestView()
            } else  if let location = locationManager.userLocation{
                Text("\(location)")
                    .padding()
            }
        }
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
