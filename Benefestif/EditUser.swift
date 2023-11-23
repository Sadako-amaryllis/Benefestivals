//
//  EditUser.swift
//  Benefestif
//
//  Created by M'ZALI Mylene on 22/11/2023.
//

import Foundation

struct EditUserView: View {
    @State private var editedUser: InformationUser
    var onSave: (InformationUser) -> Void

    init(informationUser: InformationUser, onSave: @escaping (InformationUser) -> Void) {
        self._editedUser = State(initialValue: informationUser)
        self.onSave = onSave
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations personnelles")) {
                    TextField("Nom", text: $editedUser.lastName)
                    TextField("Prénom", text: $editedUser.firstName)
                }

                Section(header: Text("Nombre de participants")) {
                    Stepper("Nombre de participants : \(editedUser.numberUser)", value: $editedUser.numberUser, in: 0...4)
                }
            }
            .navigationBarTitle("Modifier l'inscription")
            .navigationBarItems(
                trailing: Button("Enregistrer") {
                    onSave(editedUser)
                }
            )
        }
    }
}
