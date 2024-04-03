import UIKit

// 변수
var year = 1999 // 1. 정수형 변수
var message = "Hello, World" // 2. 문자열 변수

// 상수
let birthYear = 1980 // 3. 정수형 상수
let welcomeMessage = "안녕하세요" // 4. 문자열 상수

// 1. 알파벳과 한글 자음 및 모음, 아라비아 숫자를 사용할 수 있으며, 특수 기호나 한자, 이미지용 바이너리코드까지 사용할 수 있다.
// ==> 하지만 영어, 숫자, 그리고 밑줄 이외에 다른 문자나 기호를 쓰지 마세요
class Wedding {
    func add(man: Int, woman: Int) -> Int {
        return man + woman
    }
}

var james = 3
var sofia = james + 5

var w = Wedding()
print(w.add(man: james, woman: sofia))

// 2. 연산자와 혼동할 수 있는 [+,-,*,/] 및 공백은 변수, 상수명에 사용할 수 없다. 단, _(언더바)는 사용할 수 있다.
// 연산자와 공백은 변수나 상수명에 들어가면 안 됨
var abc+t = "abc plus t" // 값을 더하는 연산자라서 사용 불가
var abc-t = "abc minus t" // 값을 빼는 연산자라서 사용 불가
var abc t = "abc space t" // 변수명이 어디까지인지 구분할 수 없어서 사용 불가

// 언더바는 예외적으로 사용 가능
var abc_t = "abc underbar t"


// 3. 스위프트에서 예약어나 키워드로 등록되어 있는 단어는 변수나 상수명에 사용할 수 없다. 단, 대소문자를 바꾸어 사용하는 것은 가능하다.
var class = 1           // (x), 'class'는 클래스 정의를 위한 키워드
var enum = 2            // (x), 'enum'는 열거형 정의를 위한 키워드
var struct = 3          // (x), 'struct'는 구조체 정의를 위한 키워드
var extension = 4       // (x), 'extension'은 확장을 위한 키워드
var protocol = 5        // (x), 'protocol'은 프로토콜 정의를 위한 키워드
var as = 6              // (x), 'as' 는 타입 캐스팅을 위한 키워드

// cf) 허용되는 경우
var Class = 1           // (o)
var Enum = 2            // (o)
var Struct = 3          // (o)
var Extension = 4       // (o)
var Protocol = 5        // (o)
var As = 6              // (o)

// 4. 변수, 상수명의 첫 번째 자리에 숫자가 올 수 없습니다.
// 첫 번째 자리에는 숫자를 사용할 수 없음
var 1abc = 123 // (x)
var 2bcd = 345 // (x)

// 두 번째 자리부터는 숫자 사용 가능
var a123bc = 123
var b2cd = 345
