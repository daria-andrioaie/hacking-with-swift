import UIKit

var greeting = "Hello, playground"

func count<T: Numeric>(numbers: [T]) {
    let total = numbers.reduce(0, +)
    print("Total is \(total)")
}


// function specialization
count(numbers: [1.9, 2.1, 3.2, 4.0])
count(numbers: [1, 2, 3, 4])

protocol Prioritized {
    var priority: Int { get }
    func alterIfImportant()
}

struct Work: Prioritized {
    let priority: Int
    func alterIfImportant() {
        if priority > 3 {
            print("I'm important work")
        }
    }
}

struct Document: Prioritized {
    let priority: Int
    func alterIfImportant() {
        if priority > 5 {
            print("I'm important document")
        }
    }
}

// dynamic dispatch (at runtime)
func checkPriority(of item: Prioritized) {
    print("Checking priority..")
    item.alterIfImportant()
}

// static dispatch (at compile time) -> brings optimisation opportunities: it finds the actual type of the parameter and only compiles the functions for that type
func checkPriority<P: Prioritized>(of item: P) {
    print("Checking priority..")
    item.alterIfImportant()
}
