import Foundation

struct NFLService {

    static func fetchTeams(
        urlString: String,
        completion: @escaping (Result<[Team], APIError>) -> Void
    ) {

        guard let url = URL(string: "\(urlString)/teams") else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(.urlSessionError(error)))
                return
            }

            guard let http = response as? HTTPURLResponse,
                  (200...299).contains(http.statusCode),
                  let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(Root.self, from: data)

                var teams: [Team] = []
                for sport in decoded.sports {
                    for league in sport.leagues {
                        for teamContainer in league.teams {
                            teams.append(teamContainer.team)
                        }
                    }
                }

                completion(.success(teams))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }

        }.resume()
    }
    
    static func fetchTeamDetails(
        urlString: String,id: String, completion: @escaping (Result<Team, APIError>) -> Void)
        {
        
        guard let url = URL(string: "\(urlString)/teams/\(id)") else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error{
                completion(.failure(.urlSessionError(error)))
                return
            }

            guard let http = response as? HTTPURLResponse,
                  (200...299).contains(http.statusCode),
                  let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            do{
                let decoded = try JSONDecoder().decode(Root.self, from: data)

                if let firstTeamContainer = decoded.sports.first?.leagues.first?.teams.first {
                       completion(.success(firstTeamContainer.team))
                   }else{
                       completion(.failure(.invalidResponse))
                   }
            }catch{
                completion(.failure(.decodingFailed(error)))
            }
        }.resume()
    }

}
