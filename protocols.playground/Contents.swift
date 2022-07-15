import UIKit

var greeting = "Hello, playground"

/// protocols don't implement the functions that they declare
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/// if you conform a protocol, you must implement all the methods of the protocol, but they can add new ones
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm drivind \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day")
    }
}

struct Bike: Vehicle {
    let name = "Bike"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day")
    }
}


func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow")
    }
    else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name) takes \(estimate) to travel \(distance) kms")
    }
}


let car = Car()
commute(distance: 3, using: car)

let bike = Bike()
commute(distance: 79, using: bike)

getTravelEstimates(using: [Car(), Bike()], distance: 100)


/// OPAQUE RETURN TYPES

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())



/// EXTENSIONS

var quote = "   w wfhe rh4r wefkj    "
print(quote)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }
    
    func lines() -> [String]{
        self.components(separatedBy: .newlines)
    }
}

quote.trim()
print(quote)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int


}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}


/// PROTOCOL EXTENSIONS

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]


if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


// to add a default implementation for a method inside a protocol, you can do it through a protocol extension

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello(){
        print("Hello! My name is \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


/// FURTHER INFO
///

/// Self with capital letter returns the type of the current variable
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

struct User: Equatable {
    let name: String
}

let user1 = User(name: "Link")
let user2 = User(name: "Sophia")
print(user1 == user2)
print(user1 != user2)
