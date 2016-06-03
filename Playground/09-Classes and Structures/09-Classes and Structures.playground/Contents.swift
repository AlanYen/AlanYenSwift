//: Playground - noun: a place where people can play

import UIKit

var str = "09-Classes and Structures"


// 英文:
// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82

// 中文:
// https://github.com/CocoaChina-editors/Welcome-to-Swift/blob/master/The%20Swift%20Programming%20Language/02Language%20Guide/09Classes%20and%20Structures.md

// Classes and structures are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.





//
// [Comparing Classes and Structures]
//

// Classes and structures in Swift have many things in common. Both can:
// Swift 中類和結構體有很多共同點。共同處在於：

// 1. Define properties to store values 
//    定義屬性用於儲存值

// 2. Define methods to provide functionality 
//    定義方法用於提供功能

// 3. Define subscripts to provide access to their values using subscript syntax 
//    定義下標用於通過下標語法訪問值

// 4. Define initializers to set up their initial state
//    定義初始化器用於生成初始化值

// 5. Be extended to expand their functionality beyond a default implementation
//    通過擴展以增加默認實現的功能

// 6. Conform to protocols to provide standard functionality of a certain kind
//    符合協議以對某類提供標準功能

// Classes have additional capabilities that structures do not:
// 與結構體相比，類還有如下的附加功能：

// 1. Inheritance enables one class to inherit the characteristics of another.
//    繼承允許一個類繼承另一個類的特徵

// 2. Type casting enables you to check and interpret the type of a class instance at runtime.
//    類型轉換允許在運行時檢查和解釋一個類實例的類型

// 3. Deinitializers enable an instance of a class to free up any resources it has assigned.
//    取消初始化器允許一個類實例釋放任何其所被分配的資源

// 4. Reference counting allows more than one reference to a class instance.
//    引用計數允許對一個類的多次引用




// [Definition Syntax]

class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

// Here’s an example of a structure definition and a class definition:

struct Resolution {
    
    // two stored properties called width and height
    
    var width = 0
    var height = 0
    //var test = 0
}

class VideoMode {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}




//
// [Class and Structure Instances]
//

// The syntax for creating instances is very similar for both structures and classes:

let someResolution = Resolution()
let someVideoMode = VideoMode()
print(someVideoMode.dynamicType)
print(someVideoMode.resolution.dynamicType)
print(someVideoMode.interlaced.dynamicType)
print(someVideoMode.frameRate.dynamicType)
print(someVideoMode.name.dynamicType)

//  Structures and classes both use "initializer syntax" for new instances. 
//  The simplest form of initializer syntax uses the type name of the class or structure followed by empty parentheses, such as Resolution() or VideoMode(). 
//  This creates a new instance of the class or structure, with any properties initialized to their default values. 
//  Class and structure initialization is described in more detail in Initialization.



// [Accessing Properties]

// You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (.), without any spaces:

print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"

// In this example, someResolution.width refers to the width property of someResolution, and returns its default initial value of 0.

// You can drill down into sub-properties, such as the width property in the resolution property of a VideoMode:

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"

// You can also use dot syntax to assign a new value to a variable property:

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"




// [Memberwise Initializers for Structure Types]

// All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name:

let vga = Resolution(width: 640, height: 480)
//let vga = Resolution(width: 640, height: 480, test: 9999)
print(vga.width)
print(vga.height)
//print(vga.test)

// Unlike structures, class instances do not receive a default memberwise initializer. Initializers are described in more detail in Initialization




// [Structures and Enumerations Are Value Types]

// A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

// You’ve actually been using value types extensively throughout the previous chapters. 
// In fact, all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.

// All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they are passed around in your code.

// Consider this example, which uses the Resolution structure from the previous example:

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

// This example declares a constant called hd and sets it to a Resolution instance initialized with the width and height of full HD video (1920 pixels wide by 1080 pixels high).

// It then declares a variable called cinema and sets it to the current value of hd. Because Resolution is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they are two completely different instances behind the scenes.

// Next, the width property of cinema is amended to be the width of the slightly-wider 2K standard used for digital cinema projection (2048 pixels wide and 1080 pixels high):

cinema.width = 2048

// Checking the width property of cinema shows that it has indeed changed to be 2048:

print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"

// However, the width property of the original hd instance still has the old value of 1920:

print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"

// When cinema was given the current value of hd, the values stored in hd were copied into the new cinema instance. The end result is two completely separate instances, which just happened to contain the same numeric values. Because they are separate instances, setting the width of cinema to 2048 doesn’t affect the width stored in hd.

// The same behavior applies to enumerations:

enum CompassPoint {
    case North, South, East, West
}

var currentDirection = CompassPoint.West

let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// Prints "The remembered direction is still .West"

// When rememberedDirection is assigned the value of currentDirection, it is actually set to a copy of that value. Changing the value of currentDirection thereafter does not affect the copy of the original value that was stored in rememberedDirection.



// [Classes Are Reference Types]

// Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.

// Here’s an example, using the VideoMode class defined above:

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. The video mode is assigned a copy of the HD resolution of 1920 by 1080 from before. It is set to be interlaced, and is given a name of "1080i". Finally, it is set to a frame rate of 25.0 frames per second.

// Next, tenEighty is assigned to a new constant, called alsoTenEighty, and the frame rate of alsoTenEighty is modified:

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

// Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. Effectively, they are just two different names for the same single instance.

// Checking the frameRate property of tenEighty shows that it correctly reports the new frame rate of 30.0 from the underlying VideoMode instance:

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

// Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves do not actually change. tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.




// [Identity Operators]

// Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. 
// (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)

// It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:

// Identical to (===)

// Not identical to (!==)

// Use these operators to check whether two constants or variables refer to the same single instance:
    
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."

// Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):

// “Identical to” means that two constants or variables of class type refer to exactly the same class instance.

// “Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.

// When you define your own custom classes and structures, it is your responsibility to decide what qualifies as two instances being “equal”. The process of defining your own implementations of the “equal to” and “not equal to” operators is described in Equivalence Operators.



// [Pointers]

// If you have experience with C, C++, or Objective-C, you may know that these languages use pointers to refer to addresses in memory. A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, 
// but is not a direct pointer to an address in memory, and does not require you to write an asterisk (*) to indicate that you are creating a reference. 
// Instead, these references are defined like any other constant or variable in Swift




// [Choosing Between Classes and Structures]

// You can use both classes and structures to define custom data types to use as the building blocks of your program’s code.

// However, structure instances are always passed by value, and class instances are always passed by reference. 
// This means that they are suited to different kinds of tasks. 
// As you consider the data constructs and functionality that you need for a project, decide whether each data construct should be defined as a class or as a structure.

// As a general guideline, consider creating a structure when one or more of these conditions apply:
// 按照通用的準則，當符合一條或多條以下條件時，請考慮構建結構體：

// The structure’s primary purpose is to encapsulate a few relatively simple data values.
// 結構體的主要目的是用來封裝少量相關簡單數據值。

// It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
// 有理由預計一個結構體實例在賦值或傳遞時，封裝的數據將會被拷貝而不是被引用。

// Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
// 任何在結構體中儲存的值類型屬性，也將會被拷貝，而不是被引用。

// The structure does not need to inherit properties or behavior from another existing type.
// 結構體不需要去繼承另一個已存在類型的屬性或者行為。

// Examples of good candidates for structures include:

// The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
// 幾何形狀的大小，封裝一個width屬性和height屬性，兩者均為Double類型。

// A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
// 一定範圍內的路徑，封裝一個start屬性和length屬性，兩者均為Int類型。

// A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.
// 三維坐標系內一點，封裝x，y和z屬性，三者均為Double類型。

// In all other cases, define a class, and create instances of that class to be managed and passed by reference. 
// In practice, this means that most custom data constructs should be classes, not structures.
// 在所有其它案例中，定義一個類，生成一個它的實例，並通過引用來管理和傳遞。實際中，這意味著絕大部分的自定義數據構造都應該是類，而非結構體。




// [Assignment and Copy Behavior for Strings, Arrays, and Dictionaries]

// In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. 
// This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.

// This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.

// Note:
// The description above refers to the “copying” of strings, arrays, and dictionaries. 
// The behavior you see in your code will always be as if a copy took place. 
// However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. 
// Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.
// 以下是對於數組，字典，字符串和其它值的拷貝的描述。 在你的代碼中，拷貝好像是確實是在有拷貝行為的地方產生過。然而，在Swift 的後台中，只有確有必要，實際(actual)拷貝才會被執行。Swift 管理所有的值拷貝以確保性能最優化的性能，所以你也沒有必要去避免賦值以保證最優性能。(實際賦值由系統管理優化)

