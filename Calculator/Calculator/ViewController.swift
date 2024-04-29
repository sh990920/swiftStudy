//
//  ViewController.swift
//  Calculator
//
//  Created by 박승환 on 4/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showNumberLabel: UILabel!
    
    lazy var stackViewSortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var firstStackView: UIStackView = createStackView()
    lazy var secondStackView: UIStackView = createStackView()
    lazy var thirdStackView: UIStackView = createStackView()
    lazy var fourthStackView: UIStackView = createStackView()
    lazy var fifthStackView: UIStackView = createStackView()
    
    lazy var sortStackViewFifthStackView: UIStackView = createStackView()
    
    lazy var zeroButton: UIButton = createButton(0)
    lazy var oneButton: UIButton = createButton(1)
    lazy var twoButton: UIButton = createButton(2)
    lazy var threeButton: UIButton = createButton(3)
    lazy var fourButton: UIButton = createButton(4)
    lazy var fiveButton: UIButton = createButton(5)
    lazy var sixButton: UIButton = createButton(6)
    lazy var sevenButton: UIButton = createButton(7)
    lazy var eightButton: UIButton = createButton(8)
    lazy var nineButton: UIButton = createButton(9)
    
    lazy var plusButton: UIButton = createButton("+")
    lazy var minusButton: UIButton = createButton("-")
    lazy var multiplicationButton: UIButton = createButton("×")
    lazy var divisionButton: UIButton = createButton("÷")
    lazy var cleanButton: UIButton = createButton("C")
    lazy var percentageButton: UIButton = createButton("%")
    lazy var resultButton: UIButton = createButton("=")
    lazy var conversionButton: UIButton = createButton("±")
    
    lazy var pointButton: UIButton = createButton(".")

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

    
    
    func createStackView() -> UIStackView {
        let stackView  = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func createButton(_ text: Any) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(text)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setBackgroundColor(.orange, for: .normal)
        if let num = text as? Int {
            button.tag = num
            button.setBackgroundColor(.lightGray, for: .normal)
        }
        
        if let num = text as? Int{
            if num == 0 {
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
        } else {
            DispatchQueue.main.async {
                button.layer.cornerRadius = button.bounds.width / 2.0
                button.layer.masksToBounds = true
            }
        }
        
        //button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        return button
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
