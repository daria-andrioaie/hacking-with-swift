import UIKit

var greeting = "Hello, playground"

enum GearError: Error {
    case gearOutOfBounds
}

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1
    
    mutating func changeGearUp(newGear: Int = 1) throws {
        print("---- UPCHANGING GEAR ----")
        print("Old gear is \(currentGear)")
        if currentGear + newGear > 10 {
            throw GearError.gearOutOfBounds
        }
        currentGear += newGear
        print("New gear is \(currentGear)")
    }
    mutating func changeGearDown(newGear: Int = 1) throws {
        print("---- DOWNCHANGING GEAR ----")
        print("Old gear is \(currentGear)")
        if currentGear - newGear < 1 {
            throw GearError.gearOutOfBounds
        }
        currentGear -= newGear
        print("New gear is \(currentGear)")
    }
}

do {
    var car = Car(model: "Mazda", numberOfSeats: 5)
    try car.changeGearUp()
}
catch GearError.gearOutOfBounds {
    print("Invalid attempt to change gears")
}
