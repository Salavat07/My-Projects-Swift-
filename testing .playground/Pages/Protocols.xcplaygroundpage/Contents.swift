//: [Previous](@previous)

import Foundation

protocol SomeProtocol{
    var someProperty:String? { get }
}

class SomeClass: SomeProtocol {
    var someProperty: String?
}

protocol Dogg{
    var paws: Int{ get }
    var weight: Float { get set }
    var commands: [String] { set get }
}

class Doberman: Dogg {
  private (set) var paws: Int = 4
 
  var weight: Float = 25.4
 
  var commands: [String] = ["Stand up", "lie down", "vote", "nearby", "enemy", "give a paw"]
 
}
 
class Mastiff: Dogg {
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
 
var bigBoy: Dogg = Mastiff()
bigBoy.paws
bigBoy.weight
bigBoy.commands
 
bigBoy.paws
bigBoy.weight = 60
bigBoy.commands.append("vote")
 

// Veterinary app
protocol SquadCanids {
  var ears: Int { get }
  var eyes: Int { get }
  var tail: Int { get }
  var fangs: Bool { get }
}
protocol Bark {
  var dogBark: Bool {get}
}
protocol Commands {
  var dogCommands: [String] {get set}
}
// MARK: God class Dog
class Dog: SquadCanids {
  // MARK: Realized protocol
  private (set) var ears: Int = 2
  private (set) var eyes: Int = 2
  private (set) var tail: Int = 1
  private (set) var fangs: Bool = true
  // MARK: Initializer Dog
  init(dogNickname: String) {
    self.dogNickname = dogNickname
  }
  // MARK: Dog proprty
  var dogNickname: String
  var nickname: String {
    get {
       return dogNickname
    }
    set {
      dogNickname = newValue
    }
  }
}
// MARK: Come Dog class
class Bobtail: Dog, Bark, Commands {
  private (set) var dogBark: Bool = true
  var dogCommands: [String]
 
  init(dogNickname: String, commands: [String]) {
    dogCommands = commands
    super.init(dogNickname: dogNickname)
  }
}
// MARK: Come Dog
let bobtailJack = Bobtail(dogNickname: "Jack", commands: ["sit","lie down", "serve"])
 
print(
  """
  Пес по имени \(bobtailJack.dogNickname) умеет лаять: \(bobtailJack.dogBark),
  у него здоровые зубы: \(bobtailJack.fangs) ,
  имеет \(bobtailJack.tail) хвост,
  \(bobtailJack.eyes) глаза,
  \(bobtailJack.ears) уха,
  знает команды: \(bobtailJack.dogCommands).
  По заключению врача пес здоров!!
  """)


// Для перечеслений нужно использовать static
protocol SomProtocol{
    
   static var someProperty:Int {get} // static here
}

enum SomeEnum : SomProtocol {
    
  static var someProperty: Int = 5 //  also static here
}

protocol pratacol {
    mutating func someFunc(someText: String) -> String
}
struct clas : pratacol {
    mutating func someFunc(someText: String) -> String{
        let text = "Hi" + someText
        return text
    }
}

protocol Qwerty {
    init (Text: String, someEnum: SomeEnumm)
}

enum SomeEnumm {
    case text
    case number
}

class GodClass: Qwerty {
    
    let Text: String
    let someEnum: SomeEnumm
    
    required init(Text: String, someEnum: SomeEnumm) {
        self.Text = Text
        self.someEnum = someEnum
    }
}

class SubClass:GodClass{
    
    let SubText = "Text"
   
}

// protocol with initialises

protocol JohnWick {

    var johnName: String {get set}
    var johnAge: String {get set}
    
    init(name: String,age: String)
    
    func johnFunc()
}

extension JohnWick {
    func johnFunc(){
        print("Johns name \(johnName) and his age is \(johnAge)")

    }
}

class Johns: JohnWick{
    var johnName: String
    
    var johnAge: String
    
    required init(name: String, age: String) {
        johnName = name
        johnAge = age
    }
}
let j = Johns(name: "Johhn", age: "45")
j.johnFunc()

// EXTENSION and protocol
protocol PracticeExtencion {
    func extensionFunc (text: String) -> String
}
extension PracticeExtencion {
    func extensionFunc (text: String) -> String{
        let newText = text + " Surname"
        return newText
    }
}
struct structer: PracticeExtencion {}

let newStructer = structer()

print(newStructer.extensionFunc(text: "Name"))


// Делегирование/ Delegate

protocol MyDelegate {
  func changeText(text: String)
}
class General: MyDelegate {
  var generalText = "Hello World"
 
  func changeText(text: String) {
    generalText = text
  }
}
class Secondary {
  var delegate: MyDelegate!
}
let general = General()
print(general.generalText)
let secondary = Secondary()
secondary.delegate = general

secondary.delegate?.changeText(text: "Hello Delegate")

print(general.generalText)


// practice
protocol SomeMyDelegate {
    func printSomeText(sometText: String)
}

class SomeClassImplementsDelegate: SomeMyDelegate {
    func printSomeText(sometText: String) {
      print (sometText + "Class implements Delegate")
    }
}

class SomeClassUsingDelegate {
    
    var delegate: SomeMyDelegate!
    
    func simulateAction(text: String){
        delegate.printSomeText(sometText: text)
    }
}
let usingDelegate = SomeClassUsingDelegate()
let implementsDelegate = SomeClassImplementsDelegate()

usingDelegate.delegate = implementsDelegate

usingDelegate.simulateAction(text: "Im posting new Class and ")
