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

enum APIError: Error {
    case failedToGetData
    case urlNotFound
    
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/movie") else {
            completion(.failure(.urlNotFound))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(ProcessInfo.processInfo.environment["API_KEY"] ?? "")", forHTTPHeaderField: "Authorization")
        
        Task.detached { @concurrent in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(.failedToGetData))
                }
            }
            task.resume()
        }
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/discover/tv") else {
            completion(.failure(.urlNotFound))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(ProcessInfo.processInfo.environment["API_KEY"] ?? "")", forHTTPHeaderField: "Authorization")
        
        Task.detached { @concurrent in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(.failedToGetData))
                }
            }
            task.resume()
        }
    }
}
