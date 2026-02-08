//
//  ContentViewModel.swift
//  M4Homework1
//
//  Created by Oleg Konstantinov on 07.02.2026.
//


import Foundation
import Combine

class ContentViewModel: ObservableObject {
    private let network = NetworkManager()
    @Published var articles: [Article] = []
    private let stringToDate: DateFormatter = {
        $0.timeZone = TimeZone(identifier: "UTC")
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return $0
    }(DateFormatter())
    
    private let releaseDate: RelativeDateTimeFormatter = {
        $0.locale = Locale(identifier: "ru_RU")
        return $0
    }(RelativeDateTimeFormatter())
    

    
    func getNews(title: String) {
        network.getNews(title: title) {[weak self] response in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.articles = response.articles.map({ item in
                    guard let published = self.stringToDate.date(from: item.publishedAt ?? "") else {
                        return Article(title: item.title, description: item.description, image: item.image, publishedAt: item.publishedAt)
                    }
                    return Article(title: item.title, description: item.description, image: item.image, publishedAt: self.releaseDate.localizedString(for: published, relativeTo: .now))
                })
            }
        }
    }
}
