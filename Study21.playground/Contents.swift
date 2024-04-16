import UIKit

// 초기화 구문
struct Resolution {
    var width = 0
    var height = 0
    
    init(width: Int) {
        self.width = width
    }
}

class VideoMode {
    var resolution = Resolution(width: 4096)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    // 기본 초기화 구문
//    init() {
//        
//    }
//    
//    // 초기화될 때 name 인자값만 받는 init 구문
//    init(name: String) {
//        self.name = name
//    }
    // 위 두가지를 합친 init 구문
    init(name: String = "") {
        self.name = name
    }
    
    // 초기화될 때 interlaced 인자값만 받는 init 구문
    init(interlaced: Bool) {
        self.interlaced = interlaced
    }
    
    // 초기화될 때 interlaced, frameRate 두 개의 인자값을 받는 init 구문
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    // 초기화될 때 interlace, frameRate, name 세 개의 인자값을 받는 init 구문
    init(interlaced: Bool, frameRate: Double, name: String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
    
}

let nameVideoMode = VideoMode(name: "홍길동")
let simpleVideoMode = VideoMode(interlaced: true)
let doubleVideoMode = VideoMode(interlaced: true, frameRate: 40.0)
let tripVideoMode = VideoMode(interlaced: true, frameRate: 40.0, name: "홍길동")

let defaultVideoMode = VideoMode() // Error <- 기본 초기화 구문을 생성하면 오류가 발생하지 않는다.

// 초기화 구문의 오버라이딩

class Base {
    var baseValue: Double
    
    init(inputValue: Double) {
        self.baseValue = inputValue
    }
}

class ExBase: Base {
    override init(inputValue: Double) {
        super.init(inputValue: 10.5)
    }
}
