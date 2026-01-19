import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var teams = [Team]()
    
    func fetchIntent(){
        let apiurl = "https://site.api.espn.com/apis/site/v2/sports/football/nfl"
        NFLService.fetchTeams(urlString: apiurl){result in
            switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.messageError = error.localizedDescription
                    }
                case .success(let array):
                    DispatchQueue.main.async {
                        self.teams = array
                    }
            }
        }
    }
}
