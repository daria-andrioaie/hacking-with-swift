import UIKit
import Foundation

protocol ItemStoring {
    associatedtype DataType
    
    var items: [DataType] { get set }
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

// Swift now realizes that String was the type used to fill the hole of DataType
struct NamesDatabase: ItemStoring {
    var items = [String]()
}

var names = NamesDatabase()
names.add(item: "Anna")
names.add(item: "James")

print(names.items)


// !! you cannot create a protocol as a generic !!
// you must instead use associated types
protocol Stack {
    associatedtype Element
    
    var count: Int { get }
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}


struct IntStack: Stack {
    // Swift can also inferr the actual type of Element
    //typealias Element = Int
    
    var count: Int {
        values.count
    }
    private var values: [Int] = []
    
    mutating func push(_ element: Int) {
        values.append(element)
    }
    mutating func pop() -> Int? {
        values.popLast()
    }
}

var stack = IntStack()
stack.push(1)
stack.push(2)
stack.push(3)


// another cool thing

struct MyStack<Item>: Stack {
    typealias Element = Item
    
    var count: Int {
        values.count
    }
    private var values: [Item] = []
    
    mutating func push(_ element: Item) {
        values.append(element)
    }
    mutating func pop() -> Item? {
        values.popLast()
    }
}

var stack2 = MyStack<Int>()
stack2.push(1)
stack2.push(2)
stack2.push(3)

var stack3 = MyStack<String>()
stack3.push("1")
stack3.push("2")
stack3.push("3")

extension Array: Stack {
    mutating func push(_ element: Element) {
        self.append(element)
    }
    
    mutating func pop() -> Element? {
        self.popLast()
    }
}

// generic constraints when you have protocols with associated types

func executeOperation<Container: Stack>(container: Container) {
    
}
