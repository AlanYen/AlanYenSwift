//: Playground - noun: a place where people can play

import UIKit

var str = "10-Properties"

// 英文:
// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID254

// 中文:
// https://github.com/CocoaChina-editors/Welcome-to-Swift/blob/master/The%20Swift%20Programming%20Language/02Language%20Guide/10Properties.md

// [Properties]

// Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.
// 屬性將值跟特定的類、結構或枚舉關聯。存儲屬性存儲常量或變量作為實例的一部分，計算屬性計算（而不是存儲）一個值。計算屬性可以用於類、結構體和枚舉裡，存儲屬性只能用於類和結構體。

//
// Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.
// 存儲屬性和計算屬性通常用於特定類型的實例，但是，屬性也可以直接用於類型本身，這種屬性稱為類型屬性。

//
// In addition, you can define property observers to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.
// 另外，還可以定義屬性監視器來監控屬性值的變化，以此來觸發一個自定義的操作。屬性監視器可以添加到自己寫的存儲屬性上，也可以添加到從父類繼承的屬性上。



// [Stored Properties]

// In its simplest form, a stored property is a constant or variable that is stored as part of an instance of a particular class or structure. Stored properties can be either variable stored properties (introduced by the var keyword) or constant stored properties (introduced by the let keyword).

// You can provide a default value for a stored property as part of its definition, as described in Default Property Values. You can also set and modify the initial value for a stored property during initialization. This is true even for constant stored properties, as described in Assigning Constant Properties During Initialization.

// The example below defines a structure called FixedLengthRange, which describes a range of integers whose range length cannot be changed once it is created:

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

// Instances of FixedLengthRange have a variable stored property called firstValue and a constant stored property called length. In the example above, length is initialized when the new range is created and cannot be changed thereafter, because it is a constant property.




// [Stored Properties of Constant Structure Instances]

// If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties:

var rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

// Because rangeOfFourItems is declared as a constant (with the let keyword), it is not possible to change its firstValue property, even though firstValue is a variable property.

// This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

// The same is not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
// 屬於引用類型的類（class）則不一樣，把一個引用類型的實例賦給一個常量後，仍然可以修改實例的變量屬性。

// DBG-1

struct Test {
    var test1: Int
    let test2: Int
}

var testA = Test(test1: 1, test2: 2)
print(testA)
print(testA.dynamicType)
print(testA.test1)
print(testA.test2)

testA.test1 = 10
//testA.test2 = 20


let testB = Test(test1: 3, test2: 4)
print(testB)
print(testB.dynamicType)
print(testB.test1)
print(testB.test2)

//testB.test1 = 5
//testB.test2 = 6
//print(testB.test1)
//print(testB.test2)


// DBG-2

class TestClass {
    var test1: Int = 0
    let test2: Int = 0
}

var testC = TestClass()
print(testC)
print(testC.dynamicType)
print(testC.test1)
print(testC.test2)

testC.test1 = 10
//testC.test2 = 20


let testD = TestClass()
print(testD)
print(testD.dynamicType)
print(testD.test1)
print(testD.test2)

testD.test1 = 5
//testD.test2 = 6
print(testD.test1)
print(testD.test2)























// [Property Observers]

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps




// [Type Property Syntax]

// In C and Objective-C, you define static constants and variables associated with a type as global static variables. In Swift, however, type properties are written as part of the type’s definition, within the type’s outer curly braces, and each type property is explicitly scoped to the type it supports.

// You define type properties with the static keyword. For computed type properties for class types, you can use the class keyword instead to allow subclasses to override the superclass’s implementation. The example below shows the syntax for stored and computed type properties:

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

class SomeReadWriteClass {
    
    var var1: Int = 100
    var var2: Int = 200
    var computeProperty: Int {
        get {
            return (var1 + var2)
        }

        set(newValue) {
           //self.computeProperty = newValue // In Swift, this is done automatically.
           var1 = newValue * 2
        }
    }
}

var someReadWriteClass = SomeReadWriteClass()

print(someReadWriteClass.var1)
print(someReadWriteClass.var2)
print(someReadWriteClass.computeProperty)

someReadWriteClass.computeProperty = 1

print(someReadWriteClass.var1)
print(someReadWriteClass.var2)
print(someReadWriteClass.computeProperty)

// Note

// The computed type property examples above are for read-only computed type properties, but you can also define read-write computed type properties with the same syntax as for computed instance properties.




// [Shorthand Setter Declaration]

// If a computed property’s setter does not define a name for the new value to be set, a default name of newValue is used. Here’s an alternative version of the Rect structure, which takes advantage of this shorthand notation:

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}




// [Read-Only Computed Properties]

// A computed property with a getter but no setter is known as a read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.

// Note

// You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed. The let keyword is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance initialization.

// You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")




// [Property Observers]

// Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

// You can add property observers to any stored properties you define, except for lazy stored properties. You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass. You don’t need to define property observers for nonoverridden computed properties, because you can observe and respond to changes to their value in the computed property’s setter. Property overriding is described in Overriding.

// You have the option to define either or both of these observers on a property:

// willSet is called just before the value is stored.

// didSet is called immediately after the new value is stored.

// If you implement a willSet observer, it’s passed the new property value as a constant parameter. You can specify a name for this parameter as part of your willSet implementation. If you don’t write the parameter name and parentheses within your implementation, the parameter is made available with a default parameter name of newValue.

// Similarly, if you implement a didSet observer, it’s passed a constant parameter containing the old property value. You can name the parameter or use the default parameter name of oldValue. If you assign a value to a property within its own didSet observer, the new value that you assign replaces the one that was just set.

// Note

// The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.

// For more information about initializer delegation, see Initializer Delegation for Value Types and Initializer Delegation for Class Types.

// Here’s an example of willSet and didSet in action. The example below defines a new class called StepCounter, which tracks the total number of steps that a person takes while walking. This class might be used with input data from a pedometer or other step counter to keep track of a person’s exercise during their daily routine.

class StepCounter1 {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter1 = StepCounter1()
stepCounter1.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter1.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter1.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

// The StepCounter class declares a totalSteps property of type Int. This is a stored property with willSet and didSet observers.

// The willSet and didSet observers for totalSteps are called whenever the property is assigned a new value. This is true even if the new value is the same as the current value.

// This example’s willSet observer uses a custom parameter name of newTotalSteps for the upcoming new value. In this example, it simply prints out the value that is about to be set.

// The didSet observer is called after the value of totalSteps is updated. It compares the new value of totalSteps against the old value. If the total number of steps has increased, a message is printed to indicate how many new steps have been taken. The didSet observer does not provide a custom parameter name for the old value, and the default name of oldValue is used instead.

// Note

// If you pass a property that has observers to a function as an in-out parameter, the willSet and didSet observers are always called. This is because of the copy-in copy-out memory model for in-out parameters: The value is always written back to the property at the end of the function. For a detailed discussion of the behavior of in-out parameters, see In-Out Parameters.

















// [Querying and Setting Type Properties]

class Foo {
    class func Bar() -> String {
        return "Bar"
    }
    
    static func Bar1() -> String {
        return "Bar1"
    }
}


Foo.Bar()
Foo.Bar1()


// http://stackoverflow.com/questions/24008011/how-do-i-declare-a-class-level-function-in-swift

// You indicate type methods by writing the static keyword before the method’s func keyword. Classes may also use the class keyword to allow subclasses to override the superclass’s implementation of that method.

// In a struct, you must use static to define a Type method. For classes, you can use either static or class keyword, depending on if you want to allow your method to be overridden by a subclass or not.

class ChildFoo: Foo {
    override class func Bar() -> String {
        return "ChildFoo Bar"
    }
    
//    override static func Bar1() -> String {
//        return "ChildFoo Bar1"
//    }
}

ChildFoo.Bar()



