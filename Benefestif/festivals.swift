import Foundation
import SwiftUI

struct FestivalListView: View {
    @ObservedObject var user: User

    var body: some View {
        NavigationView {
            List(arrayfestivals) { festival in
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
    @StateObject var newUser =  InformationUser(firstName: "", lastName: "", numberUser: 0)
    @State var isShowingRegistrationList = false
    
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
                            .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                    }
                    Text("Date: \(formattedDate(festival.date))")
                }

                Section(header: Text("Participants")) {
                    Stepper("Nombre de participants : \(newUser.numberUser)", onIncrement: {
                        if newUser.numberUser < 4 {
                            newUser.numberUser += 1
                        }
                    }, onDecrement: {
                        if newUser.numberUser > 0 {
                            newUser.numberUser -= 1
                        }
                    })

                    let users: Int = festival.totalUsers - newUser.numberUser
                    Text("Nombres de places restantes : \(users)")
                }

                Section(header: Text("Informations personnelles")) {
                    TextField("Nom", text: $newUser.lastName)
                    TextField("Prénom", text: $newUser.firstName)
                }
               
            }
            .foregroundColor(.gray)
           
            Button("S'inscrire") {
                user.informationsUser.append(newUser)
            }
            .sheet(isPresented: $isShowingRegistrationList) {
                MybenefestifView(users: user)
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}
