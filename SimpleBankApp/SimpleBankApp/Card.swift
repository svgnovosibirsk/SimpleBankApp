//
//  Card.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import Foundation

struct Card {
    static let types = ["Visa", "Master Card", "Mir", "Union pay"]
    
    var type = 0
    
    var name = ""
    var lastName = ""
    var adress = ""
    
    var isValidOrder: Bool {
        if name.isEmpty || lastName.isEmpty || adress.isEmpty {
            return false
        }

        return true
    }
}
