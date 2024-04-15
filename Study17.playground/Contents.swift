import UIKit
import Foundation

// 프로퍼티

// 저장 프로퍼티
class User {
    var name: String
}

// 첫 번째 해결책 - 초기화 구문을작성하고, 그 안에서 초기값을 할당해 준다.
class User {
    var name: String
    
    init() {
        self.name = ""
    }
}

// 두 번쨰 해결책 - 프로퍼티를 옵셔널 타입으로 바꿔준다.
class User {
    var name: String?
}
// 혹은
class User {
    var name: String!
}

// 세 번쨰 해결책 - 프로퍼티에 초기값을 할당해준다.
class User {
    var name: String = ""
}

// 구조체의 저장 프로퍼티

// 고정 길이 범위 구조체
struct FixedLengthRange {
    var startValue: Int // 시작값
    let length: Int //값의 범위
}

// 가변 길이 범위 구조체
struct FlexibleLengthRange {
    let startValue: Int // 시작값
    var length: Int // 값의 범위
}

// 아래 구조체 인스턴스는 정수값 0, 1, 2를 의미한다.
var rangeOfFixedintegers = FixedLengthRange(startValue: 0, length: 3)

// 아래처럼 시작점을 변경하면 객체 인스턴스는 정수값 4, 5, 6을 의미하게 된다.
rangeOfFixedintegers.startValue = 4

// 아래 구조체 인스턴스는 정수값 0, 1, 2를 의미한다.
var rangeOfFlexibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)

// 아래처럼 범위값을 변경하면 객체 인스턴스는 정수값 0, 1, 2, 3, 4를 의미하게 된다.
rangeOfFlexibleIntegers.length = 5

// 변수에 할당된 구조체 인스턴스라면
var variablesOfInstance = FixedLengthRange(startValue: 3, length: 4)
// 아래와 같이 저장 프로퍼티를 수정할 수 있음
variablesOfInstance.startValue = 0 // 가능

// 반면, 상수에 할당된 구조체 인스턴스라면
let constantsOfInstance = FixedLengthRange(startValue: 3, length: 4)
// 아래와 같이 저장 프로퍼티를 수정하려고 하면 오류가 발생한다.
//constantsOfInstance.startValue = 0 // 불가능

class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
}

let lz = LazyTest()
// Lazy Test

lz.late
// OnCreate!!

// 클로저를 이용한 저장 프로퍼티 초기화
class PropertyInit {
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    // 프로퍼티 참조 시 한번만 실행
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}

let s = PropertyInit()

// 실행 결과
// value01 execute
// value02 execute

s.value01
s.value02

let s1 = PropertyInit()

// 실행 결과
// value01 execute
// value02 execute

s1.value03

// 실행 결과
// value03 execute
s1.value03

// 연산 프로퍼티
struct UserInfo {
    // 저장 프로퍼티 : 태어난 연도
    var birth: Int!
    
    // 연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    // 연산 프로퍼티 : 올해 - 태어난 연도 + 1
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 2000)
print(info.age)

// 실행 결과
// 25

struct Rect {
    // 사각형이 위치한 기준 좌표(좌측 상단 기준)
    var originX: Double = 0.0
    var originY: Double = 0.0
    
    // 가로 세로 길이
    var sizeWidth: Double = 0.0
    var sizeHeight: Double = 0.0
    
    // 사각형의 X 좌표 중심
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        set (newCenterX){
            originX = newCenterX - (sizeWidth / 2)
        }
    }
    
    // 사각형의 Y 좌표 중심
    var centerY: Double {
        get{
            return self.originY + (self.sizeHeight / 2)
        }
        set(newCenterY) {
            self.originY = newCenterY - (self.sizeHeight / 2)
        }
    }
}

//var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
//print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")

// 실행 결과
// square.centerX = 5.0, square.centerY = 5.0

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    // 사각형이 위치한 기준 좌표(좌측 상단 기준)
    var origin = Position()
    
    // 가로 세로 길이
    var size = Size()
    
    // 사각형의 X 좌표 중심
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set (newCenter){
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }
    }
}

let p = Position(x: 0.0, y: 0.0)
let size = Size(width: 10.0, height: 10.0)

var square = Rect(origin: p, size:size)
print("square.centerX = \(square.center.x), square.centerY = \(square.center.y)")

// 실행 결과
// square.centerX = 5.0, square.centerY = 5.0

square.center = Position(x: 20.0, y: 20.0)
print("seqare.x = \(square.origin.x), square.y = \(square.origin.y)")

// 실행 결과
// seqare.x = 15.0, square.y = 15.0

// 프로퍼티 옵저버
struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome)원 입니다.")
        }
        
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되셨군요. 그래도 소득세는 깎아드리지 않아요. 알죠?")
            }
        }
    }
}

var job = Job(income: 1000000)

job.income = 2000000
// 실행 결과
// 이번 달 월급은 2000000원 입니다.
// 월급이 1000000원 증가하셨네요. 소득세가 상향조정될 예정입니다.

job.income = 1500000

// 실행 결과
// 이번 달 월급은 1500000원 입니다.
// 저런, 월급이 삭감되셨군요. 그래도 소득세는 깎아드리지 않아요. 알죠?

// 타입 프로퍼티
struct Foo {
    // 타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티값"
    
    // 타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    // 타입 저장 프로퍼티
    static var sBoo = "클래스 타입 프로퍼티값"
    
    // 타입 연산 프로퍼티
    static var cBoo: Int {
        return 10
    }
    
    // 재정의가 가능한 타입 연산 프로퍼티
    class var oBoo: Int {
        return 100
    }
}

print(Foo.sFoo)
// 구조체 타입 프로퍼티 값

Foo.sFoo = "새로운 값"
print(Foo.sFoo)
// 새로운 값

print(Boo.sBoo)
// 클래스 타입 프로퍼티값

print(Boo.cBoo)
// 10
