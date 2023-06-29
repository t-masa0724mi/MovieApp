import Foundation

struct MovieRespose: Codable {
    let movies: [Movie]
    
    private enum Codingkeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum Codingkeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case Poster = "Poster"
    }
}
