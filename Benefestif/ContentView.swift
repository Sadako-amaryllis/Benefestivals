//
//  ContentView.swift
//  Benefestif
//
//  Created by M'ZALI Mylene on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var participantItems = User(informationsUser: arrayUser)
    
    var body: some View {
    TabView {
        FestivalListView(user: participantItems)
            .tabItem{
                Label("Home", systemImage: "house.fill")
            }
        MybenefestifView(users: participantItems)
            .tabItem {
                Label("My benefestif", systemImage: "heart.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
