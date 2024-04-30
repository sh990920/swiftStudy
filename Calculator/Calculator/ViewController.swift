//
//  ViewController.swift
//  Calculator
//
//  Created by 박승환 on 4/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showNumberLabel: UILabel!
    
    @IBOutlet weak var showCalculation: UILabel!
    
    // 버튼들을 가지고 있는 StackView 를 정렬하기 위한 StackView
    lazy var stackViewSortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 버튼들을 정렬할 StackView
    lazy var firstStackView: UIStackView = createStackView()
    lazy var secondStackView: UIStackView = createStackView()
    lazy var thirdStackView: UIStackView = createStackView()
    lazy var fourthStackView: UIStackView = createStackView()
    lazy var fifthStackView: UIStackView = createStackView()
    
    // 마지막 정렬을 위한 StackView
    lazy var sortStackViewFifthStackView: UIStackView = createStackView()
    
    // 숫자 버튼
    lazy var zeroButton: UIButton = createNumberButton(0)
    lazy var oneButton: UIButton = createNumberButton(1)
    lazy var twoButton: UIButton = createNumberButton(2)
    lazy var threeButton: UIButton = createNumberButton(3)
    lazy var fourButton: UIButton = createNumberButton(4)
    lazy var fiveButton: UIButton = createNumberButton(5)
    lazy var sixButton: UIButton = createNumberButton(6)
    lazy var sevenButton: UIButton = createNumberButton(7)
    lazy var eightButton: UIButton = createNumberButton(8)
    lazy var nineButton: UIButton = createNumberButton(9)
    
    // 기능 버튼
    lazy var plusButton: UIButton = createPlusButton("+")
    lazy var minusButton: UIButton = createMinusButton("−")
    lazy var multiplicationButton: UIButton = createMultiplicationButton("×")
    lazy var divisionButton: UIButton = createDivisionButton("÷")
    lazy var cleanButton: UIButton = createCleanButton("C")
    lazy var percentageButton: UIButton = createPercentageButton("%")
    lazy var resultButton: UIButton = createResultButton("=")
    lazy var conversionButton: UIButton = createConversionButton("±")
    lazy var pointButton: UIButton = createPointButton(".")

    // 화면 로딩 시 진행할 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackViewSortStackView)
        
        stackViewSortStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackViewSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackViewSortStackView.topAnchor.constraint(equalTo: showNumberLabel.bottomAnchor, constant: 10).isActive = true
        stackViewSortStackView.centerXAnchor.constraint(equalTo: showNumberLabel.centerXAnchor).isActive = true
        stackViewSortStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        
        stackViewSortStackView.addArrangedSubview(firstStackView)
        stackViewSortStackView.addArrangedSubview(secondStackView)
        stackViewSortStackView.addArrangedSubview(thirdStackView)
        stackViewSortStackView.addArrangedSubview(fourthStackView)
        stackViewSortStackView.addArrangedSubview(fifthStackView)
        
        firstStackView.addArrangedSubview(cleanButton)
        firstStackView.addArrangedSubview(conversionButton)
        firstStackView.addArrangedSubview(percentageButton)
        firstStackView.addArrangedSubview(divisionButton)
        
        secondStackView.addArrangedSubview(sevenButton)
        secondStackView.addArrangedSubview(eightButton)
        secondStackView.addArrangedSubview(nineButton)
        secondStackView.addArrangedSubview(multiplicationButton)
        
        thirdStackView.addArrangedSubview(fourButton)
        thirdStackView.addArrangedSubview(fiveButton)
        thirdStackView.addArrangedSubview(sixButton)
        thirdStackView.addArrangedSubview(minusButton)
        
        fourthStackView.addArrangedSubview(oneButton)
        fourthStackView.addArrangedSubview(twoButton)
        fourthStackView.addArrangedSubview(threeButton)
        fourthStackView.addArrangedSubview(plusButton)
        
        fifthStackView.addArrangedSubview(zeroButton)
        fifthStackView.addArrangedSubview(sortStackViewFifthStackView)
        
        sortStackViewFifthStackView.addArrangedSubview(pointButton)
        sortStackViewFifthStackView.addArrangedSubview(resultButton)
        
    }

    // StackView 생성 메서드
    func createStackView() -> UIStackView {
        let stackView  = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    // 숫자버튼 생성 메서드
    func createNumberButton(_ text: Int) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setBackgroundColor(.gray, for: .normal)
        button.tag = text
        if text == 0 {
            DispatchQueue.main.async {
                button.layer.cornerRadius = button.bounds.width / 5.0
                button.layer.masksToBounds = true
            }
        } else {
            DispatchQueue.main.async {
                button.layer.cornerRadius = button.bounds.width / 2.0
                button.layer.masksToBounds = true
            }
        }
        button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        return button
    }
    
    // 더하기 버튼 생성 메서드
    func createPlusButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.orange, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }
    
    // 빼기 버튼 생성 메서드
    func createMinusButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.orange, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        return button
    }
    
    // 곱하기 버튼 생성 메서드
    func createMultiplicationButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.orange, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapMultiplicationButton), for: .touchUpInside)
        return button
    }
    
    // 나누기 버튼 생성 메서드
    func createDivisionButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.orange, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapDivisionButton), for: .touchUpInside)
        return button
    }
    
    // 초기화 버튼 생성 메서드
    func createCleanButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setBackgroundColor(.lightGray, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapCleanButton), for: .touchUpInside)
        return button
    }
    
    // 퍼센트 버튼 생성 메서드
    func createPercentageButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setBackgroundColor(.lightGray, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapPercentageButton), for: .touchUpInside)
        return button
    }
    
    // 결과 확인 버튼 생성 메서드
    func createResultButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.orange, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapResultButton), for: .touchUpInside)
        return button
    }
    
    // 부호전환 버튼 생성 메서드
    func createConversionButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setBackgroundColor(.lightGray, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapConversionButton), for: .touchUpInside)
        return button
    }
    
    // 소수점 버튼 생성 메서드
    func createPointButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setBackgroundColor(.gray, for: .normal)
        DispatchQueue.main.async {
            button.layer.cornerRadius = button.bounds.width / 2.0
            button.layer.masksToBounds = true
        }
        button.addTarget(self, action: #selector(didTapPointButton), for: .touchUpInside)
        return button
    }
    
    // 숫자 버튼 클릭 메서드
    @objc func didTapNumberButton(_ sender: UIButton) {
        print("숫자 버튼 클릭")
        if let text = showCalculation.text {
            if text == "0" {
                showCalculation.text = String(sender.tag)
            } else {
                showCalculation.text = text + String(sender.tag)
            }
        } else {
            showCalculation.text = String(sender.tag)
        }
    }
    // 더하기 버튼 클릭 메서드
    @objc func didTapPlusButton(_ sender: UIButton) {
        print("더하기 버튼 클릭")
        if let text = showCalculation.text {
            showCalculation.text = text + " + "
        }
    }
    // 빼기 버튼 클릭 메서드
    @objc func didTapMinusButton(_ sender: UIButton) {
        print("빼기 버튼 클릭")
        if let text = showCalculation.text {
            showCalculation.text = text + " - "
        }
    }
    // 곱하기 버튼 클릭 메서드
    @objc func didTapMultiplicationButton(_ sender: UIButton) {
        print("곱하기 버튼 클릭")
        if let text = showCalculation.text {
            showCalculation.text = text + " * "
        }
    }
    // 나누기 버튼 클릭 메서드
    @objc func didTapDivisionButton(_ sender: UIButton) {
        print("나누기 버튼 클릭")
        if let text = showCalculation.text {
            showCalculation.text = text + " / "
        }
    }
    // 초기화 버튼 클릭 메서드
    @objc func didTapCleanButton(_ sender: UIButton) {
        showCalculation.text = "0"
        showNumberLabel.text = "0"
        print("초기화 버튼 클릭")
    }
    // 퍼센트 버튼 클릭 메서드
    @objc func didTapPercentageButton(_ sender: UIButton) {
        print("퍼센트 버튼 클릭")
        if let numStr = showNumberLabel.text {
            if numStr != "0" {
                let str = numStr + "/ 100.0"
                let num = evaluateMathExpression(str)
                if num?.truncatingRemainder(dividingBy: 1) == 0 {
                    showNumberLabel.text = String(Int(num!))
                    showCalculation.text = String(Int(num!))
                } else {
                    showNumberLabel.text = String(format: "%.2f", num!)
                    showCalculation.text = String(format: "%.2f", num!)
                }
            }
        }
    }
    // 결과 버튼 클릭 메서드
    @objc func didTapResultButton(_ sender: UIButton) {
        print("결과 버튼 클릭")
        if let text = showCalculation.text {
            var num: Double? = nil
            if !text.contains(".") {
                num = evaluateMathExpression(text + ".0")
            } else {
                num = evaluateMathExpression(text)
            }
            if num?.truncatingRemainder(dividingBy: 1) == 0 {
                showNumberLabel.text = String(Int(num!))
                showCalculation.text = String(Int(num!))
            } else {
                showNumberLabel.text = String(format: "%.2f", num!)
                showCalculation.text = String(format: "%.2f", num!)
            }
        }
    }
    // 부호변환 버튼 클릭 메서드
    @objc func didTapConversionButton(_ sender: UIButton) {
        if let text = showCalculation.text {
            if text.contains("-") {
                let txt = text.suffix(text.count - 1)
                showCalculation.text = String(txt)
            } else {
                showCalculation.text = "-" + text
            }
        }
        print("부호변환 버튼 클릭")
    }
    // 소수점 버튼 클릭 메서드
    @objc func didTapPointButton(_ sender: UIButton) {
        if let text = showCalculation.text {
            showCalculation.text = text + "."
        }
        print("소수점 버튼 클릭")
    }
    
    // 수식 계산 메서드
    func evaluateMathExpression(_ expression: String) -> Double? {
        let exp = NSExpression(format: expression)
        if let value = exp.expressionValue(with: nil, context: nil) as? Double {
            return value
        }
        return nil
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
