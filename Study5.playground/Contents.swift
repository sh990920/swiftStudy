import UIKit

// 반복문
// if 반복문
var adult = 19
var age = 15

if age < adult {
    print("미성년자")
}

// if else 반복문
var adult2 = 19
var age2 = 21

if age2 < adult {
    print("미성년자")
} else {
    print("성인")
}


// if else if 반복문
var browser = "Safari" // 입력받을 브라우저명
var browserName : String// 브라우저 이름을 저장할 변수

if (browser == "IE") {
    browserName = "인터넷 익스플로러"
}else if(browser == "FF"){
    browserName = "파이어폭스"
}else if(browser == "Chrome"){
    browserName = "크롬"
}else if(browser == "Opera"){
    browserName = "오페라"
}else if(browser == "Safari"){
    browserName = "사파리"
}else{
    browserName = "알려지지 않은 브라우저"
}

print("사용하고 계신 브라우저는 \(browserName)입니다.")

// guard
var stopNum = 10

while true {
    stopNum = Int.random(in: 1 ... 10)
    
    guard stopNum <= 8 else {
        print("stopNum = \(stopNum) : 변수가 8 보다 큰 수가 들어와 반복문을 종료합니다.")
        break
    }
    
    print("stopNum = \(stopNum) : 변수가 8 보다 작습니다. 반복문을 계속 실행합니다.")
}

// switch 구문
let val = 2

switch val {
case 1 :
    print("일치한 값은 1입니다.")
case 2 :
    print("일치한 값은 2입니다.")
case 2 :
    print("일치한 값은 2가 더 있습니다.")
default :
    print("어느 패턴과도 일치하지 않습니다.")
}

// Fall Through 구문

let sampleChar : Character = "a"

switch sampleChar {
case "a" :
    fallthrough
case "A" :
    print("글자는 A 입니다.")
default :
    print("일치하는 글자가 없습니다.")
}
