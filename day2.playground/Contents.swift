import UIKit

var greeting = "Hello, playground"
var beatles = [1, 2, 3, 4]
beatles.append(8)
let string = "hi"
var scores = Array<Int>()
var strings = [String]()
strings.append("john")
strings.append("ana")
strings.append("aba")
strings.sorted()
strings.reversed()

let emp = [
    "name": "John",
    "age": "2"
]
print(emp["city", default: "Unknown"])
print(emp)

let graduates = [
    "Eric": true,
    "Ana": false,
    "John": true
]

let booleans = [
    true: 2,
    false:  3
]

var heights = [String: Bool]()
heights["Paul"] = true
heights["Ana"] = false
heights["Marc"] = false
print(heights.hashValue)

var complex = [String: Array<Int>]()
complex["Anna"] = [1,2,3,4]
complex["Paul"] = [6]
print(complex)

var actors = Set([1,2,3,5])
actors.insert(1)
print(actors.sorted())

var alal = Set<String>()
alal.insert("Hi")
alal.insert("Hi")
print(alal)


enum Weekday {
    case monday, tuesday, wednesday, sunday
}

var today = Weekday.tuesday
today = .sunday

let surname: String = "Lasso"

var drinks: [String] = [String]()

enum UIStyle {case ligth, dark, system}

var style: UIStyle = UIStyle.ligth
style = .dark

let username: Int
username = 1
print(username)
