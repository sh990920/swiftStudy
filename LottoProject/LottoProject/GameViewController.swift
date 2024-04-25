//
//  GameViewController.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import UIKit

class GameViewController: UIViewController {

    let lotto = Lotto()
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    
    lazy var stackViewSortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var numberInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        titleLabel.text = "게임 시작 버튼을 눌러주세요"
        inputNumberLabel.layer.isHidden = true
        view.addSubview(stackViewSortStackView)
        
        stackViewSortStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackViewSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackViewSortStackView.topAnchor.constraint(equalTo: inputNumberLabel.bottomAnchor, constant: 10).isActive = true
        stackViewSortStackView.centerXAnchor.constraint(equalTo: inputNumberLabel.centerXAnchor).isActive = true
        stackViewSortStackView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10).isActive = true
        stackViewSortStackView.backgroundColor = .blue
        
        for _ in 0..<8 {
            let numberInputStackView = createNumberInputStackView()
            stackViewSortStackView.addArrangedSubview(numberInputStackView)
        }
    }
    
    @IBAction func gameStart(_ sender: Any) {
        titleLabel.text = "로또 번호를 입력하세요"
        inputNumberLabel.layer.isHidden = false
        backButton.isHidden = true
        lotto.lottoSetting()
    }
    
    @IBAction func goToMain(_ sender: Any) {
        print("뒤로가기 클릭")
        self.presentingViewController?.dismiss(animated: true)
    }
    var count: Int = 1

    func createNumberInputStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        // 내부 객체간의 간격
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        for i in count...count + 5 {
            count += 1
            switch(i) {
            case 46:
                let button = createCancelButton()
                stackView.addArrangedSubview(button)
            case 47:
                let button = createResetButton()
                stackView.addArrangedSubview(button)
            case 48:
                let button = createCompleteButton()
                stackView.addArrangedSubview(button)
            default:
                let button = createNumberButton(i)
                stackView.addArrangedSubview(button)
            }
        }
        return stackView
    }

    func createNumberButton(_ num: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(num)", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        button.tag = num
        button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        return button
    }

    func createResetButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("리셋", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }

    func createCancelButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("취소", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }

    func createCompleteButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setBackgroundColor(.orange, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }

    
    @objc func didTapNumberButton(_ sender: UIButton) {
        let str = lotto.userInput(sender.tag)
        if str == "더이상 입력할 수 없습니다." {
            inputNumberLabel.text = str
        } else {
            inputNumberLabel.text = "입력한 번호 : " + str
        }
    }
    
    @objc func didTapOtherButton(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            switch(buttonText) {
            case "취소":
                var str = lotto.userInputCancel()
                if str == "더이상 지울 수 없습니다." {
                    inputNumberLabel.text = str
                } else {
                    inputNumberLabel.text = "입력한 번호 : " + str
                }
            case "리셋":
                lotto.userInputReset()
                var str = "입력한 번호 : []"
                inputNumberLabel.text = str
            case "완료":
                var str2 = lotto.userInputComplete()
                if str2 != "번호를 전부 입력하고 진행해주세요!" {
                    var str = lotto.ranking()
                    titleLabel.text = str
                    inputNumberLabel.text = "맞춘 번호 : " + str2
                } else {
                    inputNumberLabel.text = str2
                }
                
            default:
                return
            }
        }
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
