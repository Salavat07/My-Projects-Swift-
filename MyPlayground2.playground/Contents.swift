import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
view.backgroundColor = .red

PlaygroundPage.current.liveView = view

let name = "Salavat"
let surname = "Kaliev"
let age = 20
let city = "Prague"
let gender = "Male"

//Interpolation of String
print(" \(name) \(surname) \(age) \(city) \(gender)")

var myAge: Int = 20
var height: Float = 168.5
let strengh: Double = 840.50
let sport: String = "Boxing"
var interest: Character = "$"
var married: Bool = false

var power: Int = myAge + Int(height) + Int(strengh)

let distance = 7 // вёрст
let oneVerst = 1066.8 // метры
Double(distance) * oneVerst / 1000 // верста -> км

let distanceSaint = 1754
let gas = 8.5
let costGas = 45
var finalCost = Double(distanceSaint) / 100 * gas * Double(costGas)

let a = 5
let b = 2
var s = a % b

let firstSixBits = 0b11111100
let lastSixBits = 0b00111111
let result = firstSixBits + lastSixBits
type(of: result )





