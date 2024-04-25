//
//  GameViewController.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    @IBAction func goToMain(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainViewController", sender: self)
    }
}
