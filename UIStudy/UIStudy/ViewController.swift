//
//  ViewController.swift
//  UIStudy
//
//  Created by 박승환 on 4/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textOutlet.text = "Hello"
    }


    @IBAction func buttonAction(_ sender: Any) {
        textOutlet.backgroundColor = .white
        textOutlet.textColor = .black
        textOutlet.text = "클릭하였습니다!"
    }
}

