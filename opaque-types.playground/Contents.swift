import UIKit

protocol Fighter { }
struct XWing: Fighter { }

func launchFighter() -> some Fighter {
    XWing()
}

let red5 = launchFighter()

func makeInt() -> some Equatable {
    Int.random(in: 1...10)
}

let int1 = makeInt()
let int2 = makeInt()

print(int1 == int2)

func makeString() -> some Equatable {
    "Red"
}

protocol ImperialFighter {
    init()
}

struct TIEFighter: ImperialFighter { }
struct TIEAdvanced: ImperialFighter { }

func launchImperialFighter<T: ImperialFighter>() -> T {
    T()
}

let fighter1: TIEFighter = launchImperialFighter()
let fighter2: TIEAdvanced = launchImperialFighter()

