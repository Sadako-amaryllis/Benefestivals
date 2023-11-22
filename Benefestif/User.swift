//
//  User.swift
//  Benefestif
//
//  Created by M'ZALI Mylene on 22/11/2023.
//

import Foundation

class User: ObservableObject {
    @Published var informationsUser: [InformationUser]

    init(informationsUser: [InformationUser] ) {
        self.informationsUser = informationsUser
    }
}

class InformationUser: Identifiable, ObservableObject {
    var id = UUID()
    @Published var firstName : String
    @Published var lastName : String
    @Published var numberUser : Int
    init(firstName: String, lastName: String, numberUser: Int) {
        self.firstName = firstName
        self.numberUser = numberUser
        self.lastName = lastName
    }
}

var arrayUser: [InformationUser] = [
        InformationUser(firstName: "John", lastName: "Doe", numberUser: 3),
        InformationUser(firstName: "Jane", lastName: "Doe", numberUser: 2),
        InformationUser(firstName: "Alice", lastName: "Smith", numberUser: 1),
        InformationUser(firstName: "Bob", lastName: "Johnson", numberUser: 4),
]
