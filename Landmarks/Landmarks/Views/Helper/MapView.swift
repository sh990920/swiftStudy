//
//  MapView.swift
//  SwiftUIStudy01
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI
import MapKit // 지도를 사용하기 위한 MapKit 추가

// 미리보기에는 Turtle Rock를 중심으로 한 지도가 표시된다.
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        // 지도를 보여주는 화면
        //Map(initialPosition: .region(region))
        Map(position: .constant(.region(region)))
    }
    
    // 지도와 지역 정보를 보유하는 비공개 계산 변수
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
