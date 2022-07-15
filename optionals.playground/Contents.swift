import UIKit

let opposites = ["Mario": "Wario", "Ana": "Banana"]


// SHADOWING with let
if let peachOpposite = opposites["Peach"] {
    print("The opposite of peach is \(peachOpposite)")
} else {
    print("There is no opposite for peach")
}

/// QUATERNARY OPERATOR
/// or NIL COALESCING
print(opposites["Peach"] ?? "No opposite for peach")


// SHADOWING with guard
func printSquare(of number: Int?){
    guard let number = number else {
        print("Missing input")
        return
    }
    print("The number is \(number)")
}

printSquare(of: 9)

// OPTIONAL CHAINING

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("\(chosen)")

struct Book {
    var name: String
    var author: String?
}

var book1: Book? = Book(name: "12 rules for life", author: "wede")

func uppercaseInitial(book: Book?) -> String {
    book?.author?.first?.uppercased() ?? "No author"
}

print(uppercaseInitial(book: book1))

// try? and try! with error handling
// try? return nil if the function threw an error

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("The username is \(user)")
}
