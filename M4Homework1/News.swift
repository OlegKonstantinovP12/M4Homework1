//
//  News.swift
//  M4Homework1
//
//  Created by Oleg Konstantinov on 07.02.2026.
//

import Foundation

nonisolated
struct News: Decodable, Identifiable {
    var id: String { UUID().uuidString }
    let articles: [Article]
}


struct Article: Decodable, Identifiable {
    var id: String { UUID().uuidString }
    let title: String?
    let description: String?
    let image: String?
    let publishedAt: String?
}
