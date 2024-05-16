//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//        // 정적 리스트 보기
//        List {
//            // 각각의 데이터 추가
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        // 동적 리스트 보기
//        List(landmarks) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        // 각각의 행을 눌렀을 때 이동할 페이지
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        // 각각의 행을 꾸미는 View
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
