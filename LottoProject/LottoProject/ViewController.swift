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
        // Do any additional setup after loading the view.
    }

    @IBAction func ChangeVIewButton(_ sender: Any) {
        print("클릭")
        performSegue(withIdentifier: "viewChange", sender: self)
    }
    
    @IBAction func unwindToMainViewController(_ segue: UIStoryboardSegue) {
        // 아무 추가 동작이 필요하지 않습니다.
    }
    
}

