import UIKit

// Создаём переменные для данных о пользователе
var name: String = ""
var surname: String?
var age: Int = 0
var agree: Bool = false
 
// Создаём функции, которые будут принимать данные о пользователе и сохранять в переменные
func enterName(text: String) {
    name = text
}
 
func enterSurname(text: String) {
    surname = text
}
 
func enterAge(number: Int) {
    age = number
}
 
func enterAgreement(value: Bool) {
    agree = value
}
 
// Валидируем введённые данные через отдельные функции
func validateName() -> Bool {
    name.isEmpty == false
}
 
func validateSurname() -> Bool {
    true
}
 
func validateAge() -> Bool {
    age > 0
}
 
func validateAgreement() -> Bool {
    agree
}
// Проверяем данные пользователя и возвращаем флаг Bool, который говорит об успешной регистрации
func registerUser() -> Bool {
    if !validateName() {
        print("Проверьте введенное имя")
        return false
    }
    if !validateSurname() {
        print("Проверьте введенную фамилию")
        return false
    }
    if !validateAge() {
        print("Возраст должен быть больше 0")
        return false
    }
    if !validateAgreement() {
        print("Вы должны согласиться с лицензионным соглашением")
        return false
    }
    return true
}
 
 
// Вводим данные пользователя и проверяем, что регистрация проходит успешно
enterName(text: "Ivan")
enterSurname(text: "Ivanov")
enterAge(number: 20)
enterAgreement(value: true)
if registerUser() {
    print("Вы успешно зарегистрированы!")
}
