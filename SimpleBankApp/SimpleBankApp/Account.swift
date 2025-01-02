//
//  Account.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import Foundation

struct Account: Codable, Identifiable, Hashable {
    let id: String
    let corAccount: String
    let kpp: String
    let inn: String
    let sum: Double
    let description: String
    
    static let example = Account(id: UUID().uuidString,
                                 corAccount: "1234 4321 1234 4321",
                                 kpp: "09876",
                                 inn: "987123654",
                                 sum: 200897.20,
                                 description: "ООО Валдай")
}
