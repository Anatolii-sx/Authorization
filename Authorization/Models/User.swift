//
//  User.swift
//  Authorization
//
//  Created by Анатолий Миронов on 27.08.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        return User(
            login: "admin",
            password: "admin123",
            person: Person(
                name: "Anatolii",
                surname: "Mironov",
                email: "mir@bk.ru",
                phoneNumber: "+7(999)356-35-36"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
}
