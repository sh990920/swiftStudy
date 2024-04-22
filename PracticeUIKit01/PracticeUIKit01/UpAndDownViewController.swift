//
//  UpAndDownViewController.swift
//  PracticeUIKit01
//
//  Created by 박승환 on 4/22/24.
//

import UIKit

class UpAndDownViewController: UIViewController {

    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var gamePlayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Guess what?"
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        return label
    }()
    
    lazy var playerInputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "숫자를 눌러주세요"
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        return label
    }()
    
    lazy var containerInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var secondInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var oneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var twoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var threeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var fourButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var fiveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var sixButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var sevenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var eightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var nineButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var tenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var createRandomNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("랜덤 숫자생성", for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(playStackView)
        view.addSubview(containerInputStackView)
        
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        playStackView.addArrangedSubview(gamePlayLabel)
        playStackView.addArrangedSubview(playerInputLabel)
        
        containerInputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerInputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        containerInputStackView.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 100).isActive = true
        containerInputStackView.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        containerInputStackView.addArrangedSubview(inputStackView)
        containerInputStackView.addArrangedSubview(secondInputStackView)
        
        inputStackView.addArrangedSubview(oneButton)
        inputStackView.addArrangedSubview(twoButton)
        inputStackView.addArrangedSubview(threeButton)
        inputStackView.addArrangedSubview(fourButton)
        inputStackView.addArrangedSubview(fiveButton)
        
        secondInputStackView.addArrangedSubview(sixButton)
        secondInputStackView.addArrangedSubview(sevenButton)
        secondInputStackView.addArrangedSubview(eightButton)
        secondInputStackView.addArrangedSubview(nineButton)
        secondInputStackView.addArrangedSubview(tenButton)
        
        view.addSubview(createRandomNumberButton)
        createRandomNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive =  true
        createRandomNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        createRandomNumberButton.topAnchor.constraint(equalTo: containerInputStackView.bottomAnchor, constant: 100).isActive = true
        
    }
    
}
