//: Playground - noun: a place where people can play

import UIKit

var str = "12-Subscripts"

class DailyMeal {
    
    enum MealTime {
        case Breakfast
        case Lunch
        case Dinner
    }
    
    var meals: [MealTime : String] = [:]
    
    subscript(requestedMeal : MealTime) -> String {
        get {
            if let thisMeal = meals[requestedMeal] {
                return thisMeal
            }
            else {
                return "Ramen"
            }
        }
        set(newMealName) {
            meals[requestedMeal] = newMealName
        }
    }
}

var monday = DailyMeal()

monday[.Lunch] = "Pizza"

print(monday[.Lunch])         //Output:  "Pizza"

print(monday[.Dinner])        //Output:  "Ramen"