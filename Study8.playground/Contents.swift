import UIKit

// 집합
// 초기값을 사용한 집합 정의
var genres: Set = ["Classic", "Rock", "Balad"]

// 빈 배열을 사용하여 집합 정의
var genres2: Set<String> = []
genres2.insert("Classic")
genres2.insert("Rock")
genres2.insert("Balad")

// isEmpty 를 이용해 집합이 비어있는지 확인하기
if genres.isEmpty {
    print("집합이 비어있습니다.")
} else {
    print("집합에는 현재 \(genres.count)개의 아이템이 저장되어 있습니다.")
}

genres.insert("Balad")

print(genres.count)

// 집합 순회 탐색
for i in genres {
    print("\(i)")
}

// sorted() 함수
for i in genres.sorted() {
    print("\(i)")
}

// 집합의 동적 추가와 삭제
var genres3: Set = ["Classic", "Rock", "Balad"]

genres3.insert("Jazz")
// gneres3 = {"Jazz", "Classic", "Rock", "Balad"}
genres3.insert("Rock")
// gneres3 = {"Jazz", "Classic", "Rock", "Balad"}
genres3.insert("Rock")
// gneres3 = {"Jazz", "Classic", "Rock", "Balad"}

// 집합중 원하는 값 삭제
if let removedItem = genres3.remove("Rock") {
    print("아이템 \(removedItem)의 삭제가 완료되었습니다.")
} else {
    print("삭제할 값이 없습니다.")
}

// 집합의 모든 값 삭제
genres3.removeAll() // 집합의 모든 아이템 삭제

if genres3.isEmpty {
    print("모든 아이템이 삭제되었습니다.")
} else {
    print("아직 \(genres3.count)개의 아이템이 남아있습니다.")
}

// contains 메소드를 이용하여 저장된 값 확인하기
var genres4: Set = ["Classic", "Rock", "Balad"]

if genres4.contains("Rock") {
    print("Rock 아이템이 저장되어 있습니다.")
} else {
    print("Rock 아이템이 저장되어 있지 않습니다.")
}

// 집합 연산
// 기본 집합 연산
var odd: Set = [1, 3, 5, 7, 9] // 홀수 집합
let even: Set = [0, 2, 4, 6, 8] // 짝수 집합
let prime: Set = [2, 3, 5, 7] // 소수 집합

odd.intersection(even).sorted()
// []
odd.symmetricDifference(prime).sorted()
// [1, 2, 9]
odd.union(even).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
odd.subtract(prime)
odd.sorted()
// [1, 9]

// 부분집합과 포함관계 판단 연산
let A: Set = [1, 3, 5, 7, 9]
let B: Set = [3, 5]
let C: Set = [3, 5]
let D: Set = [2, 4, 6]

B.isSubset(of: A) //true
A.isSuperset(of: B) // true
C.isStrictSubset(of: A) // true
C.isStrictSubset(of: B) // false
A.isDisjoint(with: D) // true

// 배열의 중복을 제거하는 방법
var E = [4, 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]  // 배열
let F = Set(E)                              // 집합
E = Array(F)                                // 중복이 제거된 배열
// [2, 4, 9, 5, 7, 3, 1, 11]

// 더짧게 줄이는 방법
E = Array(Set(E))
