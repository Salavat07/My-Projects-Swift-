import UIKit

var greeting = "Hello, playground"

//UserDefaults.standard.value(forKey: String)
//UserDefaults.standard.bool(forKey: String)
//UserDefaults.standard.float(forKey: String)
//UserDefaults.standard.string(forKey: String)

let defaultValues = UserDefaults.standard
defaultValues.set(5.14, forKey: "Number")
let myValue = defaultValues.float(forKey: "Number")

let array = [30,40,50]
defaultValues.set(array, forKey: "MyAaray")
let myArray = defaultValues.array(forKey: "MyAaray")

let dict = ["SkillFactory": "SkillBox"]
defaultValues.set(dict, forKey: "education")
let dictEdu = defaultValues.dictionary(forKey: "education")

// You can with Date() obtain the current date and time!
defaultValues.set(Date(), forKey: "currentDate")
let currentDate = defaultValues.object(forKey: "currentDate")

defaultValues.set(true, forKey: "MusicOn?")
let volume = defaultValues.bool(forKey: "MusicOn?")

// Practice
defaultValues.set(8, forKey: "Digit")
defaultValues.set(false, forKey: "LightsOn")
defaultValues.set("Ios-Developer", forKey: "Junior")
defaultValues.set([7,8,12,5,23], forKey: "Digits")
defaultValues.set(8.3253645746587, forKey: "Float")

let Num = defaultValues.integer(forKey: "Digit")
let bool = defaultValues.bool(forKey: "LightsOn")
let dictionary = defaultValues.string(forKey: "Junior")
let nums = defaultValues.array(forKey: "Digits")
let floating = defaultValues.double(forKey: "Float")

