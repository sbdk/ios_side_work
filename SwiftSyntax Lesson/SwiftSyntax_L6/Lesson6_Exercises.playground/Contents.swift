//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    let species: String
    let tail: Tail
    
    init(species: String, tailLength: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: tailLength)
    }
}

var dog = Animal(species: "dog", tailLength: 22.3)
print("\(dog.tail)")

//: __1b.__
//: Instantiate and initialize a few different Animals.

//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    static let varieties = ["green", "white"]
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen () -> String {
        self.softness++
        if self.softness > 3 {
            return "The Peach is ripe"
        } else {
            return "The Peach is not ripe"
        }
    }
}

let peach1 = Peach(variety: "green", softness: 1)
peach1.ripen()
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().

//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
//var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    var cuddlability: Int {
        get {
            let value = self.fluffiness + self.droolFactor
            return value
        }
    }
    
    func chase(wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
var theDog = FluffyDog(name: "laifu", fluffiness: 2, droolFactor: 3)
theDog.chase("haha")
theDog.cuddlability
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case Small
    case Medium
    case Large
}

var dogSize = Size.Small

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    func bark(size: Size) -> String {
        switch size {
        case .Small: return "yip yip"
        case .Medium: return "arf arf"
        case .Large: return "woof woof"
        }
    }
    
    static func speak(size: Size) -> String {
        
        switch dogSize {
        case .Small: return "low"
        case .Medium: return "Medium"
        case .Large: return "high"
        }
    }
}

var newDog = ChattyDog(name: "laifu", breed: "tianyuan", size: .Medium)
newDog.bark(newDog.size)
ChattyDog.speak(.Medium)
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().

//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.

//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case Poor, Fair, Good, Excellent
}

enum NaturalDisaster {
    case Earthquake
    case Wildfire
    case Hurricane
}

class House {
    let numberOfBedrooms: Int
    let location: Quality
 
    init(numberOfBedrooms: Int, location: Quality){
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
    
    var worthyOfAnOffer: Bool {
        
        get {
            switch (numberOfBedrooms, location){
            case (2, .Excellent), (3, .Good), (3, .Excellent):
                return true
            default:
                return false
            }
        }
    }
    
    func willStayStanding(naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .Earthquake:
            return true
        case .Wildfire:
            return true
        case .Hurricane:
            return false
        }
    }
}

var houseOne = House(numberOfBedrooms: 2, location: Quality.Good)
var willStandorNot = houseOne.willStayStanding(.Earthquake)

houseOne.worthyOfAnOffer
//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.

//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.






