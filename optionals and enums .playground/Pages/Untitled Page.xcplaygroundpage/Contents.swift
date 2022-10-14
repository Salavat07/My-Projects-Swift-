import UIKit

var greetings = """
hello world
hi city
wats up man
"""
print(greetings)

var greet = "hi man\nhi brother\nhi sister"
print(greet)

/*
\ — символ экранирования;
\n — перенос строки;
\t — табуляция;
\r — возвращение каретки;
‘’ — двойные кавычки;
\u{0-8} — произвольные скалярные величины Юникода.
*/

var me = "\tOOO\n \"big data\" \n some words \u{1F496}\u{1F496}\u{1F496}\u{1F496}\u{1F496} "
print(me)

var string = String()

if string.isEmpty {
    print("Empty string")
}

let iLoveWinter = "I love winter ⛄"

func printCountSymbols() {
    for w in 0...iLoveWinter.count{
            print("Count symbols:\(w)")
        let findChar = iLoveWinter[iLoveWinter.index(iLoveWinter.startIndex, offsetBy: 7)] // находим нужный нам символ по очереди
        print(findChar)
    }
}
printCountSymbols()


let someString = "Hello my friend, do you like cookies?"
 
let index = someString.firstIndex(of: ",") ?? someString.endIndex //убираем все значения после запятой
let firstPartOfSentence = someString[..<index] //создаем подстроку
let newSomeString = String(firstPartOfSentence)
 
print(newSomeString)

var firstString = "Hello spring!"
var secondString = "Hello Spring!"

// сравнение двух строк знаком ==
func compareStrings(){
    if firstString == secondString{
        print("We are identical")
    }
    else {
        print("We are not identical")
    }
}
compareStrings()

let mycharacter:Character = "$"
print(mycharacter)
print(type(of: mycharacter)) //type(of:) определяет тип данных

let sstring = "I love Summer!🇰🇬"
 
func getUTF8(){
  for code in sstring.utf8{ //расшифровка кода sstring в UTF-8
    print(code)
  }
}

getUTF8()

let sttring = "I love Summer!🇰🇬"
 
func getUTF32(){
  for ccode in sttring.unicodeScalars{
    print(ccode.value)
  }
}
 
getUTF32()




    

