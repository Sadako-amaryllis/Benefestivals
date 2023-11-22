import Foundation

struct Festival: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var url = URL(string: "")
    var totalUsers: Int
}

var arrayfestivals: [Festival] = [
    Festival(name: "Lolapalooza", date: Date(), url: URL(string :"https://www.ticketmaster.fr/statics/artiste/1363_img.jpg"), totalUsers: 100),
    Festival(name: "Festival du Film", date: Date(), url: URL(string :"https://fr.web.img5.acsta.net/r_1280_720/img/23/96/2396d7fe46b479084191f98f33ef1751.jpg"), totalUsers: 10),
    Festival(name: "Rock en Seine", date: Date(), url: URL(string :"https://www.nova.fr/wp-content/uploads/sites/2/2023/08/Rock-en-Seine-2023.jpg"), totalUsers: 70)
]
