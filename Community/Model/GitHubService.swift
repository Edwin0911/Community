//
//  GitHubService.swift
//  GitHubRepoViewer
//
//  Created by 龔照博 on 2021/5/24.
//

import Foundation

struct Repo: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
}

struct SearchResponse: Decodable {
    let items: [Repo]
}

class GitHubService {
    // http 抓資料的類別
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init() ) {
        self.session = session
        self.decoder = decoder
    }
    
    //Result<T, Error>
    func search(matching query: String, handler: @escaping (Result<[Repo], Error>) -> Void) {
        let url = "http://api.github.com/search/repositories"
        
        guard var urlComponets = URLComponents(string: url)
        else { preconditionFailure("Can't create url componets...") }
        
        //在網址後面補上 ？q=...
        //urlComponets -> "http://api.github.com/search/repositories?q=..."
        urlComponets.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        guard let url = urlComponets.url
        else { preconditionFailure("Can't create url componets...") }
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            }
            else {
                do {
                    let data = data ?? Data()
                    let response = try self.decoder.decode(SearchResponse.self, from: data)
                    handler(.success((response.items)))
                }
                catch {
                    handler(.failure(error))
                }
            }
        }.resume()
    }
    
}
