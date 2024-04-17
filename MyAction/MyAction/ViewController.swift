//
//  ViewController.swift
//  MyAction
//
//  Created by 박승환 on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    // outlet 설정하는 방법
    // 드래그 앤 드롭
    // button 생성 이후 control 클릭 후 드래그로 당기기
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapMyButton(_ sender: Any) {
        print("배경 색상을 바꿀께요!")
        
        if view.backgroundColor == .yellow {
            view.backgroundColor = .green
            helloLabel.text = "Hello"
        } else {
            view.backgroundColor = .yellow
            helloLabel.text = "Hello SeungHwan"
        }
        
    }
    
}

