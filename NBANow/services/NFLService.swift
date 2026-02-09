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
    
    static func fetchTeamDetails(urlString: String, completion: @escaping (Result<Team, Error>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "BadURL", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(TeamDetail.self, from: data)
                completion(.success(decoded.team))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func fetchGameSummary(
        urlString: String,
        eventId: String,
        completion: @escaping (Result<GameSummaryData, APIError>) -> Void
    ) {
        guard let url = URL(string: "\(urlString)/summary?event=\(eventId)") else {
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
                let decoded = try JSONDecoder().decode(GameSummaryData.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }

        }.resume()
    }
}
