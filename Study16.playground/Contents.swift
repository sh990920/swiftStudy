import UIKit

// 구조체와 클래스

// 정의 구문
// 구조체 예시
//struct Resolution {
//    // 구조체 정의 내용이 들어갈 부분
//}
//
//// 클래스 예시
//class VideoMode {
//    // 클래스 정의 내용이 들어갈 부분
//}

// 메서드와 프로퍼티
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

// 서브 프로퍼티를 위한 클래스 수정
class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    var res = Resolution() // 추가
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

// 인스턴스
// Resolution 구조체에 대한 인스턴스를 생성하고 상수 insRes에 할당
let insRes = Resolution()

// VideoMode 클래스에 대한 인스턴스를 생성하고 상수 insVMode에 할당
let insVMode = VideoMode()

let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다.")

// 실행결과
// insRes 인스턴스의 width 값은 0입니다.

// videoMode 클래스에 대한 인스턴스를 생성하고 상수에 할당
let vMode = VideoMode()

print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다.")

// 실행결과
// vMode 인스턴스의 width 값은 0입니다.

// 점 구문을 이용하여 인스턴스의 프로퍼티에 값을 할당
vMode.name = "Sample"
vMode.res.width = 1280

print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다.")

// 실행 결과
// Sample 인스턴스의 width 값은 1280입니다.

// 초기화
// 구조체의 초기화
// width와 height에 매개변수를 지정하여 Resolution 인스턴스 생성
let defaultRes = Resolution(width: 1024, height: 768)

print("width : \(defaultRes.width), height : \(defaultRes.height)")

// 실행 결과
// width : 1024, height : 768

// 구조체의 값 전달 방식 : 복사에 의한 전달
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema 인스턴스의 width 값은 \(cinema.width)입니다.")

// 실행결과
// cinema 인스턴스의 width 값은 2048입니다.

print("hd 인스턴스의 width 값은 \(hd.width)입니다.")

// 실행 결과
// hd 인스턴스의 width 값은 1920입니다.

// 클래스의 값 전달 방식 : 참조에 의한 전달
let video = VideoMode()
video.name = "Original Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
// 실행 결과
// video 인스턴스의 name 값은 Original Video Instance입니다.

let dvd = video
dvd.name = "DVD Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
// 실행 결과
// video 인스턴스의 name 값은 DVD Video Instance입니다.

func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스의 name 값은 \(video.name!)입니다.")
// 실행 결과
// video 인스턴스의 name 값은 Function Video Instance입니다.

if (video === dvd) {
    print("video와 dvd는 동일한 VideoMode 인스턴스를 참조한다.")
}else {
    print("video와 dvd는 서로 다른 VideoMode 인스턴스를 참조한다.")
}
// 실행 결과
// video와 dvd는 동일한 VideoMode 인스턴스를 참조한다.

let vs = VideoMode()
let ds = VideoMode()

if (vs === ds) {
    print("vs와 ds는 동일한 VideoMode 인스턴스를 참조한다.")
}else {
    print("vs와 ds는 서로 다른 VideoMode 인스턴스를 참조한다.")
}
// 실행 결과
// vs와 ds는 서로 다른 VideoMode 인스턴스를 참조한다.
