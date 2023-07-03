import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decofingError
}

class HTTPClient {
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail,NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decofingError))
            }
            
            completion(.success(movieDetail))
        }
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL ))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieRespose.self, from: data) else {
                return completion(.failure(.decofingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
