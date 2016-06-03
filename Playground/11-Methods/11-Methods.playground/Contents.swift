//: Playground - noun: a place where people can play

import UIKit

var str = "11-Methods"

// Consider this alternative version of the Counter class, which defines a more complex form of the incrementBy(_:) method:

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

// This incrementBy(_:numberOfTimes:) method has two parameters—amount and numberOfTimes. By default, Swift treats amount as a local name only, but treats numberOfTimes as both a local and an external name. You call the method as follows:

let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)
// counter value is now 15

// You don’t need to define an external parameter name for the first argument value, because its purpose is clear from the function name incrementBy(_:numberOfTimes:). The second argument, however, is qualified by an external parameter name to make its purpose clear when the method is called.

// The behavior described above means that method definitions in Swift are written with the same grammatical style as Objective-C, and are called in a natural, expressive way.




// [Modifying External Parameter Name Behavior for Methods]
    
// Sometimes it’s useful to provide an external parameter name for a method’s first parameter, even though this is not the default behavior. To do so, you can add an explicit external name yourself.

// Conversely, if you do not want to provide an external name for the second or subsequent parameter of a method, override the default behavior by using an underscore character (_) as an explicit external parameter name for that parameter.


class ExternalParameter {
    
    func testFunc1(a: Int, b: Int) -> Int {
        return 1
    }
    
    func testFunc2(a: Int, externalB b: Int) -> Int {
        return 1
    }
}

let externalParameter = ExternalParameter()
externalParameter.testFunc2(5, externalB: 5)


struct Point {
    var x = 0.0, y = 0.0

    func moveByXY(deltaX: Double, y deltaY: Double) {
        print("test")
    }
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    mutating func moveByY(y deltaY: Double) {
        self = Point(x: x, y: y + deltaY)
    }
}

var point = Point(x: 4.0, y: 5.0)

point.moveByXY(3.0, y: 4.0)
print(point.x)
print(point.y)

point.moveByX(2.0, y: 2.0)
print(point.x)
print(point.y)

point.moveByY(y: 2.0)
print(point.x)
print(point.y)


class Player {
    static var value1: Int = 1
    static func changeValue(new: Int) {
        value1 = new
    }
    
    func dPrint() {
        print(Player.value1)
    }
}

print(Player.value1)
Player.changeValue(2)
print(Player.value1)

let player = Player()
player.dPrint()





