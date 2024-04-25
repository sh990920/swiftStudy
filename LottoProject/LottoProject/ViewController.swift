//
//  ViewController.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ChangeVIewButton(_ sender: Any) {
        print("클릭")
        guard let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameView") as? GameViewController else { return }
        // 화면 전환 애니메이션 설정
        gameViewController.modalTransitionStyle = .coverVertical
        // 전환된 화면이 보여지는 방법 설정 (fullScreen)
        gameViewController.modalPresentationStyle = .fullScreen
        self.present(gameViewController, animated: true, completion: nil)
    }
    
}

