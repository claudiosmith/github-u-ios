
import Foundation

extension Endpoint {
    
    static var users: Self { Endpoint(path: "users") }
    
    static func user(with login: String) -> Self {
        Endpoint(path: "users/\(login)")
    }
    
    static func userRepo(with login: String) -> Self {
        Endpoint(path: "users/\(login)/repos")
    }
}

struct Endpoint {

    var path: String
    var queryItems: [URLQueryItem] = []

}

extension Endpoint {
    
    var url: URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/\(path)"

        guard let url = components.url else { return URL(fileURLWithPath: .empty) }

        return url
    }
}
