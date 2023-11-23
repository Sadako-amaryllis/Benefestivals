import SwiftUI

struct ContentView: View {
    @StateObject var participantItems = User(informationsUser: arrayUser)
    
    var body: some View {
    TabView {
        FestivalListView(user: participantItems)
            .tabItem{
                Label("Home", systemImage: "house.fill")
            }
        MybenefestifView(user: participantItems)
            .tabItem {
                Label("My benefestif", systemImage: "heart.circle")
            }
        SuggestionView()
            .tabItem {
                Label("Prochainement", systemImage: "music.mic.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
