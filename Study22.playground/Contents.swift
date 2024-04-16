import UIKit

// 옵셔널 타입
// 옵셔널 타입의 문제점
struct Human {
    var name: String?
    var man: Bool = true
}

var boy: Human? = Human(name: "홍길동", man: true)

if boy != nil {
    if boy!.name != nil {
        print("이름은 \(boy!.name!)입니다.")
    }
}

// 혹은

if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다.")
    }
}

boy?.name

boy?.name = "Peter"

print(boy?.man)
// Optional(true)
