//
//  AccountsStorage.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import Foundation

class AccountsStorage: ObservableObject {
    @Published var accounts: [Account] = [Account(id: UUID().uuidString,
                                                  corAccount: "9876 7890 7654 5432",
                                                  kpp: "98765",
                                                  inn: "321654987",
                                                  sum: 100987.89,
                                                  description: "ООО Алтай"),
                                          Account(id: UUID().uuidString,
                                                  corAccount: "1234 4321 1234 4321",
                                                  kpp: "19876",
                                                  inn: "987123654",
                                                  sum: 200897.22,
                                                  description: "ООО Валдай"),
                                          Account(id: UUID().uuidString,
                                                  corAccount: "5678 4321 9876 5678",
                                                  kpp: "67834",
                                                  inn: "789456398",
                                                  sum: 500987.78,
                                                  description: "ООО Танай"),]
}
