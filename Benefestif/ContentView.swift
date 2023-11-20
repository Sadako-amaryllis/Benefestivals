//
//  ContentView.swift
//  Benefestif
//
//  Created by M'ZALI Mylene on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            FestivalListView()
        }
        .navigationTitle("Accueil")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
