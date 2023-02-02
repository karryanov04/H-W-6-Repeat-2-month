
import Foundation

//Создать структуру User c параметрами имя, фамилия, номер телефона. Создать enum из стран с кодами телефонов. Добавить параметр code в  структуру User. Создать класс DataBase с параметром массив юзеров и функций распечатки информации всех юзеров, функий распечатки только по определенной стране. В main cделать так, чтобы пользователь вводил все данные через ридлайн. Введенные данные должны записаться в массив в классе DataBase. Для телефона сделать 2 ридлайна, один для указывания страны по названию, другой для ввода номера. В общей информации номер телефона должен распечатываться в таком виде: “+996777777777”. Запрос для ввода данных сделать несколько раз циклом, чтобы можно было ввести разные данные.


enum PhoneCode: String {
    case Russia = "7"
    case USA = "1"
    case Germany = "49"
}

struct User {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var code: PhoneCode
}

class DataBase {
    var users = [User]()
    
    func addUser(user: User) {
        users.append(user)
    }
    
    func printAllUsers() {
        for user in users {
            print("\(user.firstName) \(user.lastName), \(user.code.rawValue)\(user.phoneNumber)")
        }
    }
    
    func printUsersByCode(code: PhoneCode) {
        for user in users where user.code == code {
            print("\(user.firstName) \(user.lastName), \(user.code.rawValue)\(user.phoneNumber)")
        }
    }
}

let database = DataBase()

while true {
    print("Enter user's first name:", terminator: " ")
    guard let firstName = readLine() else { break }
    
    print("Enter user's last name:", terminator: " ")
    guard let lastName = readLine() else { break }
    
    print("Enter user's phone code (Russia, USA, Germany):", terminator: " ")
    guard let codeString = readLine() else { break }
    
    guard let code = PhoneCode(rawValue: codeString) else {
        print("Invalid phone code.")
        continue
    }
    
    print("Enter user's phone number:", terminator: " ")
    guard let phoneNumber = readLine() else { break }
    
    let user = User(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, code: code)
    database.addUser(user: user)
}

database.printAllUsers()

