//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Unary Minus Operator

// The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator:

let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

// The unary minus operator (-) is prepended directly before the value it operates on, without any white space.



// Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. If all the elements are equal, then the tuples themselves are equal. For example:

(1, "zebra") < (2, "apple")   // true because 1 is less than 2
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

// Note

// The Swift standard library includes tuple comparison operators for tuples with less than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.




// Ternary(三重的) Conditional Operator

// The ternary conditional operator is a special operator with three parts, which takes the form question ? answer1 : answer2. It is a shortcut for evaluating one of two expressions based on whether question is true or false. If question is true, it evaluates answer1 and returns its value; otherwise, it evaluates answer2 and returns its value.

// The ternary conditional operator is shorthand for the code below:

//  if question {
//    answer1
//  } else {
//    answer2
//  }

// Here’s an example, which calculates the height for a table row. The row height should be 50 points taller than the content height if the row has a header, and 20 points taller if the row doesn’t have a header:

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90





// Nil Coalescing Operator

// The example below uses the nil coalescing operator to choose between a default color name and an optional user-defined color name:

let defaultColorName = "red"
var userDefinedColorName: String? = nil//"black"   // defaults to nil

var colorNameToUse0 = userDefinedColorName
print(colorNameToUse0)
print(colorNameToUse0.dynamicType)

var colorNameToUse1 = userDefinedColorName ?? defaultColorName
print(colorNameToUse1)             // wrapped userDefinedColorName
print(colorNameToUse1.dynamicType) // wrapped userDefinedColorName





// Closed Range Operator

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25


// Half-Open Range Operator

for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)")
}

// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
