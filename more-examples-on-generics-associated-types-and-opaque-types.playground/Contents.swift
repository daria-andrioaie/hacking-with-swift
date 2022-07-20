import UIKit

// generics

func swap<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}

// associated types are the way to combine protocols and generics
// they allow you to define the same protocol for multiplpe types that may be inside the protocol

protocol SomeProtocol {
    associatedtype SomePlaceholder: Equatable
    
    func someFunctionUsing(type: SomePlaceholder)
    func someFunctionReturning() -> SomePlaceholder
}

struct SomeStruct: SomeProtocol {
    typealias SomePlaceholder = Int
    
    func someFunctionUsing(type: Int) {
        print("Hi")
    }
    
    func someFunctionReturning() -> Int {
        return 1
    }
}

// opaque types solve a problem that is created by associated types
// we use them when we want to hide the informations of the type that is being returned from the function, but the compiler actually knows the underlying type

enum CardType {
    case gold
    case platinum
}

protocol CardNumberProtocol {
    
}

extension String: CardNumberProtocol {
    
}

protocol Card {
    associatedtype CardNumber: CardNumberProtocol
    var type: CardType { get set }
    var limit: Int { get set }
    var number: CardNumber { get set }
    
    func validateCardNumber(number: CardNumber)
}

struct VisaCard: Card {
    typealias CardNumber = String
    var type: CardType = .gold
    var limit: Int = 1000000
    var number: String = "4141 1234 5678 9023"
    
    func validateCardNumber(number: String) {
        
    }
}

struct MasterCard: Card {
    typealias CardNumber = String
    var type: CardType = .platinum
    var limit: Int = 500000
    var number: String = "5105 1234 5678 9023"
    
    func validateCardNumber(number: String) {
        
    }
}

func getLoanEligibility() -> Bool {
    getUserCard().limit >= getLoanEligibilityCard().limit
}

// when a protocol has associated types, you can not return the protocol itself, beacuse the compiler does not keep track of the actual type inside the underlying type that is being returned
// it only takes the rotocol as a type

//func getUserCard() -> Card {
//    MasterCard()
//}
//
//func getLoanEligibilityCard() -> Card {
//    VisaCard()
//}


// solution: to still hide the information of the actual type, but to let the compiler know the underlying type, you add "some" before the protocol
func getUserCard() -> some Card {
    MasterCard()
}

func getLoanEligibilityCard() -> some Card {
    VisaCard()
}
 
