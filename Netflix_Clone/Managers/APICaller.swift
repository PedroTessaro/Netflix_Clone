//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Pedro Augusto on 22/03/26.
//

import Foundation

struct Constants {
    static let baseURL  = "https://api.themoviedb.org/"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(ProcessInfo.processInfo.environment["API_KEY"] ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
