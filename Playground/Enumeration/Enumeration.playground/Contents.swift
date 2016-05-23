//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground Enumeration"

//
// Enumeration
// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html
//

enum SomeEnumeration {
    // enumeration definition goes here
}

enum SomeEnumerationInt: Int {
    case first = 0
    case second
    case third
    case fourth
}

var enumerationInt = SomeEnumerationInt.second
print(enumerationInt)
print(enumerationInt.dynamicType)
print(enumerationInt.rawValue)
print(enumerationInt.hashValue)

enum CompassPoint: String {
    case North // enumeration case
    case South
    case East
    case West
}

//enum CompassPoint: String {
//    case North = "North"       // enumeration case
//    case South = "South"
//    case East  = "East"
//    case West  = "West"
//}

// Note:
//
// Unlike C and Objective-C, Swift enumeration cases are not assigned a default integer value when they are created. In the CompassPoint example above, North, South, East and West do not implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.
//

var directionToHead = CompassPoint.West
print(directionToHead)
print(directionToHead.dynamicType)
print(directionToHead.rawValue)
print(directionToHead.hashValue)

directionToHead = CompassPoint.North
print(directionToHead)
print(directionToHead.rawValue)
print(directionToHead.dynamicType)

// The type of directionToHead is inferred when it is initialized with one of the possible values of CompassPoint. Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:

directionToHead = .East
print(directionToHead)
print(directionToHead.rawValue)
print(directionToHead.dynamicType)




// Multiple cases can appear on a single line, separated by commas:
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}


let somePlanet = Planet.Earth
switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
}


//
// Associated Values
//

enum Barcode {

    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

// This can be read as:
// “Define an enumeration type called Barcode, which can take either a value of UPCA with an associated value of type (Int, Int, Int, Int), or a value of QRCode with an associated value of type String.”


// This definition does not provide any actual Int or String values—it just defines the type of associated values that Barcode constants and variables can store when they are equal to Barcode.UPCA or Barcode.QRCode.


// New barcodes can then be created using either type:
// This example creates a new variable called productBarcode and assigns it a value of Barcode.UPCA with an associated tuple value of (8, 85909, 51226, 3)

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
print(productBarcode)
print(productBarcode.dynamicType)
//print(productBarcode.rawValue)
//print(productBarcode.hashValue)

productBarcode = .QRCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
    
    case .UPCA(let numberSystem, let manufacturer, let product, let check):
        print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    
    case .QRCode(let productCode):
        print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."




// Here’s an example that stores raw ASCII values alongside named enumeration cases:

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// Here, the raw values for an enumeration called ASCIIControlCharacter are defined to be of type Character, and are set to some of the more common ASCII control characters. Character values are described in Strings and Characters.



// Note
//
// Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.
//



//
// Implicitly Assigned Raw Values
//

// let earthsOrder = Planet.Earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint.West.rawValue
// sunsetDirection is "West"

enum testInt: Int {
    case test1 = 100
    case test2
    case test3
    case test4
}

let aTest = testInt(rawValue: 103)
print(aTest)
print(aTest.dynamicType)
print(aTest?.rawValue)
print(aTest?.hashValue)

let bTest = testInt(rawValue: 3)
print(bTest)
print(bTest.dynamicType)
print(bTest?.rawValue)
print(bTest?.hashValue)

let cTest = testInt.test3
print(cTest)
print(cTest.dynamicType)
print(cTest.rawValue)
print(cTest.hashValue)




let positionToFind = 102//101//100000
if let someInt = testInt(rawValue: positionToFind) {
    
    print(someInt)
    print(someInt.dynamicType)
    print(someInt.rawValue)
    print(someInt.hashValue)
    
    switch someInt {
        case .test1:
            print("test1")
        case .test2:
            print("test2")
        case .test3:
            print("test3")
        case .test4:
            print("test4")
    }
}
else {
    print("Fail \(positionToFind)")
}


//
// Recursive Enumerations
//

enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.Number(5)
print(five)
print(five.dynamicType)
//print(five.rawValue)
//print(five.hashValue)

let four = ArithmeticExpression.Number(4)
print(four)
print(four.dynamicType)
//print(four.rawValue)
//print(four.hashValue)

let sum = ArithmeticExpression.Addition(five, four)
print(sum)
print(sum.dynamicType)

let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(product)
print(product.dynamicType)
//print(product.rawValue)
//print(product.hashValue)


