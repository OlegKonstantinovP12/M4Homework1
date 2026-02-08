//
//  Title.swift
//  M4Homework1
//
//  Created by Oleg Konstantinov on 08.02.2026.
//

import Foundation

enum NewsCategory: String, CaseIterable {
    case general
    case world
    case nation
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    func showTitle(news: NewsCategory) -> String {
        switch news {
        case .general:
            "Основные"
        case .world:
            "Мир"
        case .nation:
            "Россия"
        case .business:
            "Бизнес"
        case .technology:
            "Технологии"
        case .entertainment:
            "Развлечения"
        case .sports:
            "Спотр"
        case .science:
            "Наука"
        case .health:
            "Здоровье"
        }
    }
}


