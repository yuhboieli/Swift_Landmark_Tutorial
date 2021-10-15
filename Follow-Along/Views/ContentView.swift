//
//  ContentView.swift
//  Follow-Along
//
//  Created by Elijah Lamoureux on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
