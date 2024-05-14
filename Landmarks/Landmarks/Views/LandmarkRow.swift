//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

struct LandmarkRow: View {
    // 속성을 추가하면 초기화 중 유형에 랜드마크 인스턴스가 필요하기 떄문에 캔버스의 미리보기 작동이 중지된다.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

// Group 보기는 콘텐츠를 그룹화 하기위한 컨테이너이다.
#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

//#Preview("Turtle Rock") {
//    // 뷰 인스턴스 수정
//    LandmarkRow(landmark: landmarks[0])
//}
// 두번째 미리보기 - 설정을 추가하면 미리보기에 두개가 추가되어 확인이 가능하다.
//#Preview("Salmon") {
//    LandmarkRow(landmark: landmarks[1])
//}
