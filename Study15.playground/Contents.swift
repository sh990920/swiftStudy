import UIKit

// 클로저

// 클로저 표현식
//{ () -> () in
//    print("클로저가 실행됩니다.")
//}

let f = { () -> Void in
        print("클로저가 실행됩니다.")
}

f()

({ () -> Void in
    print("클로저가 실행됩니다.")
})()

let c = { (s1: Int, s2: String) -> Void in
        print("s1:\(s1), s2:\(s2)")
}

c(1, "closure") // s1:1, s2:slosure

({ (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
})(1, "closure")

var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    }else {
        return false
    }
}

value.sort(by: order)
// [9, 7, 5, 3, 2, 1]

value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    }else {
        return false
    }
})

value.sort(by: { (s1: Int, s2: Int) -> Bool in return s1 > s2 })

value.sort(by: { s1, s2 in return s1 > s2})

value.sort(by: { $0 > $1 })

value.sort(by: >)

// 트레일링 클로저
value.sort() { (s1, s2) in
        return s1 > s2
}

value.sort { (s1, s2) in
        return s1 > s2
}

func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s() // 성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100) { () in
        print("연산에 성공했습니다.")
}

func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f() // 실패 함수를 실행한다
        return 0
    }
    
    defer {
        s() // 성공 함수를 실행한다
    }
    return 100 / base
}

divide(base: 100, success: { () in
    print("연산이 성공했습니다.")
}) { () in
    print("연산이 성공했습니다.")
}

// @escpaing 과 @autoclosure

// @escpaing
func callback(fn: () -> Void) {
    fn()
}

callback {
    print("Closure가 실행되었습니다.")
}

// Closure가 생성되었습니다.

func callback(fn: () -> Void) {
    let f = fn // 클로저를 상수 f 에 대입
    f() // 대입된 클로저를 실행
}

func callback(fn: @escaping () -> Void) {
    let f = fn // 클로저를  상수 f에 대입
    f()
}

call back {
    print("Closure가 실행되었습니다.")
}

 Closure가 실행되었습니다.

 @autoclosure
 함수 정의
func condition(stmt: () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    }else {
        print("결과가 거짓입니다.")
    }
}

// 1. 일반 구문
condition(stmt: {
    4 > 2
})

// 2. 클로저 구문
condition {
    4 > 2
}

func condition(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("결과값이 참입니다.")
    }else {
        print("결과값이 거짓입니다.")
    }
}
// 실행 방법
condition(stmt: (4 > 2))

// 빈 배열 정의
var arrs = [String]()

func addVars(fn: @autoclosure () -> Void) {
    // 배열 요소를 3개까지 추가하여 초기화
    arrs = Array(repeating: "", count: 3)
    // 인자값으로 전달된 클로저 실행
    fn()
}

// 구문 1 : 아래 구문은 오류가 발생한다.
// arr.insert("KR", at: 1)
// 구문 2 : 아래 구문은 오류가 발생하지 않는다.
addVars(fn: arrs.insert("KR", at: 1))
