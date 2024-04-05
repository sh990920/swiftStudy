import UIKit

// 배열
var cities = ["Seoul", "New York", "LA", "Santiago"]

// 배열의 순회 탐색
// 배열의 순회 특성을 사용하여 탐색
for city in cities {
    print("배열 원소는 \(city)입니다.")
}

// firstIndex(of:) 사용하기
for city in cities {
    let index = cities.firstIndex(of: city)
    print("\(index!)번째 배열 원소는 \(city)입니다.")
}

// 동적 배열 선언
// 1. 제네릭을 이용한 배열 선언
var cities2 = Array<String>()

var cities3 : Array<String> // 문자열 배열을 선언
cities3 = Array()           // 배열의 초기화

//다른 타입 선언과 초기화
// 배열 선엄 & 초기화
var cities4 = [String]()

var cities5 : [String]  // 배열 선언
cities5 = [String]()    // 배열 초기화 - 첫번째 방식
cities5 = []            // 배열 초기화 - 두번째 방식

var cities6 = [String]()                            // []
cities6.append("Seoul")                             // ["Seoul"]
cities6.append("New York")                          // ["Seoul", "New York"]
cities6.insert("Tokyo", at: 1)                      // ["Seoul", "Tokyo", "New York"]
cities6.append(contentsOf: ["Dubai", "Sydney"])     // ["Seoul", "Tokyo", "New York", "Dubai", "Sydney"]

// 범위 연산자를 이용한 인덱스 참조
var alpabet = ["a", "b", "c", "d", "e"]
alpabet[0...2]
alpabet[2...3]
alpabet[1..<3]

alpabet[1...2] = ["1", "2", "3"]
print(alpabet)
