import UIKiz
git suicid
git commit -salvategey
dorogoi dnevnik git , sei4as ya ho4u skazat o tom, 4to ya pidr ya gei, tyajelo ob etom govorit, ewe tyajelee v etom priznatsya, v svyazi s etim pishu eto pismo
// Абстракция данных пользователя
protocol UserData {
  var userName: String { get }    //Имя пользователя
  var userCardId: String { get }   //Номер карты
  var userCardPin: Int { get }       //Пин-код
  var userPhone: String { get }       //Номер телефона
  var userCash: Float { get set }   //Наличные пользователя
  var userBankDeposit: Float { get set }   //Банковский депозит
  var userPhoneBalance: Float { get set }    //Баланс телефона
  var userCardBalance: Float { get set }    //Баланс карты
}
// Действия, которые пользователь может выбирать в банкомате (имитация кнопок)
enum UserActions {
 
}
 
// Виды операций, выбранных пользователем (подтверждение выбора)
enum DescriptionTypesAvailableOperations: String {
 
}
 
