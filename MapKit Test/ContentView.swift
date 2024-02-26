//
//  ContentView.swift
//  MapKit Test
//
//  Created by Nawfal Cherkaoui Elmalki on 2/21/24.
//

import SwiftUI
import MapKit

//struct PickerValues {
//    let mapType: MKMapType
//    let description: String
//}

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.6016, longitude: -81.2005),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))

    @State var mapStyle: Int = 0
    
    let locations = [
        Location(name: "Test", coordinate: CLLocationCoordinate2D(latitude: 28.6016, longitude: -81.2005) )
    ]
    
    var selectedMapStyle: MapStyle {
           return switch(mapStyle) {
             case 0: .standard
             case 1: .hybrid
             case 2: .imagery
             default: .standard
           }
       }
    
    var body: some View {
        VStack() {
            Map(coordinateRegion: $mapRegion, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
                MapMarker(coordinate: location.coordinate)
                }}.mapStyle(selectedMapStyle)
                
                HStack(spacing: 50) {
                    Button("Standard") {
                        self.mapStyle = 0
                    }
                    Button("Hybrid") {
                        self.mapStyle = 1
                    }
                }
                
            }
        }

#Preview {
    ContentView()
}
