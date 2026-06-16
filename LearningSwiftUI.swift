//
//  LearningSwiftUI.swift
//  LearningUI
//
//  Created by Tarun on 29/04/26.
//


//Topics Learnt:
//--------------
// Leanrt about basics
// Learnt about linear gradient
// HStack, Vstack, Zstack
// NavigationStack, List, Form, Buttons, Images
// Enums, Closures
// Struct , classes
// Basic Structure of Switui
// CoreML
// Animations
// observables




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


// 8 - May - 2026:
//MARK: Access  controls.

// 1. private : we can access the variable within the class or struct or method.
// 2. fileprivate : we can access the variable within the file only, out side the intialised file we can't access.
// 3. public : anywhere we can access the variable.
// 4. private(set) : we can print or see the value, but we cant edit its value.(required for banl apps.)

struct Bankaccount{
    private(set) var funds = 0 // here this variable cant be accessed from outside of the struct and cant set value to the
    
    
    mutating func deposit(_ amount: Int){
        funds += amount
    }
    
    mutating func withdraw(_ amount: Int) -> Bool{
        if funds > amount{
            funds -= amount
            return true
        }else{
            return false
        }
    }
}

var account = Bankaccount()
account.deposit(100)
let success = account.withdraw(100)

if success{
    print("Withdraw amount successful.")
}else{
    print("Failed to get money.")
}


//MARK: Static keyword.
// if we use static keyword we dont need to create instance of it. we can access the variable or function anywhere in project.
class AppConfig {
    static let appName = "MyApp"
}

print(AppConfig.appName)

//Constants examples
struct Constants {
    static let baseURL = "https://api.example.com"
}
Constants.baseURL //use it anywhere.

//Helper function examples.
class Utils {
    static func showLog() {
        print("Logging")
    }
}

Utils.showLog()

//Singleton Pattern
class NetworkManager {
    static let shared = NetworkManager()
}
NetworkManager.shared // anywhere in project.


//11 - May - 2026:
//MARK: Creating classes.

//Similarities between structs and class :
// 1. You can create and name them.
// 2. Add properities, methods, property observers and access controls.
// 3. create the custom intializers, to configure new instances.

//Differences are:
// 1. You can do inheritence in class. classes support inheritence.
// 2. swift won't generate a memberwise intializer for classes.
// 3. if you copy an instance of class, both copies points or share to same data.
// 4. we can add a deintializer to run when the final copy is destroyed.
// 5. Constant class instances can have thier variable properities changed.

// A,B,C,D classes points to the same data, if you change data in A, then all the other classes data also changes.
// If all classes A,B,C,D does not points to the data, then deintializer comes into picture, the deintializer destory the maintained data, when nothing is using it.
// we can also share methods in inheritence, we can also override methods using keyword "override"
// If we using "final" keyword, there will be no child class for it.
// Classes are refernce typed, but the structs are different.
// Classes dont need to have "mutating" keyword to chnage methods.


//Example for inheritence:
class Employee {
    var hours: Int
    
    init(hours: Int){
        self.hours = hours
    }
}

class Developer: Employee{
    func work(){
        print("I'm writing code for \(hours) hours to complete.")
    }
}

class Manager: Employee{
    func work(){
        print("I am going to meetings for \(hours) hours.")
    }
}

var robert = Developer(hours: 8)
var charles = Manager(hours: 10)

robert.work()
charles.work()

// Swift intializers.
class Vehicle{
    var isElectric : Bool
    
    init(isElectric: Bool){
        self.isElectric = isElectric
    }
}

//While intializing in inherited class, we need to use the "super", keyword and intialize the parent class intilizer, else swift will not build the code
class car: Vehicle{
    var isConvertible : Bool
    
    init(isElectric: Bool, isConvertible: Bool){
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // need to give this, very important.
    }
}

//Deintializers
// 1. You don't use func, with deintializers
// 2. Deintializers will not take parameters and never return any data.
// 3. Deinitializers run when the last copy of a class instane is destroyed.
// 4. we never call deinitialzers directly.
// 5. Structs dont have deintializers, because they are not copies, they are uniqueu values.

class User {
    var id: Int
    
    init(id: Int){
        self.id = id
        print("User \(id): is alive")
    }
    
    deinit{
        print("User \(id) is dead.")
    }
}


//When you make the varible instances, the data will chnage every time, when instance variable value gets changed.
class AB{
    var name = "paul"
}

var user = AB() // initialized with "var" allows to chnage the instance, if we create with "let", we cant create another instance with same name.
user.name = "Tarun"
print(user.name) // print Tarun.
user = AB()
print(user.name) // print Paul.


//MARK: Protocols creating and using them.
// Protocols are like rules for the code, with protocols ,we can say these methods must and should exist and work with them. There will be other methods also if we need.
// for creating protocol we use "protocol" keyword.
// we can use protocols in Structs and class also, we should extend it.

protocol Vehicle{
    //Inside protocol, we dont have the implementation body in it, we see the surface. No function bodies.
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car : Vehicle{
    func estimatedTime(for distance: Int) -> Int{
        return distance / 60
    }
    
    func travel(distance: Int){
        print("I am driving for \(distance) kms")
    }
    
    func openSunRoof(){
        print("It's a nice day!")
    }
}

//Topic : Opaque return types.
// By using Equatable keyword we can make the function as generic return type, reuirement : if we write the code to return for int but the after some day yoju want to return double, then no need to chnage every piece code that uses this function which returns int,

func getRandomNumber() -> some Equatable { // This specifies that return type is flexible.
    Int.random(in: 1...6) // After some day, you can also change this as Double.random(in: 1...6)
}

print(getRandomNumber())

//Topic : create and use extensions.
//Extensions means adding new functionality to existing types.
var quote = " The truth is rarely pure and never simple "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)// we can replace with extesnion

let trimmed = quote.trimmed()// easy with extesnion.

extension String{
    func trimmed() -> String{
        self.trimmed(in: .whitespacesAndNewlines)
    }
}

//Topic : optionals (handling missing data.)

//intializing
var username : String? = nil // same for integers, double,

let opposites = ["Mario":"Wario","luigi":"Waluigi"]

//to handle the optional data, we have using "if let", it safe and makes behaviour as expected.

if let marioOpp = opposites["Mario"]{ // here we are handling the optional data in dictionary.
    print("Mario's opposite is \(marioOpp)") // this executes only when if let condition valid, i.e. it there exsists some value.
}

//Topic : unwrap optionals with guard let
func printSquare(of number : Int?){
    guard let number = number else{
        print("Missing number")
        return
    }
    print("\(number) X \(number) = \(number * number)")
}


//Topic : unwrap optionals with nil coalescing

//nil coalescing operator is appiles for everything, dictionaries, arrays, integers, etc... and provides the default values if the values are nil.

let captains = [
    "pat cummins" : "Sunrisers Hyderabad",
    "rohit": "Mumbai Indians",
    "ms dhoni": "Chennai Super Kings"
]

let captain = captains["sachin"] ?? "Unknown" // here we are handling with default values.
// for dictionaries we can do as captains["sachin", default : "Unknown"]



//Topic : optional chaining...
let names = ["arya","brandon","sansa", "robb"]
let chosen = names.randomElement()?.uppercased() ?? "No one" // here we are keeping open for "randomElement", if one element in optional chain is nil, then whole chain will be ignored.
print("the chosen is \(chosen)")

//********************************************************************************************************************************************************************************************************

//18 - May - 2026:
//MARK: Basic structure of swiftUI project.

// when we create we swiftui project we will get some files : 1. Content View 2. Assests 3.<YourAppName>App.

// 1. <YourAppName>App.swift file contents "main" components, its like appdelegate in uikit, In this file it make alive the app components, if it is written in this file.
// 2. ContentView.swift contents all the view's content here.

//Code:
import SwiftUI // Apple's advanced framework
struct ContentView: View { //Here "View" is a protocol from swiftui, common protocol for every time.
    var body: some View { //Here "body" contains the main content of the view and returns "some view", which contains data.
        VStack { // Here we applied the vertical stack to maintain the data,
            Image(systemName: "globe") // this is the way to keep the ImageView.
                .imageScale(.large) //these are "viewModifiers".
                .foregroundStyle(.tint)
            Text("Hello, world!") // this is the way to have the text in our view.
        }
        .padding()
    }
}

//This piece of code is responsibile for previewing our code in canvas, rightside of desktop. Same like if we referesh, the added code reflects on the screen, if add code in preview it refresh on the screen.
#Preview {
    ContentView()
}

//MARK: From now we will build apps and we should follow this sequenece of checking projects.


//MARK: Check FirstSwiftUI App for these, Now I am creating the forms,naviagtionStatk

//MARK: 20-may - 2026
//Today I am going to start new project call "Guess the flag app", check it out, learned about stacks, buttons, images, gradients.. etc.

//MARK: 22 - may - 2026
//Today I goint to start another project, which is more techcinal and why using elements in swiftui.

//Structs using : why to use the struct instead of class, in uikit we use classes but here we are mainly using structs
                    -> Structs are more faster than class.
                    -> UIKit all views are inheritetd from uiview,


//Basic structure of swift code
struct ContentView: View { // here the "ContentView", is the name of the structure and ": View", it will follow view protocol, so that it is conforms that it will return a "body",
    var body: some View { // Here we are using "some view", this conforms we will return "some view", we are just not wrtiing "View" because it is a protocol,
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        Button("Tapp me"){
            print("Button tapped...")
        }
    }
}

//MARK: Conditional modifiers: is nothing but using ternary operators.
// .foregrourd(useRedText ? .red : .blue) // here if useRedText varaible is true, then using red color.else using blue color, replacess if else.

//MARK: View as properities
struct ContentView : View{
    
    //Type1 : we can send the view like this also.
    var moto1: some View{
        Text("Hello, world.")
    }
    //Type2 : we can send the view like this also.
    let moto2 = Text("World is great.")
    
    //Type3 : we can send the multiple - view like this.
    var spells: some View{
        Group {
            Text("Lumos")
            Text("Creams")
        }
    }
    
    //Type4 : Using view builder
    @ViewBuilder var spells: some View{
        Text("Lumos")
        Text("Creams")
    }
    
    
    var body : some View{
        moto1
            .foregroundStyle(.red)
        moto2
            .foregroundStyle(.blue)
    }
}

//MARK: now we will be using custom modifiers
struct Title : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View{
    func titleStyle() -> some View{
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
//            .modifier(Title()) // here we are applying our custom modifier using keyword "modifier".
            .titleStyle()
    }
}

// 27 - may - 2026
//MARK: "stepper",
var body: some View {
    Stepper("\(sleepingHours.formatted()) hours", value: $sleepingHours, in: 4...12, step: 0.25) //we can give range and as well as step range of chnage.
    
    //$sleepingHours means two-way connection of state of varible, reads the values and update the value.
    //sleepingHours means only the writes the current state value.
}


//MARK: Learning a powerful tool "COREML"
-> There 2 important things
        1. CoreML is a framework that runs on Apple's platforms (iOS, macOS, tvOS, watchOS), which uses the machine learning models.
        2. CreateML is a framework that allows you to create your own machine learning models.
        3. its important to know that what input it requires and what output it will give for a model.

-> Steps to use:
1. click top-left corner of xcode -> DeveloperTools -> Create ML.
2. create new project. Click on tabular regression.
3. click on next, give name and author name.
4. upload the training data i.e. betterSleep csv file. to train our model.
5. Now give target and features. target = (output needed i.e. actualSleep(in csv file)). features = (inputs i.e. wake, gender, height, weight).
6.Below we have parameters to train our model, we should provide an algorithm to work on data. but xcode has an fetures that it automatically selects the algorithm for us.
7. click on train(play button on top).
8. Now go to evalution column and check the results.
9. Go to output column, so that we can download the model.provides .mlmodel file.
10. If we want to modify our training model algorithm or any other parameter, go to settings columnun and right click on model sources's model and will get new model option to edit.



//MARK: This is about ARC (Automatic Reference Counting)
1.  In Swift, memory is managed by ARC (Automatic Reference Counting). ARC keeps track of how many references point to an object.
Code:
        class Person {
            let name: String

            init(name: String) {
                self.name = name
                print("Init")
            }

            deinit {
                print("Deinit")
            }
        }

        var person: Person? = Person(name: "Tarun") //reference count is 1
        person = nil //reference count is 0 as the object became nil.
    Note : When the reference count becomes 0, ARC removes the object.

2. weak solves retain cycles because ARC does not increase the reference count for weak references. When the last strong reference is removed, the object is deallocated and all weak references are automatically set to nil.
                                 ->Strong reference = ownership.
                                 ->Weak reference = just a reference, no ownership.
3. How to check the memory leaks
                            -> Product -> Profile -> Leaks -> Start Recording -> Build -> Record -> Stop Recording.
4. How to know CPU usage of particular place:
                            -> Product -> Profile -> Time profiler (we can see cpu usage in xcode project debug navigator, but this time profiler will show exact place to where to optimise, is it auto layout or any function or any tableview).
5. Performance optimisation:
            -> If an api loads bulk number of images instantly, there will be a lot of memory consumption, battery usage, and may UI freezes while scrolling, this can be handle by using SDWebImage or kingFisher, this will only load images for first time, and then store them in cache for future use.This can make performance optimised.
6. UITableView Optimization:
            -> Bad usage :
                    cell.layer.cornerRadius = 10
                    cell.layer.shadowOpacity = 0.8
                    inside : cellForRowAt
            -> Optimised usage :
                    awakeFromNib() or init()
7. Avoid main thread blocking:
           ->Bad usage : ( On main thread )
                        let data = try Data(contentsOf: url), the ui may frezzes
           -> Optimised usage :
                        DispatchQueue.global().async {
                                    let data = try? Data(contentsOf: url)

                                    DispatchQueue.main.async {
                                        elf.imageView.image = UIImage(data: data!)
                                    }
                          }


//15 - Jun - 2026
Today I am gonna learn about the animations in SwiftUI.
Animations: (Checkout project animations.)
--------------
-> There are 2 types of animations: 1. Implict and 2. Explicit.
