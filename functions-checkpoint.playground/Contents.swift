import UIKit

var greeting = "Hello, playground"


// write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number


enum SquareRootError: Error {
    case outOfBounds(message: String)
    case notAPerfectSquare(message: String)
}

func findSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds(message: "The number is out of bounds")
    }
    var divisor: Int = 1
    while divisor * divisor != number && divisor <= 100 {
        divisor += 1
    }
    if divisor == number{
        throw SquareRootError.notAPerfectSquare(message: "The number \(number) is not a perfect square")
    }
    return divisor
}

do {
    let number = 10001
    let square = try findSquareRoot(of: number)
        print("The square of \(number) is \(square)")

    
}
catch SquareRootError.outOfBounds(let message){
    print(message)
}
catch SquareRootError.notAPerfectSquare(let message){
    print(message)
}

