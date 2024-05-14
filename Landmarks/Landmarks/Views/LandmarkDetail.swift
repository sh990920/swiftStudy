//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            // 스택 상단에 이전에 만든 MapView 를 추가
            MapView(coordinate: landmark.locationCoordinate)
            // .height 매개변수에 값을 추가하면 너비에 맞게 자동으로 조정된다.
                .frame(height: 300)
            // 스택 중간에 이전에 만든 CircleImage 추가
            CircleImage(image: landmark.image)
            // 지도 위에 이미지를 배치하기 위해서 이미지에 수직으로 -130 포인트의 오프셋을 지정, 보기 하단에도 -130포인트이 패딩을 지정
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Vstack앞쪽 가장자리를 기준으로 뷰를 정렬하도록 이니셜라이저를 편집
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    // Spacer는 내뇽에 의해서만 크기가 정의되는 대신 포함된 뷰가 상위 뷰의 모든 공간을 사용하도록 확장된다.
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                // 구분선 추가
                Divider()
                // 추가 설명 텍스트 추가
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            // padding 속성을 사용하여 외부 가장자리 주위에 조금 더 많은 공간을 제공한다.
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
