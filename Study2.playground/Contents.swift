import UIKit

// 자료형
// Bool
// Bool 타입 저장 변수
var close = true

// Bool 타입 저장 상수
let success = true
let fail = false

// String
// String 타입 저장 변수
var projectName = "iOS study"

// String 타입 저장 상수
var language = "swift"

// Character
// Character 타입 저장 변수
var firstLetter : Character = "s"

// Character 타입 저장 상수
let lastLetter : Character = "t"


// 타입 추론과 타입 어노테이션
var year : Int // 명시적인 Int 타입
var name : String // 명시적인 String 타입
var firstChar : Character // 명시적인 Character 타입
var distance : Double // 명시적인 Double 타입
var pi : Float // 명시적인 Float 타입
var flag : Bool // 명시적인 Bool 타입

// 타입을 명시한 변수 선언
var name : String = "홍길동"
var year : Int = 1999
// 타입을 명시한 상수 선언
let firstName : String = "이"
let birthYear : Int = 1980
// 타입을 명시하지 않은 변수 선언
var name = "홍길동"
var year = 1999
// 타입을 명시하지 않은 상수 선언
let firstName = "이"
let birthYear = 1980

// 명시적으로 타입어노테이션을 사용해야 하는 경우
// 선언 + 타입 어노테이션
var year : Int

// 초기화
year = 1999

// Int 타입으로 정의
var temper1 = 3
// Float 타입으로 정의
var temper2 : Float = 3

var stringValue = "문자열" // String 타입
var charValue : Character = "문" // Character 타입

var cValue : Character = "C" // Character 타입
var sValue = "C" // String 타입

// 문자열 템플릿
let name = "꼼꼼한 재은씨"
let year = 2014
let month = 10
let day = 1

let profile = "\(name)는 \(year1)년 \(month)월 \(day)일에 출간되었습니다."

print(profile)

// 문자열 템플릿 괄호 내 연산
// 상수 정의
let apple = 3
let banana = 2
let orange = 4

let desc = "과일은 총 \(apple + banana + orange)개 입니다."
print(desc)

// 스위프트 4에서의 문자열 처리
// 쿼우팅
var message = "Hello"

// 멀티 라인 스트링
let poem = """
계절이 지나가는 하늘에는
가을로 가득 차 있습니다.
나느 아무 걱정도 없이 가슴 속의 별들을
다 헬 듯 합니다.
"""

print(poem)
