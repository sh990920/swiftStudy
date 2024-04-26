//
//  GameViewController.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import UIKit

class GameViewController: UIViewController {

    // 로또 객체 생성
    let lotto = Lotto()
    
    // 게임이 실행중인지 확인할 변수
    var isPlay:Bool = false
    
    // stackView 갯수를 확인할 변수
    var count: Int = 1
    
    // 뒤로가기 버튼
    @IBOutlet weak var backButton: UIButton!
    // 타이틀 레이블
    @IBOutlet weak var titleLabel: UILabel!
    // 시작 버튼
    @IBOutlet weak var startButton: UIButton!
    // 입력한 숫자를 보여줄 레이블
    @IBOutlet weak var inputNumberLabel: UILabel!
    // 숫자 및 기능 버튼을 정렬하는 StackView 를 정렬할 StackView
    lazy var stackViewSortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // 화면이 로딩 되었을 때 행동할 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "게임 시작 버튼을 눌러주세요"
        inputNumberLabel.layer.isHidden = true
        view.addSubview(stackViewSortStackView)
        
        stackViewSortStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackViewSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackViewSortStackView.topAnchor.constraint(equalTo: inputNumberLabel.bottomAnchor, constant: 10).isActive = true
        stackViewSortStackView.centerXAnchor.constraint(equalTo: inputNumberLabel.centerXAnchor).isActive = true
        stackViewSortStackView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10).isActive = true
        
        for _ in 0 ..< 8 {
            let numberInputStackView = createNumberInputStackView()
            stackViewSortStackView.addArrangedSubview(numberInputStackView)
        }
        stackViewSortStackView.isHidden = true
    }
    
    // 게임 시작 함수
    @IBAction func gameStart(_ sender: Any) {
        if !isPlay {
            titleLabel.text = "로또 번호를 입력하세요"
            stackViewSortStackView.isHidden = false
            inputNumberLabel.layer.isHidden = false
            backButton.isHidden = true
            inputNumberLabel.text = "입력한 번호 : []"
            startButton.setTitle("게임 중지", for: .normal)
            isPlay = true
            lotto.lottoSetting()
        } else {
            titleLabel.text = "게임 시작 버튼을 눌러주세요"
            stackViewSortStackView.isHidden = true
            inputNumberLabel.layer.isHidden = true
            inputNumberLabel.text = "입력한 번호 : []"
            backButton.isHidden = false
            gameOver()
        }
        
    }
    
    // 뒤로가기 버튼 함수
    @IBAction func goToMain(_ sender: Any) {
        print("뒤로가기 클릭")
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // 게임 종료 함수
    func gameOver() {
        stackViewSortStackView.isHidden = true
        backButton.isHidden = false
        isPlay = false
        startButton.setTitle("게임 시작!", for: .normal)
        lotto.gameInitialization()
    }
    
    // 숫자 버튼을 눌렀을 때 작동할 함수
    @objc func didTapNumberButton(_ sender: UIButton) {
        let str = lotto.userInput(sender.tag)
        if str == "더이상 입력할 수 없습니다." {
            inputNumberLabel.text = str
            textChange()
        } else {
            inputNumberLabel.text = "입력한 번호 : " + str
        }
    }
    
    // 나머지 버튼을 눌렀을 때 작동할 함수
    @objc func didTapOtherButton(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            switch(buttonText) {
            case "취소":
                cancel()
            case "리셋":
                reset()
            case "완료":
                complete()
            default:
                return
            }
        }
    }
    
    // 완료 기능
    func complete() {
        let str2 = lotto.userInputComplete()
        if str2 != "번호를 전부 입력하고 진행해주세요!" {
            let str = lotto.ranking()
            titleLabel.text = str
            inputNumberLabel.text = "맞춘 번호 : " + str2
            gameOver()
        } else {
            inputNumberLabel.text = str2
            textChange()
        }
    }
    
    // 리셋 기능
    func reset() {
        lotto.userInputReset()
        let str = "입력한 번호 : []"
        inputNumberLabel.text = str
    }
    
    // 취소 기능
    func cancel() {
        let str = lotto.userInputCancel()
        if str == "더이상 지울 수 없습니다." {
            inputNumberLabel.text = str
            textChange()
        } else {
            inputNumberLabel.text = "입력한 번호 : " + str
        }
    }

    // 버튼을 가지고 있을 StackView 생성 함수
    func createNumberInputStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        // 내부 객체간의 간격
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    // 숫자 버튼 생성 함수
    func createNumberButton(_ num: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(num)", for: .normal)
        button.setBackgroundColor(.lightGray, for: .normal)
        button.tag = num
        button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        return button
    }
    
    // 리셋 버튼 생성 함수
    func createResetButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("리셋", for: .normal)
        button.setBackgroundColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }

    // 취소 버튼 생성 함수
    func createCancelButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("취소", for: .normal)
        button.setBackgroundColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }
    
    // 완료 버튼 생성 함수
    func createCompleteButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setBackgroundColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(didTapOtherButton), for: .touchUpInside)
        return button
    }
    
    // 디스패치 큐를 사용해 텍스트 수정하기
    func runAfterDelay(_ delay: TimeInterval, _ block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
    }
    
    // 텍스트 수정 메서드
    func textChange() {
        runAfterDelay(1.5) { [weak self] in
            guard let self = self else { return } // self가 존재하는지 확인
            self.inputNumberLabel.text = "입력한 번호 : " + lotto.showUserNumbers()
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
