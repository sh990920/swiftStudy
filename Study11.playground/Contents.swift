import UIKit

// 옵셔널
// nil
let capital = ["KR" : "Seoul", "EN" : "London", "JP" : "Tokyo"]
capital["ko"]

// 옵셔널 래핑
Int(123) // -> Optional(123)
Int("swift") // -> nil

// 옵셔널 타입 선언과 정의
// 옵셔널 Int 타입
var optInt: Int?

// 옵셔널 String 타입
var optStr: String?

// 옵셔널 Double 타입
var optDouble: Double?

// 옵셔널 Array 타입
var optArr: [String]?

// 옵셔널 Dictionary 타입
var optDict: Dictionary<String, String>?
var optDict2: [String : String]?

// 옵셔널 Class 타입
var optClass: AnyObject?

// 옵셔널 타입 변수와 상수에 값 할당
// 옵셔널 Int 타입
var optInt2: Int?
optInt2 = 3

// 옵셔널 String 타입
var optStr2: String?
optStr2 = "swift"

// 옵셔널 Array 타입
var optArray: [String]?
optArray = ["C", "Java",  "Python", "Swift"]

// 옵셔널 Dictionary 타입
var optDic: Dictionary<String, Int>?
optDic = ["국어" : 94, "수학" : 88, "영어" : 96]

// 옵셔널 강제 해제
var optInt3: Int? = 3
print("옵셔널 자체의 값 : \(optInt3)")     // 옵셔널 자체의 값 : Optional(3)
print("!로 강제 해제한 값 : \(optInt3!)")  // !로 강제해제한 값 : 3

var str = "123"
var intFromStr = Int(str)

if intFromStr != nil {
    print("변환된 값은 \(intFromStr!)입니다.")
}else{
    print("값 변환에 실패했습니다.")
}

var str2 = "Swift"

if let intFromStr2 = Int(str2){
    print("변환된 값은 \(intFromStr2)입니다.")
}else{
    print("값 변환에 실패했습니다.")
}

func intSTr(str: String){
    guard let intFromStr = Int(str) else {
        print("값 변환에 실패하였습니다.")
        return
    }
    print("변환된 값은 \(intFromStr)입니다.")
}

var capital2 = ["KR" : "Seoul", "EN" : "London", "JP" : "Tokyo"]
print(capital2["KR"])
print(capital2["KR"]!)


var capital3 = ["KR" : "Seoul", "EN" : "London", "JP" : "Tokyo"]

if(capital3["KR"] != nil){
    print(capital3["KR"]!)
}

// 혹은
if let val = capital3["KR"] {
    print(val)
}

// 컴파일러에 의한 옵셔널 자동 해제
let optInt4 = Int("123")

if (optInt4 == 123) {
    print("optInt4 == 123")
}else{
    print("optInt4 != 123")
}


let tempInt = Int("123")

tempInt == 123
tempInt == Optional(123)
tempInt! == 123
tempInt! == Optional(123)

// 옵셔널 값의 할당
// 1
var optValue01 = Optional(123)
// 2
var optValue02 : Int? = 123

// 옵셔널의 묵시적 해제

// 명시적 옵셔널
var str3: String? = "Swift"
print(str3)

// 묵시적 옵셔널
var str4: String! = "Swift"
print(str4)

var str5: String! = nil

var value01: Int? = 10
// value01 + 5

var value02: Int! = 10
value02 + 5
