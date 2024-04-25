//
//  Lotto.swift
//  LottoProject
//
//  Created by 박승환 on 4/25/24.
//

import Foundation

public class Lotto {
    // 컴퓨터 로또 번호 저장 리스트
    var computerNumberList: Array<Int> = []
    // 사용자 로또 번호 저장 리스트
    var userInputNumberList: Array<Int> = []
    // 맞춘 번호를 보여줄 리스트
    var correctNumberList: Array<Int> = []
    // 맞춘 갯수 저장 변수
    var correctCount: Int = 0
    // 보너스 번호 맞췄는지
    var bonusCorrect: Bool = false
    // 보너스 번호
    var bonusCorrectNumber: Int = 0
    
    func lottoSetting() {
        while(computerNumberList.count <= 6){
            let num = Int.random(in: 1...45)
            if !computerNumberList.contains(num) {
                computerNumberList.append(num)
            }
        }
        print(computerNumberList)
    }
    
    func userInput(_ num: Int) -> String {
        if userInputNumberList.count == 6 {
            // 숫자 입력 끝
            return "더이상 입력할 수 없습니다."
        }
        
        if num > 45 || num < 0 {
            // 범위가 이상
            return "범위를 넘어섰습니다."
        }
        
        if(userInputNumberList.contains(num)){
            // 같은 수 있음
            return "같은 수가 있습니다. 다시 입력해주세요"
        } else {
            // 같은 수 없음
            userInputNumberList.append(num)
            var str: String = "["
            for i in 0..<userInputNumberList.count {
                if i == userInputNumberList.count - 1 {
                    str += String(userInputNumberList[i])
                }else {
                    str += String(userInputNumberList[i]) + ", "
                }
            }
            str += "]"
            return str
        }
    }
    
    func equalsNumber() {
        for i in 0..<computerNumberList.count {
            var num = computerNumberList[i]
            if userInputNumberList.contains(num) {
                if i == 6 {
                    // 보너스 번호
                    bonusCorrect = true
                    bonusCorrectNumber = num
                } else {
                    correctCount += 1
                    correctNumberList.append(num)
                }
                continue
            }
        }
    }
    
    func ranking() -> String {
        var str = ""
        switch(correctCount) {
        case 6:
            str = "1등 입니다!!"
        case 5:
            if bonusCorrect{
                str = "2등 입니다."
            } else {
                str = "3등 입니다."
            }
        case 4:
            str = "4등 입니다."
        case 3:
            str = "5등 입니다."
        default:
            str = "낙첨...ㅠ"
        }
        return str
    }
    
    func userInputCancel() -> String {
        if userInputNumberList.count == 0 {
            return "더이상 지울 수 없습니다."
        }
        let endIdx = userInputNumberList.count - 1
        userInputNumberList.remove(at: endIdx)
        var str: String = "["
        for i in 0..<userInputNumberList.count {
            if i == userInputNumberList.count - 1 {
                str += String(userInputNumberList[i])
            }else {
                str += String(userInputNumberList[i]) + ", "
            }
        }
        str += "]"
        return str
    }
    
    func userInputReset() {
        userInputNumberList.removeAll()
    }
    
    func userInputComplete() -> String {
        var str = ""
        if userInputNumberList.count < 6 {
            // 맞추는거 진행 불가
            str = "번호를 전부 입력하고 진행해주세요!"
            return str
        } else {
            equalsNumber()
            str = "["
            for i in 0..<correctNumberList.count {
                if i == correctNumberList.count - 1 {
                    str += String(correctNumberList[i])
                }else {
                    str += String(correctNumberList[i]) + ", "
                }
            }
            if bonusCorrect {
                str += ", 보너스 번호 : "
                str += String(bonusCorrectNumber)
            }
            str += "]"
            return str
        }
    }
    
    
}
