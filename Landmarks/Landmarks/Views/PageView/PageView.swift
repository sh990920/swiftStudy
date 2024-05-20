//
//  PageView.swift
//  Landmarks
//
//  Created by 박승환 on 5/20/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currnetPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currnetPage)
            PageControl(numberOfPages: pages.count, currnetPage: $currnetPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map{ FeatureCard(landmark: $0) })
}
