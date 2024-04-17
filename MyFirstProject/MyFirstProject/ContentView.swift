//
//  ContentView.swift
//  MyFirstProject
//
//  Created by 박승환 on 4/16/24.
//  modify

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, SeungHwan!")
                .font(.largeTitle)
                .padding(.leading, 0.0)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
