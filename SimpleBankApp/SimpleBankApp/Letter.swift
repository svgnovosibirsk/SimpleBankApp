//
//  Letter.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import Foundation

struct Letter: Codable, Identifiable {
    let id: String
    let title: String
    let text: String
    let isRead: Bool
    
    static let example = Letter(id: UUID().uuidString,
                                title: "Уточнение реквизитов",
                                text: "Прошу уточнить рекизиты для перевода",
                                isRead: false)
}
