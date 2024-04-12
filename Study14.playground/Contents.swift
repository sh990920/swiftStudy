import UIKit

// 일급 객체

// 일급 함수의 특성 1. 변수나 상수를 대입할 수 있음
// 정수를 입력받는 함수
func foo(base: Int) -> String {
    print("함수 foo가 실행됩니다.")
    return "결과값은 \(base + 1)입니다."
}

let fn1 = foo(base: 5)
// 결과값은 6입니다.

let fn2 = foo //fn2 상수에 foo 함수가 할당
fn2(5) // 결과값은 6입니다.

let fn3 = foo(base: 5)

// 실행 결과
// 함수 foo가 실행됩니다.

let fn4 = foo
// 출력 결과 없음
fn4(7)

// 실행 결과
// 함수 foo가 실행됩니다.

func boo(age: Int) -> String {
    return "\(age)"
}

//let fn: (Int) -> String = boo
let fn:(Int) -> String = boo(age:)

func boo(age: Int, name: String) -> String {
    return "\(name)의 나이는 \(age)입니다."
}

// let t = boo // <- 불가능
// 해결 방법 1 : 타입 어노테이션을 통해 입력받을 함수의 타입을 지정
//let t1: (Int, String) -> String = boo

// 해결 방법 2 : 함수의 식별값을 통해 입력받을 정확한 함수를 지정
//let t2 = boo(age:name:)

let fn01: (Int) -> String = boo             // boo(age:)
//let fn02: (Int, String) -> String = boo     // boo(age:name:)

func boo(height: Int, nick: String) -> String {
    return "\(nick)의 키는 \(height)입니다."
}

let fn03: (Int, String) -> String = boo(age:name:)
let fn04: (Int, String) -> String = boo(height:nick:)

func boo(age: Int, name: String) -> (String, Int) {
    return (name, age)
}
// 위 함수의 타입
// (Int, String) -> (String, Int)

func boo() -> String {
    return "empty values"
}
// 위 함수의 타입
// () -> String

func boo(base: Int) {
    print("param = \(base)")
}
// 위 함수의 타입
// (Int) -> ()

func boo() {
    print("empty values")
}
// 위 함수의 타입
// () -> ()

public typealias Void = ()

// 일급 함수의 특성2 함수의 반환 타입으로 함수를 사용할 수 있음
func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String {
    return desc
}

let p = pass()
p() // this is desc()

func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}
 
func times(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return times
    case "/":
        return divide
    default:
        return plus
    }
}

let c = calc("+")
c(3, 4) // plus(3, 4) -> 7
let c2 = calc("-")
c2(3, 4) // minus(3, 4) -> -1
let c3 = calc("*")
c3(3, 4) // times(3, 4) -> 12
let c4 = calc("/")
c4(3, 4) // divied(3, 4) -> 0

// 일급함수의 특성 3 함수의 인자값으로 함수를 사용할 수 있음
func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr) // 4

func successThrough() {
    print("연산 처리가 성공했습니다.")
}

func failThrough() {
    print("처리 과정에서 오류가 발생했습니다.")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack() // 실패 함수 실행
        return 0
    }
    defer {
        sCallBack() // 성공 함수 실행
    }
    return 100 / base
}

divide(base: 30, success: successThrough, fail: failThrough)
// 실행 결과
// 연산 처리가 성공했습니다.

// 익명 함수
divide(base: 30,
       success: {
           () -> Void in
           print("연산 처리가 성공했습니다.")
       },fail:{
           () -> Void in
           print("처리 과정에서 오류가 발생했습니다.")
       }
)

// 함수의 중첩
// 외부 함수
func outer(base: Int) -> String {
    // 내부 함수
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    let result = inner(inc: base + 1)
    return result
}

outer(base: 3)
// 4를 반환합니다.
// 외부 함수
func outer(param: Int) -> (Int) -> String {
    // 내부 함수
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    return inner
}

let fnc1 = outer(param: 3) // outer가 실행되고, 그 결과로 inner 가 대입된다.
let fnc2 = fnc1(30) // inner(inc: 30)과 동일하다

func basic(param: Int) -> (Int) -> Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append
}

let result = basic(param: 10)
result(10) // 40
