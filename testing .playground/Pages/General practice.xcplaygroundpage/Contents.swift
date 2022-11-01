import UIKit
// getters and setters
struct Worker{
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay:Double
    
    var weeklySalary:Double{
        get{
            return monthlySalary / Double(weeksPerMonth) //ложим значение в get
        }
    }
    
    var hourlySalary: Double{
        get{
            return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
        }
        set (hrSalary){ // ложим значение в set
            monthlySalary = hrSalary * (hoursPerDay * 5) * Double(weeksPerMonth)
        }
    }
}
var worker = Worker(name:"Salavat",monthlySalary:50_000, weeksPerMonth:4,hoursPerDay:5)

worker.monthlySalary
worker.weeklySalary
worker.hourlySalary = 665 //можем менять часовую зарплату и setter будет уже сам менять значения, не нужно создавать новые значения и вызывать экземпляр класса

worker.monthlySalary
worker.weeklySalary
worker.hourlySalary

// for in stride
for i in stride(from: 1, to: 5, by: 0.5){
    print(i)
}
 print("-----------")
for i in stride(from: 2, through: 10, by: 0.5){
    print(i)
}
//tuples либо же кортежи
let money = (currency:"$", amount:100)
money.currency
money.amount

var kalievSalavatMoney = (money:230000, currency:"$")
kalievSalavatMoney.0
kalievSalavatMoney.1

//Arrays/Массивы
var cars:[String] = ["mers", "bmw", "porshe"]
cars[2]

var me:Array<String> = ["i","you"]
me[1]
//пустые массивы
var numbers = [Int]()
// или так
var numbers2: [Int] = []
// изменяем элемент массива
var fruits = ["apple", "banana", "orange"]
fruits[0] = "peach"
print(fruits) // ["peach", "banana", "orange"]
fruits[1...2] = ["apple", "apple"] //диапазон изменений в массиве
print(fruits)
fruits.append("pineapple") // добавляем новое значение
print(fruits)
fruits.insert("bluberry", at: 3) //добавляем значение в конктреный индекс массива
print(fruits)
fruits += ["cherry","pear"]
print(fruits)

fruits.removeLast() // удаляет последний элемент
fruits.removeFirst() // удаляет первый элемент
fruits.remove(at: 1) // удаляем элемент по определенному индексу
fruits
fruits.removeAll() // удаляет все элементы

print(fruits.dropLast()) // ["nectarine", "kiwi"]
print(fruits.dropFirst()) // ["kiwi", "pear"]
print(fruits) // ["nectarine", "kiwi", "pear"] ??????????
 
// удалит последние два элемента
fruits = fruits.dropLast(2) // ["nectarine"]
// удалит последний элемент
fruits = fruits.dropLast() // []
// функция remove удаляет значения изменяя массив
//функция drop удаляет значения не изменяя сам массив
 

var restoraunts = ["Grizza", "Токио сити", "Пряности и сладости", "Kitchenezz"]
restoraunts.count // итерация суммы значений в массиве

// For in в массивах
// 1
var nums: [Int] = [1, 2, 3, 4, 5, 6]

for number in nums {
   print(number) // 1, 2, 3, 4, 5, 6
}

// 2
var array = ["элемент1", "элемент2", "элемент3"]

for index in 0..<array.count {
   print(array[index]) // элемент1, элемент2, элемент3
}


// 3
nums.forEach( {print($0)} ) // 1, 2, 3, 4, 5, 6

// ForEach
var aray = ["элемент1", "элемент2", "элемент3"]
aray.forEach { (element) in
    print(element)
}
print("---------")
aray.forEach{
    print($0)
}

let shoppingList = ["milk", "bread", "water", "meat", "candy"]

for (index, value) in shoppingList.enumerated() {
    print("\(index + 1): \(value)")
}
print("---------")
print("Kaliev Salavat's supercars:")
let myCars = ["Porshe", "Lamborgini","Ferrari","Mercedes"]

for (index,value) in myCars.enumerated() {
    print("\(index + 1): \(value)")
}

// Многомерные массивы
let numberss = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
numberss[0]
numberss[1]
numberss[2]
numberss[0][0]
numberss[1][0]
numberss[2][0]

for element in numberss{
    print(element)
}
// используем for in для многомерного массива
for row in numberss{
    for cell in row{
        print(cell)
    }
}
//функция map
let values = [2.0, 4.0, 5.0, 7.0]
let squares = values.map( {$0 * $0} )
print(squares)

// функция filter
let names = ["Alex", "Karlson", "Jim", "Karl", "Kevin"]
let shortNames = names.filter { $0.count < 5 }
print(shortNames) // "["Alex", "Jim", "Karl"]
// фильтр на числа больше 18
let ages = [1, 2, 3, 4, 5, 6, 14, 17, 18, 21, 23]
let allowedAges = ages.filter( { $0 >= 18} )
print(allowedAges) // [18, 21, 23]
// фильтр на четные цифры
let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }
print(even)


// с помощью функции filter мы можем пройтись по базе данных с сервера и находить и добавлять значения

struct Product {
    let id: String
    let name: String
    let productDescription: String
    let category: String
    let price: Double
    let companyId: Int
}
 
// Массив элементов, которые мы получаем с сервера
let products = [
    Product(id: "4d1d295e-1932-4234-34cd-db32422ds", name: "Цезарь", productDescription: "300 гр", category: "Салаты", price: 320, companyId: 3456121),
    Product(id: "80dosp23-4263-992d-ddle-njpoi2mlw", name: "Борщ", productDescription: "400 гр", category: "Горячее", price: 200, companyId: 3456121),
    Product(id: "37289jso-los1-ds13-3321-dspqqwe23", name: "Устрицы", productDescription: "200 гр", category: "Деликатесы", price: 570, companyId: 3456121),
    Product(id: "skli3112-123a-as31-34cd-poin2koqs", name: "Коктейль", productDescription: "250 мл", category: "Напитки", price: 320, companyId: 3456121)
]
 
// Массив элементов, который ранее был сохранен в БД
var productsDatabase = [
    Product(id: "4d1d295e-1932-4234-34cd-db32422ds", name: "Цезарь", productDescription: "300 гр", category: "Салаты", price: 320, companyId: 3456121),
    Product(id: "80dosp23-4263-992d-ddle-njpoi2mlw", name: "Борщ", productDescription: "400 гр", category: "Горячее", price: 200, companyId: 3456121),
    Product(id: "skli3112-123a-as31-34cd-poin2koqs", name: "Коктейль", productDescription: "250 мл", category: "Напитки", price: 320, companyId: 3456121)
]
 
// Ищем элемент, который не добавлен в productsDatabase
for product in products {
    if let _ = productsDatabase.filter( { $0.id == product.id}).first {
    } else {
        print(product)
        productsDatabase.append(product)
    }
}
print(productsDatabase)


// метод reduce
let items = [2.0,4.0,5.0,7.0]
let total = items.reduce(10, +) // 28.0
10 + 2 + 4 + 5 + 7 // 28.0


let marks = [4, 5, 8, 2, 9, 7]
let totalPass = marks.filter{$0 >= 7}.reduce(0, +) // 24

let num = [20, 17, 35, 4, 12]
let evenSquares = num.filter{$0 % 2 == 0}.map{$0 * $0} // [400, 16, 144]

// префикс до тех пор выполняется пока не будет нарушено
var numberrs = [1, -3, 6, 1, -3, 4, 9, 13, 653, 11, 666, 0, -12, -3223]
var filteredNumbers = numberrs.prefix(while: {$0 < 6})
print(filteredNumbers) // [1, -3]

// drop
var numbeers = [1, -3, 6, 1, -3, 4, 9, 13, 653, 11, 666, 0, -12, -3223]
var fillteredNumbers = numbeers.drop(while: {$0 < 6})
print(fillteredNumbers) // [6, 1, -3, 4, 9, 13, 653, 11, 666, 0, -12, -3223]

//сортировка
var nummbers = [1, 3, 6, 1, 3, 4, 9, 13, 653, 11, 666, 0, -12, 3223]
nummbers.sort()
nummbers // [-12, 0, 1, 1, 3, 3, 4, 6, 9, 11, 13, 653, 666, 3223]
nummbers.sorted()


print(nummbers.sorted(by: {$0 > $1})) // [3223, 666, 653, 13, 11, 9, 6, 4, 3, 3, 1, 1, 0, -12]

// dictionary словари
var animals: [String: String] = ["кот": "Вася", "пёс": "Жора", "попугай": "Кеша"]
animals["кот"]
animals["пёс"]
animals["попугай"]
// сокращенный вариант
let animalss = ["кот": "Вася", "пёс": "Жора", "попугай": "Кеша"]

animals["кот"] = "леонид"
print(animals)
animals.updateValue("salavat", forKey: "попугай")
animals.removeValue(forKey: "кот")
print(animals)

//множества Set

var diggits: Set<Int> = [3,2,5,21,44,2,34,4,5,23,1,3,4]
diggits.capacity
diggits.count
diggits.insert(100)
diggits.contains(21)
diggits.isEmpty
diggits.remove(44)

//итерация по порядку через sorted()
for digit in diggits.sorted(){
    print(digit)
}

let setOne: Set<Int> = [1, 5, 8, 3, 4]
let setTwo: Set<Int> = [1, 3, 4, 5, 6, 7]
let setThree: Set<Int> = [10, 34, 32, 1, 88, 2, 0]
 
setOne.intersection(setTwo).sorted()  // [1, 3, 4, 5] //  используется для создания нового множества из общих значений двух входных множеств;
setThree.union(setTwo).sorted()   // [0, 1, 2, 3, 4, 5, 6, 7, 10, 32, 34, 88] используется для нового множества, состоящего из всех значений обоих множеств;
setOne.subtracting(setThree).sorted()  // [3, 4, 5, 8] для создания множества со значениями, которые не принадлежат указанному множеству из двух входных;
setOne.symmetricDifference(setTwo).sorted()  // [6, 7, 8]  для создания нового множества из значений, которые не повторяются в двух входных множествах.

let mondayLessons: Set<String> = ["Математика", "Физика", "Английский язык", "Физическая культура", "Геометрия"]
let tuesdayLessons: Set<String> = ["Математика", "Литература", "Русский язык", "Физическая культура", "Физика"]
let wednesdayLessons: Set<String> = ["ОБЖ", "Обществознание", "Химия", "Биология"]
 
mondayLessons.isSubset(of: tuesdayLessons) // false  используется для определения того, все ли значения множества содержатся в указанном множестве.
tuesdayLessons.isSuperset(of: wednesdayLessons) // false используется, чтобы определить содержит ли множество все значения указанного множества.
wednesdayLessons.isDisjoint(with: tuesdayLessons) // true используется для определения того, отсутствуют ли общие значения в двух множествах или нет.

//протоколы

protocol SomeProtocol{
    var someProperty:String? { get }
}

class SomeClass: SomeProtocol {
    var someProperty: String?
}

protocol Dog{
    var paws: Int{ get }
    var weight: Float { get set }
    var commands: [String] { set get }
}

class Doberman: Dog {
  private (set) var paws: Int = 4
 
  var weight: Float = 25.4
 
  var commands: [String] = ["Stand up", "lie down", "vote", "nearby", "enemy", "give a paw"]
 
}
 
class Mastiff: Dog {
  var paws: Int = 4
 
  var weight: Float = 27.5
 
  var commands: [String] = ["sit down", "lie down", "enemy", "give a paw"]
}
 
let tatarin = Doberman()
tatarin.paws
tatarin.weight
tatarin.commands
 
tatarin.paws
tatarin.weight = 44
tatarin.commands.append("sit down")
 
var bigBoy: Dog = Mastiff()
bigBoy.paws
bigBoy.weight
bigBoy.commands
 
bigBoy.paws
bigBoy.weight = 60
bigBoy.commands.append("vote")
 

// closures замыкания
func aFunc (par:Int) -> Int{
    return(par)
}
var c: (Int) -> Int
//2
func bFunc (parametr: Int){
}

var a: (Int) -> ()
var b: (Int) -> Void //возращаем пустоту
//3
var operation: (Double) ->Double

operation = sqrt // sqrt функция извлечения корня типа (Double) ->Double
operation(9)

let result = operation(12)
result

//4 меняем знак
func changeSign(operand:Double) -> Double{
    return -operand
}
var smtng: (Double) -> Double
smtng = changeSign

let resultt = smtng(3)
resultt

// closure example 1
var smtg: (Double) -> Double

smtg = {(operrand:Double)-> Double in return -operrand}

let res = smtg(15)
res
// closure making code less
var smt: (Double) -> Double

smt = {-$0}

let ress = smt(330)
ress

// closure and map
let counts = [2.0,4.0,20.5,30.0]

let negaticeCounts = counts.map({ -$0  })
print(negaticeCounts)

let countsString = counts.map{String($0)}
print(countsString)


// generics and closures

//var arr = [2,4,6,8]
//
//func myMap<T>(for aarray:[Int], _ transform: (Int) -> T) -> [T] {
//    var rezult: [T] = []
//    for ellemment in aarray {
//        rezult.append(transform(ellemment))
//    }
//    return rezult
//}
//
//let rez1 = myMap(to: arr) { $0 + 2 }
//let rez2 = myMap(to: arr) { $0 + $0 }
//let rez3 = myMap(to: arr) { String($0) }






