import UIKit

// 1 task
    
var firstPerson = (name:"Salavat",age:20, nationality:"Kyrgyz")
var secondPerson = (name:"Marat",age:19, nationality:"Kazakh")
firstPerson.0
firstPerson.name
secondPerson.1
secondPerson.age

// 2 task

var Months = ["January","February","March","Aipril","May","June","July","August","September","October","November","December"]
var daysInMonth = [7,12,31,2,30,4,6,12,17,19,24,26]

for days in 0...11 {
    print("\(Months[days]) : \(daysInMonth[days])")
}

let tupleMonthes: [(String, Int)] = [("January", 31),("February", 28),("March",30),("Aipril", 31),("May",30),("June", 31),("July", 31),("August", 31),("September", 30), ("October", 31), ("November", 30),("December", 31)]

for day in 0...11{
    print("In month \(tupleMonthes[day].0) \(tupleMonthes[day].1) days")
}
for day in 0...11{
    print("There are \(tupleMonthes[day].1) in \(tupleMonthes[day].0)")
}
var whichdays = 1
var whichMonth = 12

var month = whichMonth - 2
var count = 0
for month in 0...month {
    count = count + tupleMonthes[month].1
}
print(count + whichdays)

// 3 task
var amountOfStudents: [String:Int] = ["Kaliev Salavat": 3, "Maratov Adilkhan": 4, "Mamytov Daniar": 2]
amountOfStudents.updateValue(2, forKey: "Mamytov Daniar")
print(amountOfStudents)

amountOfStudents ["Islam Makhachev"] = 4
amountOfStudents ["Conor Macregor"] = 3
amountOfStudents ["Jon Jones"] = 5
print(amountOfStudents)

amountOfStudents.removeValue(forKey:"Islam Makhachev")

for i in amountOfStudents.values{
    if i >= 3{
        print("You passed \(i)")
    }else{
        print("You didnt passed \(i)")
    }
}

amountOfStudents ["Islam Makhachev"] = 4
amountOfStudents ["Conor Macregor"] = 3
amountOfStudents ["Jon Jones"] = 5
print(amountOfStudents)

amountOfStudents.removeValue(forKey:"Islam Makhachev")

print(amountOfStudents.values)

func average()->(Float){
    var count = 0
    var countOfValues = 0
    for i in amountOfStudents.values{
        count += i
        countOfValues += 1
}
    return Float(count/countOfValues)
}
print(average())
