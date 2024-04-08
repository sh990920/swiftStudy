import UIKit

// 튜플
let tupleValue = ("a", "b", 1, 2.5, true)

// 참조 방법
tupleValue.0
tupleValue.1
tupleValue.2
tupleValue.3
tupleValue.4

// 튜플의 선언 구문 (타입 어노테이션을 사용)
var tpl1: (Int, Int) = (100, 200)
var tpl2: (Int, String, Int) = (100, "a", 200)
var tpl3: (Int, (String, String)) = (100, ("t", "v"))
var tpl4: (String) = ("sample string")

// 앞서 정의한 tupleValue에 타입 어노테이션 적용하기
// let tupleValue: (String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)

// 튜플을 개별 변수에 바인딩하기
let (a, b, c, d, e) = tupleValue

print(a)
print(b)
print(c + 2)
print(d * 2)
print(e)

// 함수의 반환값으로 튜플 사용하기
func getTupleValue() -> (String, String, Int){
    return ("t", "v", 100)
}

let (a1, b1, c1) = getTupleValue()

print(a1)
print(b1)
print(c1)

let (a2, b2, _) = getTupleValue()

print(a2)
print(b2)
