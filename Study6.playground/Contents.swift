import UIKit

// 제어 전달문
// break
for i in 0 ... 5 {
    if i > 2 {
        break
    }
    print("\(i)")
}

// continue
for i in 0 ... 5 {
    if i < 2 {
        continue
    }
    print(i)
}

// 구문 레이블
// 1에서 5까지 반복
outer : for i in 1...5 {
    // 1에서 9까지 반복
    inner : for j in 1...9 {
        if(j == 3){
            break outer
        }
        
        // 구구단 출력
        print("\(i) X \(j) = \(i * j)")
    }
}
