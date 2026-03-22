//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Pedro Augusto on 22/03/26.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getAPI() -> String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not found")
        }
        return apiKey
    }
}
