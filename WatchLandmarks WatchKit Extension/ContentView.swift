//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Elijah Lamoureux on 10/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
