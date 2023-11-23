import SwiftUI

struct MybenefestifView: View {
    @ObservedObject var user: User
    @State private var isPresentingEditView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(user.informationsUser.enumerated()), id: \.element.id) { index, informationUser in
                    NavigationLink(destination: EditInformationUserView(user: user, editedUser: informationUser, index: index)) {
                        VStack(alignment: .leading) {
                            Text("\(informationUser.festival)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text("\(informationUser.firstName) \(informationUser.lastName)")
                                .font(.subheadline)
                                .foregroundColor(.primary)

                            Text("Nombre de participants : \(informationUser.numberUser)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    user.informationsUser.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Inscriptions")
        }
    }
}

struct EditInformationUserView: View {
    @ObservedObject var user: User
    @StateObject var editedUser: InformationUser
    var index: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            TextField("Nom", text: $editedUser.lastName)
            TextField("Prénom", text: $editedUser.firstName)
            Stepper("Nombre de participants : \(editedUser.numberUser)", value: $editedUser.numberUser, in: 0...4)
        }
        .navigationBarTitle("Modifier l'inscription")
        .navigationBarItems(
            trailing: Button("Enregistrer") {
                user.informationsUser[index] = editedUser
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
}
