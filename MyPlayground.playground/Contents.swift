import UIKit

var greeting = "Hello, playground"

// Название лояльности с накоплением баллов за покупки
let namePointLoyality = "point"

// Название лояльности с накоплением баллов за приобретение кофе
let nameVisitLoyality = "visit"

// Название лояльности, которая есть у пользователя
let nameLoyality = "point"

// Количество приобретенного кофе
let countGradeValue = 0

// Баланс в рублях
let balance = 500

// Грэйд - в зависимости от уровня пользователя выдаётся определенная скидка в процентах
let grade = 5

if nameLoyality == nameVisitLoyality {
print("Кофе: \(countGradeValue)")
} else if nameLoyality == namePointLoyality {
print("Ваша скидка: \(grade) %")
print("Баланс: \(balance) руб")
}

// Switch

let age = 20

switch age{
case 0...5:
    print("Your age is around 0-5 ")
case 5...10:
    print("Your age is around 5-10")
case 10...15:
    print("Your age is around 10-15 ")
case 15...20:
    print("Your age is around 15-20 ")
default:
    print("Your age is around more than 20 ")
}
//for in
let word = "Swift"
 
for character in word {
    print("character = ", character)
}

//continue
let stringInput = "Следующую подсказку ждите завтра."
let charactersToRemove: [Character] = ["С", "ю", "а", "о", "с", " "]
var cipher = ""
 
for character in stringInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        cipher.append(character)
    }
}
print(cipher)

//fallthrough
let ageU = 18
 
switch ageU {
case 18:
    print(ageU) // выводится 18
    fallthrough
case 23:
    print(ageU) // выводится 18, работа всей инструкции завершается
case 22:
    print(ageU)
default:
    print(ageU)
}

// throw
enum AutoError: Error {
    case isLost // заблудился
    case lowBattery // низкая батарея
    case brokeAutoDrive // проблемы с управлением машины
}
 
var isLost: Bool = false
var lowBattery: Bool = false
var brokeAutoDrive: Bool = true
 
do {
    if isLost {
        throw AutoError.isLost
    }
 
    if lowBattery {
        throw AutoError.lowBattery
    }
 
    if brokeAutoDrive {
        throw AutoError.brokeAutoDrive
    }
} catch AutoError.isLost {
    print("Вы заблудились! Включаю GPS")
} catch AutoError.lowBattery {
    print("Батарея садится! Ближайшая станция подзарядки через 1 км 300 м")
} catch AutoError.brokeAutoDrive {
    print("Режим автопилота поврежден. Переходим в режим ручного управления!")
}
