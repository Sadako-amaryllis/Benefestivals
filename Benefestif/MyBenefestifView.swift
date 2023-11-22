import SwiftUI

struct MybenefestifView: View {
    @ObservedObject var users: User

    var body: some View {
        NavigationView {
            List {
                ForEach(users.informationsUser, id: \.id) { informationUser in
                    VStack(alignment: .leading) {
                        Text("\(informationUser.firstName) \(informationUser.lastName)")
                            .font(.headline)
                            .foregroundColor(.primary)

                        Text("Nombre de participants : \(informationUser.numberUser)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete { indexSet in
                    users.informationsUser.remove(atOffsets: indexSet)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Inscriptions")
        }
    }
}
