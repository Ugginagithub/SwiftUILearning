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


