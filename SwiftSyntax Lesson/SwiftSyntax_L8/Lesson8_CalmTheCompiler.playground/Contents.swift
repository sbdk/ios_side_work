//: ### Calm the compiler
// Problem 1
protocol DirtyDeeds {
    func cheat()
    func steal()
}

class Minion: DirtyDeeds, Souschef {
    var name: String
    
    init(name:String) {
        self.name =  name
    }
    
    func cheat() {
        print("haha")
    }
    
    func steal() {
        print("hoho")
    }
    
    func chop(vegetable: String) -> String {
        print("haha")
    }
    
    func rinse(vegetable: String) -> String {
        print("haha")
    }
}

// Problem 2
class DinnerCrew {
    var members: [Souschef]
    
    init(members: [Souschef]) {
        self.members = members
    }
}

protocol Souschef {
    func chop(vegetable: String) -> String
    func rinse(vegetable:String) -> String
}

var deviousDinnerCrew = DinnerCrew(members: [Minion]())

// Problem 3
protocol DogWalker {
    func throwBall(numberOfTimes:Int) -> Int
    func rubBelly()
}

class Neighbor: DogWalker {
    
    func throwBall(numberOfTimes:Int) -> Int {
        var count = 0
        while count < numberOfTimes {
            print("Go get it!")
            count++
        }
        return count
    }
    
    func rubBelly() {
        print("Rub rub")
    }
}
