import UIKit

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var realEstateAgent: String { get set }
    
    func getSalesSummary()
}

struct House: Building {
    let numberOfRooms: Int
    
    var cost: Int
    
    var realEstateAgent: String
    
    func getSalesSummary() {
        print("""
              House summary:
              number of rooms --- \(numberOfRooms)
              cost --- \(cost)
              agent --- \(realEstateAgent)
              
              
              """)
    }
}

struct Office: Building {
    var numberOfRooms: Int
    
    var cost: Int
    
    var realEstateAgent: String
    
    func getSalesSummary() {
        print("""
              Office summary:
              number of rooms --- \(numberOfRooms)
              cost --- \(cost)
              agent --- \(realEstateAgent)
              
              
              """)
    }
}


var house1 = House(numberOfRooms: 3, cost: 300_000, realEstateAgent: "Paul Walker")
var house2 = House(numberOfRooms: 5, cost: 800_000, realEstateAgent: "Daria A")
var office1 = Office(numberOfRooms: 10, cost: 1_200_000, realEstateAgent: "Paul Walker")
var office2 = House(numberOfRooms: 15, cost: 2_000_000, realEstateAgent: "Daria A")

var realEstateAgency: [Building] = [house1, house2, office1, office2]

realEstateAgency.forEach{$0.getSalesSummary()}
