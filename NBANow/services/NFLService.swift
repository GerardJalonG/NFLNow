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
        urlString: String,
        completion: @escaping (Result<Team, APIError>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
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
                let decoded = try JSONDecoder().decode(TeamDetail.self, from: data)
                completion(.success(decoded.team))
            } catch {
                print("DECODE ERROR:", error)
                completion(.failure(.decodingFailed(error)))
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
    
    static func fetchTeamRosterGroups(
        teamId: String,
        completion: @escaping (Result<Roster, APIError>) -> Void
    ) {
        let urlString = "https://site.api.espn.com/apis/site/v2/sports/football/nfl/teams/\(teamId)/roster"

        guard let url = URL(string: urlString) else {
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
                let decoded = try JSONDecoder().decode(Roster.self, from: data)
                completion(.success(decoded))
            } catch {
                print("DECODE ERROR (ROSTER):", error)
                completion(.failure(.decodingFailed(error)))
            }

        }.resume()
    }
    
    static func fetchGameScoreboard(
        completion: @escaping (Result<ScoreBoardResponse, APIError>) -> Void
    ){
        let urlString = "https://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard"

        guard let url = URL(string: urlString) else {
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
                let decoder = JSONDecoder()

                let iso = ISO8601DateFormatter()
                iso.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

                let isoNoFrac = ISO8601DateFormatter()
                isoNoFrac.formatOptions = [.withInternetDateTime]

                decoder.dateDecodingStrategy = .custom { d in
                    let c = try d.singleValueContainer()
                    let s = try c.decode(String.self)

                    if let dt = iso.date(from: s) { return dt }
                    if let dt = isoNoFrac.date(from: s) { return dt }

                    throw DecodingError.dataCorruptedError(
                        in: c,
                        debugDescription: "Invalid date: \(s)"
                    )
                }

                let decoded = try decoder.decode(ScoreBoardResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                print("DECODE ERROR (SCOREBOARD):", error)
                completion(.failure(.decodingFailed(error)))
            }

        }.resume()
    }

}
