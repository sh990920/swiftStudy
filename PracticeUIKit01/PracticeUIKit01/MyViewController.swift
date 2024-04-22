//
//  MyViewController.swift
//  PracticeUIKit01
//
//  Created by 박승환 on 4/22/24.
//

import UIKit

class MyViewController: UIViewController {

    // @IBOutlet weak var nameLabel: UILabel!
    
    lazy var myNameTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "리이오"
        label.textAlignment = .center
        label.backgroundColor = .green
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        view.addSubview(myNameTextLabel)
        myNameTextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myNameTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myNameTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myNameTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        // 스토리 보드에서 설정한 이후 코드 실행이 되기 때문에
        // 아래의 text가 나오게 된다.
        // nameLabel.text = "리이오"
        
    }
    

//    @IBAction func didTabNameChangeButton(_ sender: Any) {
//        // nameLabel.text = "반가워요!"
//    }
}
