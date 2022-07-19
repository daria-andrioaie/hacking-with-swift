import UIKit

/// Write a function that prints out the number of letters in a string ("Taylor Swift") or a substring ("Taylor Swift".dropLast(6)) – which protocol do they both use?

func countLetters<S: StringProtocol>(string: S) -> Int{
    return string.count
}

var myString: Substring = ("I don't wanna sleep").dropFirst(7)
print(countLetters(string: myString))

/// Write a function that accepts an array of any kind of numbers, and returns the average of all the values.


// TODO: fix this buggy code
//func findAverage<Number: Numeric & Divisible>(numbers: [Number]) -> Number {
//    var sum: Number = 0
//    for number in numbers {
//        sum += number
//    }
//    return sum / (Number(exactly: numbers.count) ?? 1)
////    return Number(exactly: Int(sum) / numbers.count) ?? .zero
//}

//print(findAverage(numbers: [1, 2, 3, 4]))
