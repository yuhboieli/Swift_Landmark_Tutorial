//
//  ModelData.swift
//  Follow-Along
//
//  Created by Elijah Lamoureux on 10/14/21.
//

import Foundation
import Combine

/*
 SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
 An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
 */
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json") // Will never change, no need for published annotation
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse ]\(filename) as \(T.self):\n\(error)")
    }
}
