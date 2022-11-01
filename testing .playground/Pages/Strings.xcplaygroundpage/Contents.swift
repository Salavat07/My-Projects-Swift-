//: [Previous](@previous)

import Foundation

// по индексу в string манипулируем со string
let someString = "café makes me happy"

let fisrtCharacter = someString.startIndex
let fourthCharacterIndex = someString.index(fisrtCharacter, offsetBy: 3)
let fourthCharacter = someString[fourthCharacterIndex]

// Substring

let somString = "café makes me happy"

if let space = somString.firstIndex(of: " ") {
    let spaceIndex = somString.index(space, offsetBy: 1)
    let secondSentence = somString [spaceIndex..<somString.endIndex]
    print(secondSentence)
}

// 2 example of substring

let greeting = "Hi there! Im using Binance! LOL"
let endGreeting = greeting.firstIndex(of: "!")!
let firstSentence = greeting[...endGreeting]
print(firstSentence)

// 3 example replacing strings

var names = ["Salavat","Anton","Ruslan","Sayan"]

if let i = names.firstIndex(of: "Anton"){
    names[i] = "BORZ"
}
print(names)

// 4 example
let samString = "café makes me happy and also it is cheap"

let word = samString.split(separator: " ")[3]

let someArray = samString.split(separator: " ")
