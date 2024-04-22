//
//  ScissorsRockPaperGameViewController.swift
//  PracticeUIKit01
//
//  Created by 박승환 on 4/22/24.
//

import UIKit

enum InputState: String {
    case scissors
    case rock
    case paper
}

enum GameResult: String {
    case win = "이겼다"
    case draw = "비겼다"
    case lose = "졌다"
}

class ScissorsRockPaperGameViewController: UIViewController {
    
    let gameImageNameData:[InputState] = [.scissors, .rock, .paper]
    
    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var computerGameImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var myGameImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var scissorsButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var rockButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var paperButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var gameResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과는?"
        label.textColor = .white
        return label
    }()
    
    lazy var playerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Player?"
        label.textColor = .white
        return label
    }()
    
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "COM?"
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
        view.addSubview(gameResultLabel)
        gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 20).isActive = true
        gameResultLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        view.addSubview(computerLabel)
        computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 40).isActive = true
        computerLabel.leadingAnchor.constraint(equalTo: playStackView.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(playerLabel)
        playerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 40).isActive = true
        playerLabel.trailingAnchor.constraint(equalTo: playStackView.trailingAnchor, constant: -50).isActive = true
        
        view.addSubview(inputStackView)
        
        inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        inputStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputStackView.addArrangedSubview(scissorsButton)
        inputStackView.addArrangedSubview(rockButton)
        inputStackView.addArrangedSubview(paperButton)
        
        scissorsButton.gameTag = .scissors
        rockButton.gameTag = .rock
        paperButton.gameTag = .paper
        
        scissorsButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
    }

    @objc func didTapChangeGameImageButton(_ sender: UIButton) {
        
        guard let sender = sender as? GameButton else { return }
        
        switch sender.gameTag {
        case .scissors:
            myGameImageView.image = UIImage(named: "scissors")
        case .rock:
            myGameImageView.image = UIImage(named: "rock")
        case .paper:
            myGameImageView.image = UIImage(named: "paper")
        }
        
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: sender.gameTag, computerInput: randomInput).rawValue
    }
    
    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> GameResult {
        // 내가 낸 값, 컴퓨터의 값
        switch (myInput,computerInput) {
        case (.scissors, .scissors):
            return .draw
        case (.scissors, .rock):
            return .lose
        case (.scissors, .paper):
            return .win
        case (.rock, .scissors):
            return .win
        case (.rock, .rock):
            return .draw
        case (.rock, .paper):
            return .lose
        case (.paper, .scissors):
            return .lose
        case (.paper, .rock):
            return .win
        case (.paper, .paper):
            return .draw
        }
    }
}

class GameButton: UIButton {
    var gameTag: InputState = .rock
}
