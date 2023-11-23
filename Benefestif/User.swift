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
    var festival: String
    init(firstName: String, lastName: String, numberUser: Int, festival: String) {
        self.firstName = firstName
        self.numberUser = numberUser
        self.lastName = lastName
        self.festival = festival
    }
}

var arrayUser: [InformationUser] = [
    InformationUser(firstName: "John", lastName: "Doe", numberUser: 3, festival: "Lollapalooza"),
        InformationUser(firstName: "Jane", lastName: "Doe", numberUser: 2, festival: "Lollapalooza"),
        InformationUser(firstName: "Alice", lastName: "Smith", numberUser: 1, festival: "Rock en Seine"),
        InformationUser(firstName: "Bob", lastName: "Johnson", numberUser: 4,festival: "Fête du cinéma"),
]
