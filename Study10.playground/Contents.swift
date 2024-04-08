import UIKit

// 딕셔너리

// 디셔너리를 정의하는 방법
var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

capital["KR"]
capital["EN"]
capital["FR"]

// 방법 1
var dict1 = Dictionary<String, String>()
// 방법 2
var dict2 = [String : String]()

// 선언과 초기화 분리 방법1
var dict3: Dictionary<String, String>
dict3 = Dictionary<String, String>()

// 선언과 초기화 분리 방법2
var dict4: [String : String]
dict4 = Dictionary()

// 선언과 초기화 분리 방법3
var dict5: [String : String]
dict5 = [String : String]()

// 선언과 초기화 분리 방법4
var dict6: [String : String]
dict6 = [:]

// 딕셔너리에 동적으로 아이템 추가하기
var newCapital = [String : String]()
newCapital["JP"] = "Tokyo"

if newCapital.isEmpty {
    print("딕셔너리가 비어있습니다.")
}else {
    print("딕셔너리의 크기는 현재 \(newCapital.count)입니다.")
}

newCapital.updateValue("Seoul", forKey: "KR")
// "KR" : "Seoul" 데이터가 저장되고 nil이 리턴된다.
newCapital.updateValue("London", forKey: "EN")
// "EN" : "London" 데이터가 저장되고 nil이 리턴된다.
newCapital.updateValue("Sapporo", forKey: "JP")
// "JP" : "Sapporo" 데이터로 수정되고 "Tokyo"가 리턴된다.

// 딕서너리 삭제
// 1. nil 할당
newCapital["KR"] = nil
// 2. 매소드 사용
newCapital.removeValue(forKey: "EN")

if let removedValue = newCapital.removeValue(forKey: "JP"){
    print("삭제된 값은 \(removedValue)입니다.")
}else{
    print("아무것도 삭제되지 않았습니다.")
}

Optional("Sapporo")

// 딕셔너리 순환 참조
// 순환 참조를 위한 데이터 추가
newCapital.updateValue("Seoul", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
newCapital.updateValue("Sapporo", forKey: "JP")

// for ~ in 사용
for i in newCapital {
    // 키-값 한 쌍이 담긴 i 상수를 튜플로 받는다.
    let(key, value) = i
    print("현재 데이터는 \(key) : \(value)입니다.")
}

// 더 생략해서 작성
for (key, value) in newCapital {
    print("현재 데이터는 \(key) : \(value)입니다.")
}
