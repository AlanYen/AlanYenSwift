//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let a:String = nil
let b:String? = nil

let intValue: Int = 0 // 合法
//let intValue2: Int = nil //不合法
let optionalIntValue: Int? = nil //合法，這是一個Int的Optional



class iPad: NSObject {
    
    init(版本: String, 使用者名字: String) {
        // ...
    }
}


// 產生一個 iPad 2
let 一台iPad21 = iPad(版本: "21",  使用者名字:"Grady Zhuo")

let 禮物包裏21:Optional<iPad> = Optional.Some(一台iPad21)
print(禮物包裏21)

let 沒有東西的包裏21:Optional<iPad> = Optional.None
print(沒有東西的包裏21)


// 語法糖
let 一台iPad22 = iPad(版本: "22",  使用者名字:"Grady Zhuo")

let 禮物包裏22 : iPad? = 一台iPad22
print(禮物包裏22)

let 沒有東西的包裏22: iPad? = nil
print(沒有東西的包裏22)




//怎麼拆箱？ 又該注意什麼呢？
//
//我們有 4 + 1 種方式，以下我們會一一說明：
//
//使用美工小刀 (!)
//交給朋友檢查 (if)
//交給第三方信託拆禮物 (if let)
//把自已變成具現化系 ( Assigned Value )
//交給第三方信託拆禮物，但 Scope 不同 (補充 5 ： guard let)

//繼續延續上面的例子
//定義一個 拆開包裏 的泛型 function
func 拆開包裏<包裏的內容物>(包裏:Optional<包裏的內容物>)->包裏的內容物 {
    switch 包裏 {
    case .None:
        fatalError("么受喔！裡面沒東西，是要氣死誰？")
    case let .Some(內容物):
        return 內容物
    }
}

let iPad31 = 拆開包裏(禮物包裏21) //拿到iPad
//let 沒東西31 = 拆開包裏(沒有東西的包裏21) //Crash，么受喔！裡面沒東西，是要氣死誰？


//如果是有東西的包裏
let iPad32 = 禮物包裏21! //美而短小的美工小刀
//如果是沒有東西的包裏
//let 沒東西32 = 沒有東西的包裏21! //crash


//如果是有東西的包裏
if 禮物包裏21 != nil {
    let 有iPad = 禮物包裏21!
    //拿iPad玩
}

//如果是沒有東西的包裏
if 沒有東西的包裏21 != nil {
    // 不會執行這裡
} else{
    // 這裡會執行
    print("是沒有東西的包裏")
}



//如果是有東西的包裏
if let iPad33 = 禮物包裏21 {
    //拿iPad玩
}

//如果是沒有東西的包裏
if let 沒有東西33 = 沒有東西的包裏21 {
    // 不會執行這裡
} else {
    // 這裡會執行
}

let 任何包裏34 = 禮物包裏21 ?? iPad(版本: "22",  使用者名字:"Grady Zhuo") // 這裡會拿到禮物包裏裡的禮物
let 任何包裏35 = 沒有東西的包裏21 ?? iPad(版本: "22",  使用者名字:"Grady Zhuo") // 這裡會拿到新iPad的實體






    //有一個JSON字串
var json: NSDictionary = [
    "address":["country":"Taiwan",
               "city":"Taichung",
               "name":"Grady Zhuo",
              ],
    
    "gift":["name":"iPad",
            "version":2
           ]
]

//假設這是一個 Person 的 JSON ，試試看透過上面的 Optional 所學與技巧來取得下面幾個資訊：

//address 裡的 city
//name
//gift 裡的 version

//let 一台iPad3:iPad? = nil
//let 禮物包裏222222:Optional<iPad> = Optional.Some(一台iPad3)!

var x:String = "Hello "
var y:String? = "y"
var z:String? = nil

var result = x+y!

if z != nil {
    var result = x+z!
}
else {
    var result = x
}

if let tmp = z {
    var result = x+z!
}
else {
    var result = x
}



class Person{
    var myHouse: House?
}

class House{
    var myRooms: Rooms?
}

class Rooms{
    var numberOfDoors = 1
}

var foo = Person()
var num = foo.myHouse?.myRooms?.numberOfDoors
var num1 = foo.myHouse?.myRooms?.numberOfDoors ?? 1


var name:String! = "2222"
print("Hello \(name)")
print("Hello \(name)")

