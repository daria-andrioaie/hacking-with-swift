import UIKit


class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


/// INHERITANCE

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I'm work for \(hours) hours a day")
    }
}


/// final means that the class cannot be inherited any further by any other classes
final class Developer : Employee {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
    override func printSummary() {
        print("Developer overridden employee method")

    }
}

final class Manager : Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours")
    }
}

let robert = Developer(hours: 8)
let john = Manager(hours: 10)
robert.work()
robert.printSummary()
john.work()


/// classes are reference types
/// if you want to deepcopy from a class, you need a new instance of the class and copy each and every property by hand


class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let newUser = User()
        newUser.username = username
        return newUser
    }
}

let user = User()
let user2 = user.copy()


/// DESTROYNG AN OBJECT

/// deinitializers are called automaticlly when the last copy of the class instance
///
/// when a variable is existing its scope, it is destroyed

class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Creating object with id \(self.id)")
    }
    deinit {
        print("User \(id) is dead")
    }
}

var users = [User2]()
for i in 0...4 {
    let user = User2(id: i)
    users.append(user)
    let userCopy = user
}

print("Loop is finished")
users.removeAll()
