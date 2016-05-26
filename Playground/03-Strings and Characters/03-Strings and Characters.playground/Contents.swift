//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Note
//
// Swift’s String type is bridged with Foundation’s NSString class. If you are working with the Foundation framework in Cocoa, the entire NSString API is available to call on any String value you create when type cast to NSString, as described in AnyObject. You can also use a String value with any API that requires an NSString instance.


// Initializing an Empty String

var emptyString = ""              // empty string literal
var anotherEmptyString = String() // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"



// String Mutability

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"



// Strings Are Value Types

// Swift’s String type is a value type. If you create a new String value, that String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.


var aString0 = "123"
print(aString0)

var aString1 = aString0
print(aString1)

aString0 = "000"
print(aString0)

// aString1 is still "123"
print(aString1)

func testStringIsValueType(input: String) {

    // input is not aString1 (
    // input is a new copy of aString1
    aString1 = "456"
    print(aString1)
    print(input)
}

testStringIsValueType(aString1)


// Working with Characters

for character in "abcd".characters {
    print(character)
}

// String values can be constructed by passing an array of Character values as an argument to its initializer:

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
print(catCharacters)
print(catCharacters.dynamicType)
let catString = String(catCharacters)
print(catString)
print(catString.dynamicType)
// Prints "Cat!🐱"



var welcome = "hello there"
print(welcome)

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)
// welcome now equals "hello there!"




// String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"



// Unicode Scalars

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496




// Counting Characters

// To retrieve a count of the Character values in a string, use the count property of the string’s characters property:

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// Prints "unusualMenagerie has 40 characters"


let shortString = "123456789"
print(shortString.characters.count)



let greeting = "1234567890"

print(greeting.startIndex)
print(greeting.endIndex)
greeting[greeting.startIndex]

print(greeting.endIndex.predecessor())
greeting[greeting.endIndex.predecessor()]

print(greeting.startIndex.successor())
greeting[greeting.startIndex.successor()]

print(greeting.startIndex.advancedBy(0))
print(greeting.startIndex.advancedBy(1))
print(greeting.startIndex.advancedBy(2))
print(greeting.startIndex.advancedBy(3))
print(greeting.startIndex.advancedBy(4))
print(greeting.startIndex.advancedBy(5))
print(greeting.startIndex.advancedBy(6))
print(greeting.startIndex.advancedBy(7))
print(greeting.startIndex.advancedBy(8))
print(greeting.startIndex.advancedBy(9))

let index = greeting.startIndex.advancedBy(9)
greeting[index]


for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}


// Inserting and Removing

var helloString = "hello"

helloString.insert("!", atIndex: helloString.endIndex)
print(helloString)

helloString.insert("$", atIndex: helloString.startIndex)
print(helloString)

helloString.insertContentsOf(" there".characters, at: helloString.endIndex.predecessor())
print(helloString)

helloString.removeAtIndex(helloString.endIndex.predecessor())
print(helloString)

let range = helloString.endIndex.advancedBy(-6)..<helloString.endIndex
helloString.removeRange(range)
print(helloString)











