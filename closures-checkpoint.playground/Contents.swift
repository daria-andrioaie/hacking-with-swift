import UIKit
import Foundation

// Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


let result = luckyNumbers.filter{!$0.isMultiple(of: 2)}.sorted{$0 < $1}.map{(value: Int) -> String in
    return "\(value) is a lucky number"
}
for string in result{
    print(string)
}
print(result)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void){
    
    first()
    print("1 done")
    second()
    print("2 done")
    third()
    print("3 done")
    print("All done")
}


doImportantWork{
    print("First work")
} second: {
    print("Second work")
} third: {
    print("Third work")
}

