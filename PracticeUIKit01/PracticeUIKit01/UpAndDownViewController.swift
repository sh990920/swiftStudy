//
//  UpAndDownViewController.swift
//  PracticeUIKit01
//
//  Created by 박승환 on 4/22/24.
//

import UIKit

class UpAndDownViewController: UIViewController {
    
    private var randomNumber: Int = 0
    private var playCount: Int = 0

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
    
    lazy var playerCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0 회차"
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
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var twoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var threeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var fourButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var fiveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var sixButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var sevenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var eightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var nineButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var tenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var createRandomNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("랜덤 숫자생성", for: .normal)
        button.setBackgroundColor(.lightGray, for: .normal)
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
        playStackView.addArrangedSubview(playerCountLabel)
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
        
        oneButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        oneButton.tag = 1
        
        twoButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        twoButton.tag = 2
        
        threeButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        threeButton.tag = 3
        
        fourButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        fourButton.tag = 4
        
        fiveButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        fiveButton.tag = 5
        
        sixButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        sixButton.tag = 6
        
        sevenButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        sevenButton.tag = 7
        
        eightButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        eightButton.tag = 8
        
        nineButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        nineButton.tag = 9
        
        tenButton.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        tenButton.tag = 10
        
        
        view.addSubview(createRandomNumberButton)
        createRandomNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive =  true
        createRandomNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        createRandomNumberButton.topAnchor.constraint(equalTo: containerInputStackView.bottomAnchor, constant: 100).isActive = true
        createRandomNumberButton.addTarget(self, action: #selector(didTapCreateRandomNumberButton), for: .touchUpInside)
    }
    
    @objc private func didTapCreateRandomNumberButton() {
        randomNumber = Int.random(in: 1...10)
        playCount = 0
        playerCountLabel.text = "\(playCount) 회차"
        gamePlayLabel.text = "시작할 준비가 되었습니다!"
        
    }
    
    private func checkTheNumber(with sender: UIButton) {
        if sender.tag < randomNumber {
            playerInputLabel.text = "UP"
        } else if sender.tag > randomNumber {
            playerInputLabel.text = "DOWN"
        } else {
            playerInputLabel.text = "정답입니다!"
        }
        playCount += 1
        playerCountLabel.text = "\(playCount) 회차"
    }
    
    @objc func didTapNumberButton(_ sender: UIButton) {
        guard gamePlayLabel.text != "Guess what?" else { return }
        checkTheNumber(with: sender)
    }
}

// UIButton 확장
extension UIButton {
    // setBackgroundColor 메소드 추가
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y:0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
