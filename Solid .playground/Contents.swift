import UIKit

struct User {
  var name: String
  var identifier: String
}


class FirebaseDataBase {
  func add(_ user: User) {
    // Какая-то логика по добавлению пользователя.
    print("User Name: \(user.name) added to FirebaseDB.")
  }
 
  func edit(_ user: User) {
    // Какая-то логика по редактированию пользователя.
    print("User Name: \(user.name) edited in FirebaseDB")
  }
 
  func delete(_ user: User) {
    // Какая-то логика по удалению пользователя.
    print("User id: \(user.identifier) has been removed from FirebaseDB")
  }
}

protocol UserProtocol {
  var name: String { get }
  var identifier: String { get }
}

protocol DataBaseProtocol {
  func add(_ user: UserProtocol)
  func edit(_ user: UserProtocol)
  func delete(_ user: UserProtocol)
}


class MangoDataBase: DataBaseProtocol {
  func add(_ user: UserProtocol) {
    // Какая-то логика по добавлению пользователя.
    print("User Name: \(user.name) added to MabgoDB.")
  }
 
  func edit(_ user: UserProtocol) {
    // Какая-то логика по редактированию пользователя.
    print("User Name: \(user.name) edited in MabgoDB")
  }
 
  func delete(_ user: UserProtocol) {
    // Какая-то логика по удалению пользователя.
    print("User id: \(user.identifier) has been removed from MabgoDB")
  }
}
 
    // Для теста создадим экземпляр структуры пользователя с идентификатором
let jame = User(name: "Jame", identifier: "2212")
 
    // Создадим экземпляры баз данных
let firebaseDB = FirebaseDataBase()
let mangoDB = MangoDataBase()
 
    // Создадим экземпляр транзакции и передадим нужную BD для использования
let userFirebaseTransaction = UserTransaction(dataBase: firebaseDB)
let userMangoTransaction = UserTransaction(dataBase: mangoDB)
 
    // Проведем манипуляции с пользователем в разных BD
userFirebaseTransaction.add(user: jame)
userFirebaseTransaction.edit(user: jame)
userFirebaseTransaction.delete(user: jame)
 
    // А вот весь код целиком:
userMangoTransaction.add(user: jame)
userMangoTransaction.edit(user: jame)
userMangoTransaction.delete(user: jame)
// Протокол для модели пользователя.
protocol UserProtocol {
  var name: String { get }
  var identifier: String { get }
}
 
// Протокол для работе с BD.
protocol DataBaseProtocol {
  func add(_ user: UserProtocol)
  func edit(_ user: UserProtocol)
  func delete(_ user: UserProtocol)
}
 
// Модель пользовательских данных.
struct User: UserProtocol {
  var name: String
  var identifier: String
}
 
// Интерфейс по работе с пользовательскими данными в BD.
final class UserTransaction {
 
  // Внешняя зависимость абстрактного типа.
  private let dataBase: DataBaseProtocol
 
  // Инициализатор принимает абстракцию в качестве аргумента.
  init(dataBase: DataBaseProtocol) {
    self.dataBase = dataBase
  }
 
  // Методы, отвечающие за добавление/редактирование/ удаления пользователя из BD.
  func add(user: UserProtocol) {
    dataBase.add(user)
  }
 
  func edit(user: UserProtocol) {
    dataBase.edit(user)
  }
 
  func delete(user: UserProtocol){
    dataBase.delete(user)
  }
}
 
// Класс, отвечающий за работу базы данных Firebase
class FirebaseDataBase: DataBaseProtocol {
 
  func add(_ user: UserProtocol) {
    // Какая-то логика по добавлению пользователя.
 
    print("User Name: \(user.name) added to FirebaseDB.")
  }
 
  func edit(_ user: UserProtocol) {
    // Какая-то логика по редактированию пользователя.
    print("User Name: \(user.name) edited in FirebaseDB")
  }
 
  func delete(_ user: UserProtocol) {
    // Какая-то логика по удалению пользователя.
    print("User id: \(user.identifier) has been removed from FirebaseDB")
  }
}
 
// Класс, отвечающий за работу базы данных Mango.
class MangoDataBase: DataBaseProtocol {
 
  func add(_ user: UserProtocol) {
    // Какая-то логика по добавлению пользователя.
    print("User Name: \(user.name) added to MabgoDB.")
  }
 
  func edit(_ user: UserProtocol) {
    // Какая-то логика по редактированию пользователя.
    print("User Name: \(user.name) edited in MabgoDB")
  }
 
  func delete(_ user: UserProtocol) {
    // Какая-то логика по удалению пользователя.
    print("User id: \(user.identifier) has been removed from MabgoDB")
  }
}
 
// Создаем экземпляр структуры пользователя с идентификатором.
let jame = User(name: "Jame", identifier: "2212")
 
// Создаем экземпляры баз данных.
let firebaseDB = FirebaseDataBase()
let mangoDB = MangoDataBase()
 
// Создаем экземпляр транзакции и передаем нужную BD для использования.
let userFirebaseTransaction = UserTransaction(dataBase: firebaseDB)
let userMangoTransaction = UserTransaction(dataBase: mangoDB)
 
// Проводим манипуляции с пользователем в разных BD.
userFirebaseTransaction.add(user: jame)
userFirebaseTransaction.edit(user: jame)
userFirebaseTransaction.delete(user: jame)
 
userMangoTransaction.add(user: jame)
userMangoTransaction.edit(user: jame)
userMangoTransaction.delete(user: jame)
