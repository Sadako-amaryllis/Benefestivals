import SwiftUI

struct FestivalResult : Decodable{
    let total_count: Int
    let results:  [FestivalFields]
}

struct FestivalFields: Decodable {
    let identifiant: String
    let nom_du_festival: String
    let discipline_dominante: String
}

struct SuggestionView: View {
    @State private var festivals: [FestivalFields] = []

    var body: some View {
        NavigationView {
            List(festivals, id:\.identifiant) { festival in
                VStack(alignment: .leading) {
                    Text("Festival: \(festival.nom_du_festival)")
                    Text("Domaine: \(festival.discipline_dominante)")
                }
            }
            .navigationTitle("Prochainement")
            .foregroundColor(.gray)
            .onAppear{
                fetchData()
            }
        }
    }

    func fetchData() {
        guard let url = URL(string: "https://data.culture.gouv.fr/api/explore/v2.1/catalog/datasets/festivals-global-festivals-_-pl/records?limit=20&lang=fr") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON data:\n\(jsonString)")
            }
            do {
                let decodedData = try JSONDecoder().decode(FestivalResult.self, from: data)
                DispatchQueue.main.async {
                    self.festivals = decodedData.results
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
