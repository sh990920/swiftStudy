//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
