import UIKit

// 함수
// 사용자 지정 함수
// 1. 매개변수와 반환값이 모두 없는 함수
func printHello(){
    print("안녕하세요")
}

// 2. 매개변수는 없지만 반환값이 있는 함수
func sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

// 3. 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name : String) {
    print("\(name)님 안녕하세요")
}

// 4. 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name : String) -> String {
    let returnValue = "\(name)님 안녕하세요"
    return returnValue
}

// return을 호출해 명시적으로 함수를 종료
func hello(name : String?){
    guard let _name = name else {
        return
    }
    print("\(_name)님 안녕하세요")
}

// 함수의 호출
printHello()

// 인자값이 있는 함수 호출
let inputName = "홍길동"
printHelloWithName(name: inputName)

// 인자 레이블
// 입력된 (값 x 횟수) 만큼 카운트 변수의 값을 증가하는 함수
func incrementBy(amount: Int, numberOfTimes: Int){
    var count = 0
    count = amount * numberOfTimes
}

incrementBy(amount: 5, numberOfTimes: 2)

// 2가지 함수 호출 방식
func times(x: Int, y: Int) -> Int {
    return (x * y)
}

// 1. 함수의 이름만으로 호출한 구문
times(x: 5, y: 10)
// 2. 함수의 식별자를 사용하여 호출한 구문
times(x:y:)(5, 10)

// 반환값과 튜플
func getindvInfo() -> (Int, String) {
    let height = 100
    let name = "Peter"
    
    return (height, name)
}

var uInfo = getindvInfo()
uInfo.0 // 100
uInfo.1 // Peter

var(a, b) = getindvInfo()
a // 100
b // Peter

func getIndvInfo2() -> (h: Int, n: String) {
    let height = 100
    let name = "Peter"
    
    return (height, name)
}

var uInfo2 = getIndvInfo2()
uInfo2.h // 100
uInfo2.n // Peter

// typealias
typealias infoResult = (Int, Character, String)

func getuserInfo() -> infoResult {
    let gender : Character = "M"
    let height = 100
    let name = "Peter"
    
    return (height, gender, name)
}

let info = getuserInfo()

info.0 // 100
info.1 // "M"
info.2 // "Peter"
