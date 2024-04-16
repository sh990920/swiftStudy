import UIKit

// 메소드
// 인스턴스 메소드
struct Resolution {
    var width = 0
    var height = 0
    
    // 구조체에 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        let desc = "이 해상도는 \(self.width) X \(self.height)로 구성 된다."
        return desc
    }
    
    func judge() -> Bool {
        let width = 30
        return self.width == width
    } // false
    
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    // 클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시된다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시된다."
            return desc
        }
    }
}

class Counter {
    // 카운트를 저장할 프로퍼티
    var count = 0
    
    // 카운트를 1 증가
    func increment() {
        self.count += 1
    }
    
    // 입력된 값만큼 카운트를 증가
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    // 카운트를 0으로 초기화
    func reset() {
        self.count = 0
    }
}

// Counter 클래스의 인스턴스를 생성한다. 초기 카운터의 값은 0이다
let counter = Counter()

// 카운터 값을 증가시킨다. 이제 카운터 값은 1이다.
counter.increment()

// 카운터 값을 5만큼 증가시킨다. 이제 카운터 값은 6이다.
counter.incrementBy(amount: 5)

// 카운터 값을 초기화 한다. 이제 카운터 값은 0이다.
counter.reset()

struct Point {
    var x = 0.0
    var y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다.")
// 실행 결과
// 이제 새로운 좌표는 (13.5, 16.5)입니다.

class Location {
    var x = 0.0
    var y = 0.0
    
    func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc.moveByX(x: 3.0, y: 4.5)

print("이제 새로운 좌표는 (\(loc.x), \(loc.y))입니다.")
// 실행 결과
// 이제 새로운 좌표는 (13.5, 16.5)입니다.

// 타입 메소드
class Foo {
    // 타입 메소드 선언
    class func fooTyopeMethod() {
        // 타입 메소드 구현 내용
    }
}

let f = Foo()
// f.fooTyopeMethod() // 오류
Foo.fooTyopeMethod()
