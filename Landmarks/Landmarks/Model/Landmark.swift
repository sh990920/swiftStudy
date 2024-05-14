//
//  Landmark.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import Foundation
import SwiftUI
import CoreLocation

// Landmark.json 에 맞는 구조체 정의
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinate
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinate: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
