import UIKit

// 상속
class A {
    var name = "Class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

let a = A()

a.name // Class A
a.description // This is class name is Class A
a.foo()

// 실행 결과
// Class A's method foo is called

class B : A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}

let b = B()
b.prop // Class B
b.boo() // Class B prop = Class B

b.name // Class A
b.foo() // Class A's method foo is called

b.name = "Class C"
b.foo() // Class C's method foo is called

// 오버라이딩
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }
    
    func makeNoise() {
        // 임의의 교통수단 자체는 경적을 울리는 기능이 필요 없다.
    }
}

class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            // 아무것도 하지 않음
        }
    }
    
    override var description: String {
        get {
            return "Car: engineLevel = \(engineLevel), so currentSpeed = \(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()

c.engineLevel = 5
c.currentSpeed // 250
c.description = "New Class Car"

print(c.description)
// 실행 결과
// New Value is New Class Car
// Car: engineLevel = 5, so currentSpeed = 250.0

class AutomaticCar : Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class Bike : Vehicle {
    override func makeNoise() {
        print("빠라빠라빠라밤")
    }
}

let bk = Bike()
bk.makeNoise()
// 실행 결과
// 빠라빠라빠라밤
