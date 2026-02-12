import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var teams = [Team]()
    
    func fetchAllTeams(){
        NFLService.fetchTeams(){result in
            switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.messageError = error.localizedDescription
                    }
                case .success(let teams):
                    DispatchQueue.main.async {
                        self.teams = teams
                    }
            }
        }
    }
    
}
