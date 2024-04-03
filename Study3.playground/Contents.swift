import UIKit

// 산술 연산자 테스트
let a = 10
let b = 2

// 단항 연산자
-a
-b

// 이항 연산자
a + b
a - b
a * b
a / b
a % b

// 비교 연산자
let c = 10
let d = 5

c < d
c > d
c <= d
c >= d
c == d
c != d

// && 연산자 테스트
true && true        // true
false && false      // false
true && false       // false
false && true       // false

// || 연산자 테스트
true || true        // true
false || false      // false
true || false       // true
false || true       // true

// 논리 연산자와 비교 연산자를 결합해서 사용하기
// Int 타입 상수 선언
let A = 10
let B = 5
let C = 2

// 비교 연산자와 함께 사용하는 경우
A > B && B > C // true && true = true
A == B && A > B // false && true = false
A == B || A > B // false || true = true

// 비교, 산술 연산자와 함께 사용하는 경우
A - B > B - C && B == 0 // true && false = false
A + B > C || C > 0 // true || true = true

// 범위 연산자
1 ... 5

// 닫힌 범위 연산자
for row in 1 ... 5 {
    row
}

// 반 닫힘 범위 연산자
for row in 1 ..< 5 {
    row
}

// 대입 연산자
var num = 10

num += 1
num -= 1
num *= 2
num /= 2
num %= 5
