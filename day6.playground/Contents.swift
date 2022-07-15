import UIKit

var greeting = "Hello, playground"

func tendGarden(number: Int, activities: () -> Void){

    activities()
    print("I love gardening")
}


var activity = {(number2: Int) in
    print(number2)
}

var int = 5

tendGarden(number: int) {
    activity(int)
}
