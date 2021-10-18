//
//  MapView.swift
//  Follow-Along
//
//  Created by Elijah Lamoureux on 10/13/21.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    /*
     You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.
     */
//    @State private var region = MKCoordinateRegion()
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        /*
         By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.
         */
        Map(coordinateRegion: .constant(region))
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
