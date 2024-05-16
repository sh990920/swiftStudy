//
//  ContentView.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
