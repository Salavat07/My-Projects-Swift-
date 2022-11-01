//: [Previous](@previous)

import Foundation

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
