import UIKit

// 내부 매개변수명, 외부 매개변수명
func printHello(to name: String, welcomeMessage msg: String) {
    print("\(name)님, \(msg)")
}

printHello(to: "홍길동", welcomeMessage: "안녕하세요")

// 외부 매개변수명을 적지 않는 방법
func printHello2(_ name : String, _ msg: String) {
    print("\(name)님, \(msg)")
}

printHello2("홍길동", "안녕하세요")

func printHello3(to name : String, _ msg: String) {
    print("\(name)님, \(msg)")
}

printHello3(to: "홍길동", "안녕하세요")

// 가변인자
func avg(score: Int...) -> Double {
    var total = 0 // 점수 합계
    for i in score { // 배열로 입력된 값들을 순회 탐색하면서 점수를 합산
        total += i
    }
    return (Double(total) / Double(score.count)) // 평균을 구해서 반환
}

print(avg(score: 10, 20, 30, 40)) // 결과 : 25.0

// 기본값을 갖는 매개변수
// 기본값이 지정된 함수
func echo(message: String, newline: Bool = true) {
    if newline {
        print(message, true)
    }else {
        print(message, false)
    }
}

echo(message: "hello")
echo(message: "hello", newline: true)

// 매개 변수의 수정
// 입력받은 값을 +1 하여 리턴해주는 함수
//func incrementBy(base: Int) -> Int {
//    base += 1
//    return base
//}

func incrementBy(base: Int) -> Int {
    var base = base
    base += 1
    return base
}

// InOut 매개변수
var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}

print(autoIncrement(value: cnt)) // 함수 내부의 value 변수값 : 31
print(cnt) // 외부에서 정의된 cnt 변수값 : 30

func foo(paramCount: inout Int) -> Int{
    paramCount += 1
    return paramCount
}

var count = 30
print(foo(paramCount: &count)) // 함수 내부의 paramCount 변수값 : 31
print(count) // 외부에서 정의된 count 변수값 : 31

// 상수는 inout 매개변수에 인자값으로 전달할 수 없음
let count1 = 30
// foo(paramCount: &count1) // x

// 리터럴은 inout 매개변수에 인자값으로 전달할 수 없음
// foo(paramCount: &30) // x

// 변수는 inout 매개변수에 인자값으로 전달할 수 있음
var value = 30
foo(paramCount: &value) // o

// 변수의 생존 범위 및 생명주기
//do { // 상위 블록
//    do { // 하위 블록
//        var ccnt = 3
//        ccnt += 1
//        print(ccnt) // 4
//    }
//    
//    ccnt += 1
//    print(ccnt) // 오류 - "Use of unresolved identifier 'ccnt'"
//}

do { // 상위 블록
    var ccnt = 0 // <- 옮긴 위치
    do { // 하위 블록
        ccnt = 3
        print(ccnt) // 3
    }
    
    ccnt += 1
    print(ccnt) // 4
}

var count2 = 30

func foo1() -> Int {
    count2 += 1
    return count
}

 foo1() // 31

var count3 = 30

func foo2(count3: Int) -> Int{
    var count3 = count3
    count3 += 1
    return count3
}

print(foo2(count3: count3)) // 함수 내부의 count 변수값 : 31
print(count3) // 외부에서 정의된 count 변수값 : 30
