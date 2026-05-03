//
//  LearningSwiftUI.swift
//  LearningUI
//
//  Created by Tarun on 29/04/26.
//

//29 - Apr -2026
//I am starting the swiftui...
// var t = "Tarun will become pro in ios development."
//print(t)
//"var", intialsing with this keyword can be chnaged any time.


//If we intialise with "let", keyword we can not chnage the value of particular varible, it throws error.
//let v = "varun", can't be chnaged. let does not let use to chnage its value.
// so that we will not change the values by accident.


//Now lets learn about how to create the strings.
// we can create a multi- line strings.
/*
            let myString = """
                            This is a
                            multi line
                            string
                           """

            print(myString)
 
 */

// for length of the string we can use : myString.count
// to make the string uppercase : myString.uppercased()
// to check the sufix and prefix : myString.hasPrefix("hi"), myString.hasSuffix(".jpg")

//Now lets learn how to store the whole numbers
//we can use the underscore to represnt comas for bigger number like 10,000 -> 10_000(in swift).
//swift takes 10_000 as 10000, for human readable language we can use _ for readability.

//let n = 10_000
//print(n) //10000
// we can perform mathematical operations +,-,*,/
// we can check the multiple also , eg : print(number.isMultiple(of: 3)) // gives boolean.
/************************************************************************************************************************************************************************************************************************/

//Day - 2 (1-May-26)
//How to store the truth with booleans
//let fileName = "paris.jpg"
//print(fileName.hasSuffix(".jpg"))// returns boolean.
// there is "toggle", inbuilt function, that can chnage the value of existing boolean variable,
// var isAuthenticated = false
// isAuthenticated.toggle()
//print(isAuthenticated) // prints true.


// we can join strings using '+', operator,
//let name = "tarun"
// let myString = "Hello" + "I am" + name
//Note : we cant join a string and number with '+'

//MARK: Now we will look into the arrays
// we can store integers, strings, etc...

//Example for arrays:
// var friends = ["1","2","3"], var stringss = Array<String>()
//friends.append("4") // now the array is ["1","2","3","4"]
//print(friends.count) // prints number of elements in arrays
//friends.removeAll() // removes all elements in arrays
//friends.remove(at: 2) //remove elements at 2nd index.
//print(friends.contains("4"))//prints the boolean about the element.
//print(friends.sorted()) //sorts the array.
// let reversedArray = friends.reversed() // the new array contains the reversed array of original.

//MARK: Now we will look into the dictionaries
// dictionaries are the key, value pairs. like a -> 1, b->2
// Example for dictionaries :
let employee = [
    "name": "tarun",
    "employeeID": "115",
    "department": "iOS"
]

print(employee[name, default: "Not Found"]) // if the key does not exists


//MARK: Now we will look into the sets.
//"set", is used for faster data lookup.
// sets will not store the duplicates.

let actors = set([
    "Pavan kalyan",
    "Prabhas",
    "NTR"
])
print(actors)

actors.insert("ram charan") //it will append data to the set.

//MARK: Now we will look into the enums.
// useing some flag variables may not be maintain state of the variable in regoerous flow of any functionality in apps, enums will solve this problem, these are perfect for maintaining the state.

// for example a varible is declared to have week days,
//var day = "Monday",
//day = "Friday"
//day = "Sunday"
//day = "January" //mistakenly we assigned month, for day varible,

//This type of problem will also be resolved with enums.
enum weekDay {
    case Monday, Wednesday, Friday, Sunday
    case no
}

var day = weekDay.Monday
day = .Friday
//day = weekDay.january // throws error

//MARK: Now we will chekc the "Type annotations".
let surname: String = "tarun" // the surname must be string only.(type specific)
var score:Int = 100 //same for double, string, booleans
var arrays : [Int], strings: [String]
var dict : [String:Int]

//MARK: Terniary operator
var age = 20
let canVote = age >= 18 ? "Eligible" : "Not Eligible" // WTF = What? True : False

/************************************************************************************************************************************************************************************************************************/

//Day 3: 2 - may - 2026

//MARK: Functions
//Flexible for use same block code in multiple places.

//Inbulit functions
let roll = Int.random(in: 1...20) //random is inbuild function.

//custom functions.
func showWelcome(){
    print("welcome to IOS world")
    print("lets start great...")
}
showWelcome()

//function can accept parameters, and return values.
func showWelcome(a: String) -> String{
    return "Hello welcome"
}

showWelcome(a: "Hi")

//import Cocoa : can give lot of inbuild functions like sqrt,sorted(), etc..

let root = sqrt(9)

//we can return mutiple elements like returning arrays, dictonatiors
func getUser() -> [String]{
    return ["taylor","swift"]
}

//return "tuples" more flexible then arrays and dictionaries, similar to dictionaries in usage but have differences
func getUsers() -> (firstName: String, lastName: String){
    return (firstName: "Taylor", lastName: "Swift")
}

let user = getUsers()
print("firstname is \(user.firstName), secondname is \(user.secondName)")


//MARK: Handling error in functions without crashes.

step 1:
enum PasswordError: Error {
    case short, obvious
}

step 2:
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throws PasswordError.short}
    if password == "12345" { throws PasswordError.obvious}
    
    if password.count < 8 {
        return "OK"
    }else if password.count < 10{
        return "good"
    }else{
        return "excelleent"
    }
}

step 3:
do {
    let result = try checkPassword("123")
    print("the password rating is \(result)")
}catch PasswordError.short {
    print("Please use a long password.")
}catch {
    print("There was an error with password")
}


//MARK: Creating closures.

let sayHello = {
    print("Hello all")
}

sayHello()

//check the parameters accepting and return closure
let sayHello = { (name: String) -> String in
    "Hi \(name)"
}

print(sayHello("Tarun"))

//Now closure are used for coping actual functions and use flexiblily
func yearOfAge(_ age: Int) -> String{
    if age == 12{
        return "The age is 12 exactly"
    }else{
         return "The age is not 12"
    }
}

//Closure is used.
let validAge: (Int) -> String = yearOfAge

print(validAge(13))


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//Custom sort using closures.
let reverseTeam = team.sorted {
    return $0 > $1
}

//inbuilt closures
let tOnly = team.filter {$0.hasPrefix("T")} // filters the array by which have T only.
let upperCased = team.map { $0.uppercased() } //appiles to every element in the array, and makes it uppercased.

/************************************************************************************************************************************************************************************************************************/

//Day 4 : 3 - may - 2026

//the last topic of closures are passing closures as parameters, these are known as "Trailing closures."

func makeNumberDice(size: Int, generator: () -> Int) -> [Int]{ // here we are accepting the closure as parameter
    var numbers = [Int]()
    for _ in 0...size{
        let num = generator() //here we are calling that closure to get the number
        numbers.append(num)
    }
    
    return numbers
}

let rolls = makeNumberDice(size: 10){ //this open and closed brace content is closure that we passing.
    return Int.random(in: 1...20)
}

print(rolls)

//MARK: Creating structs
//we can have functions in struct also

struct Album {
    let title : String
    let artist : String
    let year : Int
    
    func printSummary(){ // we can also pass the parameters.
        print("\(title) \(year) by \(artist)")
    }
}

let red = Album(title: "red", artist: "taylor swift", year: 2026)

red.printSummary() // here we can access the func inside the model.

//when the function inside the struct is labled with "mutating" keyword that we saying that this function elements will be changing as per conditions, and we want to access the function then the varible should intialise with var keyword, let red to var red.

//Now we can track, when a variable is changing its value anywhere, we have "didset{}", this will execute whenever the variable has changed.
struct Game{
    var score = 0 {
        
        //this executes before the value gets changed
        willSet{
            print("willset executed")
            print("The present score is \(score)")
        }
        //this executes after the value gets changed.
        didSet {
            print("Score now \(score)")
        }
    }
}

var game = Game()
game.score += 10 //here also the didset executes,
game.score -= 5//here also the didset executes,
game.score += 1//here also the didset executes,

