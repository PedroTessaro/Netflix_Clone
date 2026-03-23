//
//  Movie.swift
//  Netflix_Clone
//
//  Created by Pedro Augusto on 23/03/26.
//

import Foundation

nonisolated
struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let original_name:      String?
    let original_title:     String?
    let poster_path:        String?
    let overview:           String?
    let vote_count:         Int
    let release_date:       String?
    let vote_average:       Double
}
