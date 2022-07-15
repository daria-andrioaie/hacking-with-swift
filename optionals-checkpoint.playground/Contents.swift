import UIKit

/// write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

var array: Array<Int> = [-2, -4, -1, 0]
var array2: Array<Int> = []
func randomNumber(numbers: Array<Int>?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

let result: Int = randomNumber(numbers: nil)
print("result: \(result)")
