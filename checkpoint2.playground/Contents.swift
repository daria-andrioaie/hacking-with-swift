import UIKit

// create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array

var array: [Int] = []
array.append(3)
array.append(2)
array.append(1)
array.append(3)
array.append(2)

print(array.count)
var set = Set(array)
print(set.count)


var n = 5
for _ in 0...n {
        print("Hi")
}

var count = 10
while count > 0 {
    
    print("\(count)")
    count -= 1
}

let id = Double.random(in: 0...1)
