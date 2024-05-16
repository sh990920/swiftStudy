//
//  CircleImage.swift
//  SwiftUIStudy01
//
//  Created by 박승환 on 5/14/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
//        // 이미지 이름을 사용하여 이미지 생성
//        Image("turtlerock")
//            // 이미지 모양 수정
//            .clipShape(Circle())
//            // 테두리 추가
//            .overlay {
//                Circle().stroke(.white, lineWidth: 4)
//            }
//            // 그림자 추가
//            .shadow(radius: 7)
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
