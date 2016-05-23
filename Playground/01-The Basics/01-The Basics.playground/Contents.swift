//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// =============================================================================

// Swift is a new programming language for iOS, OS X, watchOS, and tvOS app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C.

// Swift provides its own versions of all fundamental C and Objective-C types, including Int for integers, Double and Float for floating-point values, Bool for Boolean values, and String for textual data. Swift also provides powerful versions of the three primary collection types, Array, Set, and Dictionary, as described in "Collection Types".

// -----------------------------------------------------------------------------

// Basic
let aInt: Int = 1
let aFloat: Float = 1.0
let aDouble: Double = 1.0
let aBool: Bool = true //flase
let aString: String = "Hello"

// Collection types

// Array
let aEmptyArray: Array = [String]()
let aStringArray: Array = ["David", "John"]
let aIntArray: Array = [10000, 10001]

// Dictionary
let aEmptyDict0: Dictionary = [String: String]()
let aEmptyDict1 = Dictionary<String, String>()
let aStringDict: Dictionary = ["David": "age17",
                               "John": "age18"]

// =============================================================================


// =============================================================================

//Like C, Swift uses variables to store and refer to values by an identifying name. Swift also makes extensive use of variables whose values cannot be changed. These are known as constants, and are much more powerful than constants in C. Constants are used throughout Swift to make code safer and clearer in intent when you work with values that do not need to change.

// In addition to familiar types, Swift introduces advanced types not found in Objective-C, such as tuples. Tuples enable you to create and pass around groupings of values. You can use a tuple to return multiple values from a function as a single compound value.

// Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Not only are optionals safer and more expressive than nil pointers in Objective-C, they are at the heart of many of Swift’s most powerful features.

// -----------------------------------------------------------------------------

// constant
let constInt: Int = 1
// constInt = 2 // this is a compile-time error

// variable
var varInt: Int = 2
varInt = 3

// Tuple
let tuple1 = ("1", 1, ["3", "4"])
let http404Error = (404, "Not Found")
print("http404Error 0: \(http404Error.0)")
print("http404Error 1: \(http404Error.1)")

// Optional: “there is a value, and it equals x” or “there isn’t a value at all”
var aEmptyOptional0: String? = nil
var aEmptyOptional1: String?
print(aEmptyOptional0)
print(aEmptyOptional1)

var aStringOptional: String? = "There is a value!"

// =============================================================================

// =============================================================================

// Note

// If a stored value in your code is not going to change, always declare it as a constant with the let keyword. Use variables only for storing values that need to be able to change.


// =============================================================================


// =============================================================================

// Type Annotations(註解，註釋)

// You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store. Write a type annotation by placing a colon after the constant or variable name, followed by a space, followed by the name of the type to use.

// -----------------------------------------------------------------------------

var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double

// Note
// It is rare that you need to write type annotations in practice. If you provide an initial value for a constant or variable at the point that it is defined, Swift can almost always infer the type to be used for that constant or variable, as described in Type Safety and Type Inference. In the welcomeMessage example above, no initial value is provided, and so the type of the welcomeMessage variable is specified with a type annotation rather than being inferred from an initial value.

// =============================================================================


// =============================================================================

// Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments. You write nested comments by starting a multiline comment block and then starting a second multiline comment within the first block. The second block is then closed, followed by the first block:

/* this is the start of the first multiline comment
 /* this is the second, nested multiline comment */
 this is the end of the first multiline comment */

// Nested multiline comments enable you to comment out large blocks of code quickly and easily, even if the code already contains multiline comments.

// -----------------------------------------------------------------------------

/*
func aFunction() {

    /* initial value */
    var a = 0
    print(a)
    
    /* new value */
    a = 1
    print(a)
}
*/

// =============================================================================

// =============================================================================

// Integer Bounds
// You can access the minimum and maximum values of each integer type with its min and max properties:

var aMinInt8: Int8 = Int8.min;
var aMaxInt8: Int8 = Int8.max;
print(aMinInt8)
print(aMaxInt8)

// On a 32-bit platform, Int is the same size as Int32.
// On a 64-bit platform, Int is the same size as Int64.

var sizeOfInt: Int = 0

// Double represents a 64-bit floating-point number.
// Float represents a 32-bit floating-point number.


// =============================================================================


// =============================================================================

//
// Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.

// =============================================================================


// =============================================================================

// Numeric Literals

// A decimal number, with no prefix
// A binary number, with a 0b prefix
// An octal number, with a 0o prefix
// A hexadecimal number, with a 0x prefix

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

// =============================================================================

// Type Aliases (型態別名)

typealias MyInt8 = Int8

var typeAliasesInt: MyInt8 = 100
print(typeAliasesInt)

typeAliasesInt = MyInt8.min
print(typeAliasesInt)

typeAliasesInt = MyInt8.max
print(typeAliasesInt)

// =============================================================================

// =============================================================================

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."

// =============================================================================


// =============================================================================

// Tuple

let http404ErrorTuple = (404, "Not Found")
let (statusCode, statusMessage) = http404ErrorTuple
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"


let http404ErrorTupleWithName = (errCode: 404, errorMessage: "Not Found")
print("The status code is \(http404ErrorTupleWithName.errorMessage)")


// =============================================================================


let possibleNumber = "123"
//let possibleNumber = "bb"
let convertedNumber = Int(possibleNumber)
print(convertedNumber.dynamicType)
print(convertedNumber?.description)


// =============================================================================

// Note

// Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.

// =============================================================================


// =============================================================================

// Optional Binding

//if let constantName = someOptional {
//    statements
//}

// =============================================================================


// =============================================================================


if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}
// Prints "4 < 42"

if let firstString: String? = "David", secondString: String? = "Hello David" where (secondString!.rangeOfString(firstString!) != nil) {
    print("\(secondString!) contains \(firstString!)")
}
// Prints "Hello David contains David"


// =============================================================================


// =============================================================================


enum ShoppingCartError: ErrorType {
    case cartIsFull
    case emptyCart
}

func canThrowAnError() throws {
    print("throw an error")
    throw ShoppingCartError.cartIsFull
}

// Case - 1
do {
    try canThrowAnError()
} catch {
    print("an error was thrown")
}

// Case - 2
do {
    try canThrowAnError()
} catch ShoppingCartError.cartIsFull {
    print("cartIsFull")
} catch ShoppingCartError.emptyCart {
    print("emptyCart")
}

// =============================================================================


// =============================================================================


let age = -3
// assert(age >= 0, "A person's age cannot be less than zero")
// this causes the assertion to trigger, because age is not >= 0

// =============================================================================

