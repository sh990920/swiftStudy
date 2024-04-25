//
//  CustomChangeSegue.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import UIKit

class CustomChangeSegue: UIStoryboardSegue {
    override func perform() {
        let sourceView = self.source.view
        let destinationView = self.destination.view
        
        UIView.transition(from: sourceView!, to: destinationView!, duration: 0.5, options: .transitionFlipFromLeft) { (_) in
            // 화면 전환 후에 추가적인 작업을 수행할 수 있습니다.
        }
    }
    
}
