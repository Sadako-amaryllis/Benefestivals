// MybenefestifView.swift

import SwiftUI

struct MybenefestifView: View {
    @Binding var users : [InformationUser]
    
    var body: some View {
        VStack {
            ForEach(users) { user in
                /*@START_MENU_TOKEN@*/Text(user.firstName)/*@END_MENU_TOKEN@*/
            }
        }
    }
}
