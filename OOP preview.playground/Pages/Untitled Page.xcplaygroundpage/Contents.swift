import UIKit
//Creating structure
struct ChessPlayer{
    
    var name: String
    var nickname: String
    var age: Int
    var victory: Int
    var defeat: Int
    
    
    func method (){print("Hi im a chess player!")}
}

var salavat = ChessPlayer(name: "Salavat", nickname: "Kyrgyz", age: 20, victory: 15, defeat: 3)

print(salavat.name)
print(salavat.nickname)
print(salavat.age)
print(salavat.victory)
print(salavat.defeat)

salavat.name = "Ruslan"
salavat.nickname = "Kazah"
salavat.age = 30
salavat.victory = 8
salavat.defeat = 10
salavat.method()
 
print(salavat.name)
//Creating class
class Person{
    
    var name: String
    var age: Int
    
    //we should always initialise objects
    init(name:String,age: Int){
    self.name = name
    self.age = age
}
    let somePerson = Person(name: "Salavat", age: 20)

}

class City{
    let country: String
    let name: String
    let population: Int
    
    init(country:String, name: String, population: Int){
    self.country = country
    self.name = name
        self.population = population
    }
}
let bishkek = City(country: "Kyrgyzstan", name:"Bishkek" , population: 6000000)
var osh = bishkek
print(osh.country)
print(bishkek.country)

//we can easily add function inside the class
func ThisIsFunction(){
    print("Im function")
}

class IOnlyHaveMethod{
    func thisIsMethod(){
        print("Im method")
        ThisIsFunction()
    }
}
IOnlyHaveMethod().thisIsMethod()

class MyCar {
    
    func startCar(gasoline: Int){
        if gasoline > 0{
            print("vrum vrum vrum vrum vrum",
                  "Excellently my car is still alive! I won't be late for work")
    }
        else{
            print("kr kr kr kr" ,
                  "Awful! my car is dead, i won't make it to work on time!")
        }
}
}
MyCar().startCar(gasoline: 0)


struct Menu{
    let category = "Горячее"
}
let menu = Menu()
    print("Раздел меню: \(menu.category)")

class Restaurant{
    
    let menu = Menu()
    let name = "Bublik"
}
let restik = Restaurant()
restik.menu.category //calling subproperty

class Mnogoetazhka {
    static let height = 30 //calling static property
    static func houseHeight(floorNumbers: Int) -> Int {
        return floorNumbers * height
    }
}
Mnogoetazhka.height
Mnogoetazhka.houseHeight(floorNumbers: 15)

class CashbackCalculator { // 1. Объявили класс
    var startValue = 0 // 2. Сделали рабочее поле
 
// 3. Объявляем методы для экземпляра (не static)
    func increaseWithConstant() { // функция увеличивает startValue на фикс. значение (1)
        startValue += 1
    }
    func increase(by value: Int) { // функция увеличивает startValue на фикс. значение (value)
        startValue += value
    }
    func zerofy() { // функция обнуляет startValue
        startValue = 0
    }
}
CashbackCalculator().increase(by: 30)


//Using subscript
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index // видите? Сабскрипт не будет работать без этого поля
    }
}
let firstNumber = 3
let secondNumber = 6
let threeTimesTable = TimesTable(multiplier: firstNumber) // а вот и наша зависимость на практике
print("\(firstNumber) умножить на \(secondNumber) будет \(threeTimesTable[6])")


struct TableCell {
    let height: Int
    subscript(countCell: Int) -> Int {
        return countCell * height
    }
}
    let tableCell = TableCell(height: 44)
    tableCell[900]

//Копируем типы значений
struct Something {
var data: Int = -1
}
var a = Something()
var b = a                        // a копируется в b
a.data = 42                    // Изменяется a, не b
print("\(a.data), \(b.data)") // Выводится "42, -1"

// Проверка тождественности
class Human {
    var firstName = "Bob"
    var surname = "Dylan"
}
 
let person = Human()
person.firstName = "Mark"
person.firstName // Mark
 
let person2 = person
person2.firstName // Mark
 
let person3 = CashbackCalculator()
 
person === person2 // true
person === person3 // false


class Transport { //we also can use "final" to disallow inheritance
    var name: String
    var maxSpeed: Int
 
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
 
    func printName() {
        print(self.name)
    }
 
    func makeSound() {
        print("Some sound")
    }
}
 
class Car: Transport {
    override func makeSound() {
        print("Vroom-Vroom")
    }
}








