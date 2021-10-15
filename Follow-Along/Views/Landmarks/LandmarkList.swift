//
//  LandmarkList.swift
//  Follow-Along
//
//  Created by Elijah Lamoureux on 10/14/21.
//

import SwiftUI

struct LandmarkList: View {
    /*
     The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
     */
    @EnvironmentObject var modelData: ModelData
    
    /*
     Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
     */
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in (!showFavoritesOnly || landmark.isFavorite) }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
         LandmarkList()
            .environmentObject(ModelData())
    }
}
