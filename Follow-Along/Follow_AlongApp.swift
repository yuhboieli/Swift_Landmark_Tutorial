//
//  Follow_AlongApp.swift
//  Follow-Along
//
//  Created by Elijah Lamoureux on 10/13/21.
//

import SwiftUI

@main
struct Follow_AlongApp: App {
    /*
     Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.
     */
    @StateObject private var modelData = ModelData()

        var body: some Scene {
            let mainWindow = WindowGroup {
                ContentView()
                    .environmentObject(modelData)
            }

            #if os(macOS)
            mainWindow
            .commands {
                LandmarkCommands()
            }
            #else
            mainWindow
            #endif

            #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
            #endif
            
            #if os(macOS)
            Settings {
                LandmarkSettings()
            }
            #endif
        }
}
