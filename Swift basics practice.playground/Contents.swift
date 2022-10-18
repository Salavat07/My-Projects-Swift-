import UIKit

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var firstForLoop = 0
for i in 0..<6 {
    firstForLoop += i
}
print(firstForLoop)


class NamedShape {
    var numberOfSides: Int = 5 //мы не инициализируем это свойство так как у нее есть значение
    var name: String // инициализируем это свойство так как у нее нет значения
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {  //переписываем функцию родительского класса
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class Circle: NamedShape{
    var radius: Double
    var perimeter = 25
    
    init(radius: Double, name:String, perimeter:Double){
        self.radius = radius
        super.init(name: name)
    }
    
    func radiusArea()-> Double{
        return Double(perimeter / 2)
    }
    override func simpleDescription() -> String {
        return "A circle has radius equals \(radius)"
    }
}
let check = Circle(radius: 12.5, name: "Circle radius", perimeter: 25)
check.radiusArea()
check.simpleDescription()

//getters and settters
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//willset Если вам не нужно вычислять свойство, но по прежнему нужно предоставить код, который будет запущен до и после установки нового значения
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    }
let ace = Rank.ace
let aceRawValue = ace.rawValue

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case season (String, String)
}
 
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let season = ServerResponse.season("Warm season", "Cold season")
 
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .season(winter, summer):
    print("It is \(winter), \(summer)")
}

// обработка ошибок
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

let cat = "?"; print(cat) // чтобы писать на одной строке

let a = UInt16.min
let b = UInt32.max

// обработка ошибок через try and catch
//func makeASandwich() throws {
//    // ...
//}
//
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

//Отладка утверждений
let age = -3
assert(age >= 0, "Возраст человека не может быть меньше нуля")
// это приведет к вызову утверждения, потому что age >= 0, а указанное значение < 0.


if age > 10 {
    print("Ты можешь покататься на американских горках и чертовом колесе.")
} else if age > 0 {
    print("Ты можешь покататься на чертовом колесе.")
} else {
    assertionFailure("Возраст человека не может быть отрицательным.") //отладка утверждения если код уже исполняется
}

//практика полузамкнутого диапазона
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
 print("Person \(i + 1) будет \(names[i])")
}
// Person 1 будет Anna
// Person 2 будет Alex
// Person 3 будет Brian
// Person 4 будет Jack



