//
//  festivals.swift
//  Benefestif
//
//  Created by M'ZALI Mylene on 20/11/2023.
//

import Foundation
import SwiftUI

struct Festival: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var url = URL(string: "")
    var totalUsers: Int
}
class User: ObservableObject {
    @Published var informationsUser: [InformationUser]
    
    init(informationsUser: [InformationUser] = []) {
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

struct FestivalListView: View {
    
    let festivals: [Festival] = [
        Festival(name: "Lolapalooza", date: Date(), url: URL(string :"https://www.ticketmaster.fr/statics/artiste/1363_img.jpg"), totalUsers: 100),
        Festival(name: "Festival du Film", date: Date(), url: URL(string :"https://fr.web.img5.acsta.net/r_1280_720/img/23/96/2396d7fe46b479084191f98f33ef1751.jpg"), totalUsers: 10),
        Festival(name: "Rock en Seine", date: Date(), url: URL(string :"https://www.nova.fr/wp-content/uploads/sites/2/2023/08/Rock-en-Seine-2023.jpg"), totalUsers: 70)
    ]
    @StateObject var user = User()

    var body: some View {
        NavigationView {
            List(festivals) { festival in
                NavigationLink {
                    FestivalDetailView(festival: festival, user: user)
                } label: {
                    Text(festival.name)
                }
            }
            .navigationTitle("Liste des Festivals")
        }
    }
}

struct FestivalDetailView: View {
    var festival: Festival
    @ObservedObject var user: User
    @State var numberUser = 0
    @State var selectedFirstName = ""
    @State var selectedLastName = ""
    @State private var redirectToHome = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text(festival.name)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                    .font(.system(size: 24))
                ) {
                AsyncImage(url: festival.url) { image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .imageScale(.large)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 4)
                    )
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray)
                    }
                    Text("Date: \(formattedDate(festival.date))")
                }

                Section(header: Text("Participants")) {
                    Stepper("Nombre de participants : \(numberUser)", onIncrement: {
                        if numberUser < 4 {
                            numberUser += 1
                        }
                    }, onDecrement: {
                        if numberUser > 0 {
                            numberUser -= 1
                        }
                    })

                    let users: Int = festival.totalUsers - numberUser
                    Text("Nombres de places restantes : \(users)")
                }

                Section(header: Text("Informations personnelles")) {
                    TextField("Nom", text: $selectedLastName)
                    TextField("Prénom", text: $selectedFirstName)
                }
               
            }
            .foregroundColor(.gray)
            Button("S'inscrire") {
                var newfestivalItems = InformationUser(firstName: selectedFirstName, lastName: selectedLastName, numberUser: numberUser)
//                InformationUser.append(newfestivalItems)
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}


struct FestivalListView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalListView()
    }
}
