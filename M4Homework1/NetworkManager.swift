//
//  NetworkManager.swift
//  M4Homework1
//
//  Created by Oleg Konstantinov on 07.02.2026.
//

import Foundation


class NetworkManager {
    var apiKey = ""
    
    func getNews(title: String, pageSize: Int = 5, completion: @escaping (News)->Void) {
        guard let url = URL(string: "https://gnews.io/api/v4/top-headlines?category=\(title)&apikey=\(apiKey)&lang=ru&country=ru") else { return }
        
        let request = URLRequest(url: url)

        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                return print(error!.localizedDescription)
            }
            if let data {
                guard let result = try? JSONDecoder().decode(News.self, from: data) else { return }
                completion(result)
            }
            
        }.resume()
    }
    
}
