import UIKit

// 타입 캐스팅
class Vehicle {
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car: Vehicle {
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {
        // 창을 닦는다.
    }
    
}

let trans: Vehicle = Car()

func move(param: Car) {
    param.accelerate()
}

func move(param: Vehicle) {
    param.accelerate()
}

class SUV : Car {
    
}

SUV() is SUV
SUV() is Car
SUV() is Vehicle

Car() is Vehicle
Car() is SUV

let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입입니다.")
} else {
    print("myCar는 SUV 타입이 아닙니다.")
}

// 실행 결과
// myCar는 SUV 타입입니다.

let someCar: Vehicle = SUV()

// 캐스팅
let anyCar: Car = SUV()
let anyVehicle = anyCar as Vehicle

//let anySUV = anyCar as? SUV
//if anySUV != nil {
//    print("\(anySUV!) 캐스팅이 성공하였습니다.")
//}

if let anySUV = anyCar as? SUV {
    print("\(anySUV) 캐스팅이 성공하였습니다")
}

// 범용 타입 - Any, AnyObject
var allCar: AnyObject = Car()
allCar = SUV()

func move(_ param: AnyObject) -> AnyObject {
    return param
}

move(Car())
move(Vehicle())

var list = [AnyObject]()
list.append(Vehicle())
list.append(Car())
list.append(SUV())

var value: Any = "Sample String"
value = 3
value = false
value = [1, 3, 5, 7, 9]
value = {
    print("함수가 실행됩니다.")
}

func name(_ param: Any) {
    print("\(param)")
}

name(3)
name(false)
name([1, 3, 5, 7, 9])

var rows = [Any]()
rows.append(3)
rows.append(false)
rows.append([1, 3, 5, 7, 9])
