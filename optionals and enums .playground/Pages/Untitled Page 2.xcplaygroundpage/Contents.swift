//: [Previous](@previous)

import Foundation

//enum,перечисления

enum Currencies{
    
    enum countriesUsingDollars{
        case usa, canada, panama, ecuador
    }
        enum countriesUsingEuro{
            case spain, france, czech_republic, germany
        }
    
    case ruble    (country: String, shortSymbol: String)
    case dollar    (country: String, shortSymbol: String, dollarCounties: countriesUsingDollars)
    case euro   (country: String, shortSymbol: String, euroCountries: countriesUsingEuro)
    case yuan    (country: String, shortSymbol: String)
    case dirham (country: String, shortSymbol: String)
    case rupees  (country: String, shortSymbol: String)
    case som (country: String, shortSymbol: String)
}

let dollarZone: Currencies
dollarZone = .dollar(country: "USA", shortSymbol: "USD", dollarCounties: .panama)

let euroZone: Currencies
euroZone = .euro(country: "Portugal", shortSymbol: "EURO", euroCountries: .france)
// выводим значения перечеслений через switch
switch dollarZone {
    case let .ruble(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .dollar(country: country, shortSymbol: shortSymbol, dollarCounties:dollarCounties):
        print("abbriviated currency name: \(country): \(shortSymbol).You choose country using dollar:\(dollarCounties)")
    case let .euro(country: country, shortSymbol: shortSymbol, euroCountries:euroCountries):
        print("abbriviated currency name: \(country): \(shortSymbol).You choose country using euro: \(euroCountries)")
    case let .yuan(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .dirham(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .rupees(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .som(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    }
switch euroZone {
    case let .ruble(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .dollar(country: country, shortSymbol: shortSymbol, dollarCounties:dollarCounties):
        print("abbriviated currency name: \(country): \(shortSymbol).You choose country using dollar:\(dollarCounties)")
    case let .euro(country: country, shortSymbol: shortSymbol, euroCountries:euroCountries):
        print("abbriviated currency name: \(country): \(shortSymbol).You choose country using euro: \(euroCountries)")
    case let .yuan(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .dirham(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .rupees(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    case let .som(country: country, shortSymbol: shortSymbol):
        print("abbriviated currency name: \(country): \(shortSymbol)")
    }


let countriesUsingDollars = Currencies.countriesUsingDollars.usa //вложенное перечисление потомка countriesUsingDollars от родителя Currencies


//связанные значения перечислений
enum myFamily:Int{
    case mother = 50
    case father = 51
    case sister = 27
    case brother = 26
    case me = 20
}
//счетчик членов перечисления
enum counting:Int {
    case one = 1
    case two
    case three
    case four
    case endcount = 999
}
let one = counting.one
let two = counting.two
let three = counting.three
let four = counting.four
let endcount = counting.endcount
// raw value пишет те цифры которые были заданы по умолчанию
print(one.rawValue)
print(two.rawValue)
print(three.rawValue)
print(four.rawValue)
print(endcount.rawValue)


enum Chessmen:String{
    enum Color:String{
        case black
        case white
    }
    case king = "King"
    case queen = "Queen"
    case bishop = "bishop"
    case knight = "Knight"
    case rook = "Rook"
    case pawn = "pawn"
}
func nameChessmen(figures: String...){
    for figure in figures{
        print(figure)
    }
}

let whiteKing = "\(Chessmen.Color.white.rawValue): \(Chessmen.king.rawValue)"
let whiteQueen = "\(Chessmen.Color.white.rawValue): \(Chessmen.queen.rawValue)"
let whiteBishop = "\(Chessmen.Color.white.rawValue): \(Chessmen.bishop.rawValue)"
let whiteKnight = "\(Chessmen.Color.white.rawValue): \(Chessmen.knight.rawValue)"
let whiteRook = "\(Chessmen.Color.white.rawValue): \(Chessmen.rook.rawValue)"
let whitePawn = "\(Chessmen.Color.white.rawValue): \(Chessmen.pawn.rawValue)"
let a = "♟ ------------- ♟"
let blackKing = "\(Chessmen.Color.black.rawValue): \(Chessmen.king.rawValue)"
let blackQueen = "\(Chessmen.Color.black.rawValue): \(Chessmen.queen.rawValue)"
let blackBishop = "\(Chessmen.Color.black.rawValue): \(Chessmen.bishop.rawValue)"
let blackKnight = "\(Chessmen.Color.black.rawValue): \(Chessmen.knight.rawValue)"
let blackRook = "\(Chessmen.Color.black.rawValue): \(Chessmen.rook.rawValue)"
let blackPawn = "\(Chessmen.Color.black.rawValue): \(Chessmen.pawn.rawValue)"

nameChessmen(figures: a,whiteKing,whiteQueen,whiteBishop,whiteKnight,whiteRook,whitePawn,a)
nameChessmen(figures: blackKing,blackQueen,blackBishop,blackKnight,blackRook,blackPawn,a)


indirect enum Arithmatic {
    case addition (Float, Float, Float)
    case substration (Float, Float, Float)
    case multiplication (Float, Float, Float)
    case division (Float, Float, Float)
    
    func compulation (arithmatic: Arithmatic) -> Float{
        switch arithmatic{
        case let.addition(numberOne, numberTwo, numberThree):
            return numberOne + (numberTwo - numberThree)
        case let.substration(numberOne, numberTwo, numberThree):
            return (numberOne - numberTwo) + numberThree
        case let.multiplication(numberOne, numberTwo, numberThree):
            return numberOne * (numberTwo / numberThree)
        case let.division(numberOne, numberTwo, numberThree):
            return (numberOne / numberTwo) * numberThree
        }
    }
}
let addition = Arithmatic.addition(25, 332, 40)
addition.compulation(arithmatic: addition)
let substraction = Arithmatic.substration(330, 230,50)
substraction.compulation(arithmatic: substraction)
let multiplication = Arithmatic.multiplication(30, 220,10)
multiplication.compulation(arithmatic: multiplication)
let division = Arithmatic.division(330, 16, 30)
division.compulation(arithmatic: division)





