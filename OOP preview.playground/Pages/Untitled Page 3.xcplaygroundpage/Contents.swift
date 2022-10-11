//: [Previous](@previous)

import Foundation

struct Student{
    
    var name: String
    var surname: String
    var university: String
    var faculty: String
    var averagePoint: Double
}
let student1 = Student(name: "Salavat", surname:"Kaliev", university: "CZU", faculty: "Informatics", averagePoint: 1.0)
let student2 = Student(name: "Argen", surname:"Nurmamatov", university: "CZU", faculty: "Informatics", averagePoint: 2.5)
let student3 = Student(name: "Sanat", surname:"Osmonov", university: "CZU", faculty: "Bisness", averagePoint: 3.0)
let student4 = Student(name: "Serdar", surname:"Sherimkulov", university: "CZU", faculty: "Informatika", averagePoint: 2.0)
print("We have 4 students they are: \(student1), \(student2), \(student3), \(student4)")



class Sportsman{
    var name: String
    var flexibility: String
    var endurance: Int
    
    init(name:String, flexibility:String, endurance: Int){
        self.name = name
        self.flexibility = flexibility
        self.endurance = endurance
    }
    func playFootbal(){
        print("GOOOOOLLL, I LOVE FOOTBAL!")
    }
    
}
class Dancer: Sportsman{
    
    var styleOfDancing: String
    var cloth: String
    
    init(flexibility: String, styleOfDancing: String, cloth: String){
        self.styleOfDancing = styleOfDancing
        self.cloth = cloth
        super.init(name: "Dancer", flexibility: flexibility, endurance: 40)
        
        func playFootbal(){
            print("MOVE YOUR BODY, YEAH YEAH")
        }
    }
}

