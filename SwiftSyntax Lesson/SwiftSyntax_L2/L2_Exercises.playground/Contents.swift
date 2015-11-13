import UIKit

//: # Lesson 2 Exercises
//: ## Optionals
//: ### Exercise 1
//: When retrieving a value from a dictionary, Swift returns an optional.
//:
//: 1a) The variable, director, is an optional type. Its value cannot be used until it is unwrapped. Use `if let` to carefully unwrap the value returned by `moviesDict[movie]`
var moviesDict:Dictionary = [ "Star Wars":"George Lucas", "Point Break":"Kathryn Bigelow"]
var movie = "Star "
var director = moviesDict[movie]

if let directorBest = director {
    print("the director is \(directorBest)")
} else {
    print("there is no movie picked")
}
//: 1b) Test your code by inserting different values for the variable `movie`.

//: ### Exercise 2
//: The LoginViewController class below needs a UITextField to hold a user's name. Declare a variable for this text field as a property of the class LoginViewController. Keep in mind that the textfield property will not be initialized until after the view controller is constructed.
class LoginViewController: UIViewController {
    
    var textArea: UITextField!
    
}

//: ### Exercise 3
//: The Swift Int type has an initializer that takes a string as a parameter and returns an optional of type Int?.
//:
//: 3a) Finish the code below by safely unwrapping the constant, `number`.
var numericalString = "thia"
var number = Int(numericalString)
//TODO: Unwrap number to make the following print statement more readable.

if let Number = number {
    print("\(number) is the magic number.")
} else {
    print("this is not a number")
}

//: 3b) Change the value of numericalString to "three" and execute the playground again.

//: ### Exercise 4
//: The class UIViewController has a property called tabBarController.  The tabBarController property is an optional of type UITabBarController?. The tabBarController itself holds a tabBar as a property. Complete the code below by filling in the appropriate use of optional chaining to access the tab bar property.
var viewController = UIViewController()
if let tabBar = viewController.tabBarController?.tabBar {
    print("Here's the tab bar.")
} else {
    print("No tab bar controller found.")
}
//: ### Exercise 5
//: Below is a dictionary of paintings and artists.
//:
//: 5a) The variable, artist, is an optional type. Its value cannot be used until it is unwrapped. Use `if let` to carefully unwrap the value returned by `paintingDict[painting]`.

var paintingDict:Dictionary = [ "Guernica":"Picasso", "Mona Lisa": "da Vinci", "No. 5": "Pollock"]
var painting = "Mona Lisa"
var artist = paintingDict[painting]

if let painter = artist {
    print("it's \(artist)")
} else {
    print("there is no painter here")
}
//: 5b) Test your code by inserting different values for the variable `painting`.

//: ### Exercise 6
//: Set the width of the cancel button below.  Notice that the cancelButton variable is declared as an implicitly unwrapped optional.
var anotherViewController = UIViewController()
var cancelButton: UIBarButtonItem!
cancelButton = UIBarButtonItem()

cancelButton.width = 50

// TODO: Set the width of the cancel button.
//: ### Exercise 7
//: The class UIViewController has a property called parentViewController.  The parentViewController property is an optional of type UIViewController?. We can't always be sure that a given view controller has a parentViewController.  Safely unwrap the parentViewController property below using if let.
var childViewController = UIViewController()

if let newView = childViewController.parentViewController {
    print("haha")
} else {
    print("no parents, let's party")
    
}
// TODO: Safely unwrap childViewController.parentViewController
