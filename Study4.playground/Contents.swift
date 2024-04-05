import UIKit

// 반복문
// for ~ in 반복문
for row in 1 ... 5 {
    print(row)
}

for i in 1 ... 9 {
    print(" 2 X \(i) = \(i * 2)")
}


let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1 ... size {
    keyword = padChar + keyword
}

print("\(keyword)")


for i in 2 ... 9 {
    for j in 1 ... 9 {
        print("\(i) X \(j) = \(i * j)", terminator: "\t")
    }
    print()
}

// while 반복문
var n = 2
while n < 1000 {
    n *= 2
}

print("n = \(n)")

// repeat ~ while 반복문
var m = 1024
while m < 1000 {
    m *= 2
}
print("m = \(m)")

var m2 = 1024
repeat {
    m2 *= 2
} while m2 < 1000

print("m2 = \(m2)")
