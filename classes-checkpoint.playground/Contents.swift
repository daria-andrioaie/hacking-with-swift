import UIKit

var greeting = "Hello, playground"

class Animal {
    var numberOfLegs: Int
    
    init(numberOfLegs: Int){
        self.numberOfLegs = numberOfLegs
    }
    

}

class Dog : Animal {
    init(numberOfLegs: Int = 4){
        super.init(numberOfLegs)
    }
    
    func speak(){
        print("woof woof")
    }
    
    
}

class Corgi : Dog {
    init(numberOfLegs: Int = 4){
        super.init(numberOfLegs)
    }
    
    override func speak(){
        print("I'm a CORGI")
    }
}

class Poodle : Dog {
    init(numberOfLegs: Int = 4){
        super.init(numberOfLegs)
    }
    
    override func speak(){
        print("I'm a POODLE")
    }
}


class Cat : Animal {
    var isTame: Boolean
    
    init(numberOfLegs: Int = 4, isTame: Boolean){
        self.isTame = isTame
        super.init(numberOfLegs)
    }
    
    func speak(){
        print("I'm just a cat speaking")
    }
    
    
}

class Persian : Cat {
    init(numberOfLegs: Int = 4, isTame: Boolean){
        super.init(numberOfLegs)
    }
    
    override func speak(){
        print("I'm a PERSIAN cat")
    }
}

class Lion : Cat {
    init(numberOfLegs: Int = 4, isTame: Boolean){
        super.init(numberOfLegs)
    }
    
    override func speak(){
        print("I'm a LION")
    }
}

