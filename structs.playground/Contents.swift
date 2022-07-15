import UIKit

var greeting = "Hello, playground"

// struct names must start with capital letter
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) (\(year)) by \(artist)")
    }
}


var a1 : Album = Album(title: "t1", artist: "a1",year: 1234)

a1.printSummary()


/// you cannot change the values of a struct
/// you must mar a function as "mutating" to do so
/// structs have their own init created automatically in the background
struct Employee {
    
    /// properties
    /// let name = "Default Name" this line would fix the value of the name forever, so yo cannot pass a name parameter when instatiating the struct, because it is a let and you cannot change its default value
    let name : String
    /// default
    var vacationRemaining = 14
    
    /// methods
    mutating func takeVacation(days: Int) {
            if vacationRemaining > days {
                
                /// compile error
                vacationRemaining -= days
                print("I'm going on vacation!")
                print("Days remaining: \(vacationRemaining)")
            } else {
                print("Oops! There aren't enough days remaining.")
            }
        }
}

/// you cannot call mutating functions on constants instatiation of structs
/// initializer

var e1 = Employee(name: "E1")
var archer = Employee(name: "N1", vacationRemaining: 14)
archer.takeVacation(days: 9)
print(archer.vacationRemaining)



/// DYNAMIC PROPERTIES

struct Employee2 {
    let name: String
 
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // whenever we request this property, it will rerun this code and compute the value "dynamically"
    /// they mst always have an explicit type
    
    /// you cannot write a dynamically computed property without a setter
    /// computed properties MUST be variables, they cannot be constants for obvious reasons
    ///
    /// a computed property must return the value, although you can also omit the word "return"
    /// you must ensure that it returns a value on all eventualities
    var vacationRemaining: Int {
        get{
            vacationAllocated - vacationTaken
        }
        set {
            /// sets the value of the property to the given newValue and allows you to run some more code, so that the rest of the properties are consistent with the new value
            vacationAllocated = vacationTaken + newValue /// provided inside the setter by Swift
        }
    }
}

var archer1 = Employee2(name: "N1")
archer1.vacationTaken += 4
print(archer1.vacationRemaining)
archer1.vacationRemaining = 5


/// PROPERTY OBSERVERS
///

struct Game {
    var score = 0 {
        didSet{
            /// didSet also offers an OldValue
            print("Score is now \(score)")
        }
    }
}

struct App {
    var contacts = [String](){
        willSet{
            
            /// executes right BEFORE the change of the property
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
                    
        }
        didSet {
            /// executes right AFTER the change of the property
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}
/// you can't attach a property observer to a constant, because it will never change

/// don't put too much code in your property observers
var app = App()
app.contacts.append("Daria")
app.contacts.append("Paul")
app.contacts.append("Ana")



/// CREATING CUSTOM INITIALISERZ
/// every property must be initialised within a custom initialiser!
///
///
///
struct Player {
    let name: String
    let number: Int
    
    init(name: String){
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}


/// YOU CAN ONLY RUN OTHER ETHODS INSIDE THE INITIALIZER ONCE ALL PROPERTIES HAVE BEEN SET
///
/// after defining a custom init, you cannot use the one provided automatically
let player = Player(name: "Megan")
print(player.number)



/// ACCESS CONTROL

struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/// PRIVATE - within the struct
/// FILEPRIVATE - within the current file
/// PUBLIC - anyone, anywhere
/// PRIVATE(SET) -- let ayone read the value, but oly modify from within the struct
