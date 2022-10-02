import UIKit

var greeting = "Hello, playground"


func sum (a: Int , b : Int) {
    let sum = ( a + b )
    print(sum)
}
sum(a : 23, b: 34)

var name = "Salavat"
var surname = "Kaliev"

// Changing name

func changeId (name: inout String, surname: inout String){
    name = "Adilkhan"
    surname = "Maratov"
}
changeId(name: &name, surname: &surname)
print("Мои новые данные:\(name) \(surname)")


//Machine that cooks a personal coffee below (Function)

func makePersonalCoffee(nameCoffee coffee: String, amountOfWater water: Float, personalName yourName: String)-> String{
    return "Wonderful coffee with amount \(water) and type of coffee \(coffee) made for respected \(yourName)"
}
let result = makePersonalCoffee (nameCoffee: "Cappucino", amountOfWater: 250, personalName: "Salavat")

print(result)

// calculates odd or even number

func isEven(number: Int) -> Bool {
    number % 2 == 0
}

func generateNumberString(number: Int, checkFunction: (Int) -> Bool) -> String {
  let isEven = checkFunction(number)
  return isEven ? "Чётное" : "Нечётное" // ternar operator ?
}
 
let string = generateNumberString(number: 20, checkFunction: isEven)
print(string)

// Global function
func bigBoss(messageFromEmployeeJohn: inout String, messageFromEmployeeKate: inout String) {
  func employeeJohn() {
    messageFromEmployeeJohn += "I got your message boss!"
  }
  func employeeKate() {
    messageFromEmployeeKate += "I got your message boss!"
  }
  employeeJohn()
  employeeKate()
}
var johnMessage = "employee John: "
var kateMessage = "employee Kate: "
 
bigBoss(messageFromEmployeeJohn: &johnMessage, messageFromEmployeeKate: &kateMessage)
print(johnMessage)
print(kateMessage)

func recursiveCounter(number: Int) {
  if number < 100 {
    recursiveCounter(number: number + 1)
    print(number + 1)
  }
}
recursiveCounter(number: 2)

// Функция объединяет две строки, а потом передаёт результат в замыкание из параметра
func handler(text: String, closure: (String) -> ()) {
  let concatenateStrings = text + "SkillFactory"
  closure(concatenateStrings)
}
// При вызове функции мы определяем замыкание, которое добавляет новую логику в обработку строк
handler(text: "Hello ") { (text) -> Void in
  print(text + " I like you!")
}

//
func cigaretteVendingMachine(personAge: Int, closure: (Int) -> Bool) {
 if closure(personAge) {
   print("Thank you for purchasing our products, do not forget that smoking is harmful to your health! Have a nice day.")
 } else {
   print("I apologize! But cigarettes are not sold to people under 18!")
 }
}

cigaretteVendingMachine(personAge: 18, closure: { $0 > 18 })

let accountingReport: (_ name: String, _ age: Int, _ position: String, _ salary: Float) -> (String) = {
  "Employee: \($0), \($1), works as a \($2) with a salary of $ \($3 * 3.14) a month."
}
 
print(accountingReport("Semen", 23, "IOS-developer", 1209.9))

func concatenateStrings(_ text: String) -> (String) -> (String) -> String {
  return { s1 in
    let concatenateString = text + s1
    return { concatenateString + $0 }
  }
}
 
concatenateStrings("Hi, ")(" now I am knowing ")(" currying")

func log1() {
    print("1")
}

func log2() {
    print("2")
}

func log3(_ first: () -> (), _ second: () -> ()) {
    second()
    first()
}

log3(log2, log1)

let calculator: (_ :Int, _ :Int) -> (Int) = {
    $0 + $1
}
let Uresult = calculator(5,20)
print(Uresult)

// practice

func rolexPrice(amount: Int)-> Bool{
    amount >= 50000 ? true : false
}

func myIncomes(price: Int, closure:(Int) ->Bool){
    if closure(price) {
        print("Yeah mate, you can afford it")
    }
    else {
        print("GO AND EARN SOME MONEY YOU MISARABLE AND BROKE GIRL")
    }
}
myIncomes(price: 34000, closure: {$0 >= 50000})
myIncomes(price: 400000, closure: {$0 >= 50000})

