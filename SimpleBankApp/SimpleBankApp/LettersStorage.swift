//
//  LettersStorage.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import Foundation

class LettersStorage: ObservableObject {
    @Published var letters: [Letter] = [Letter(id: UUID().uuidString,
                                               title: "Отмена перевода",
                                               text: "Прошу отменить перевод",
                                               isRead: false),
                                        Letter(id: UUID().uuidString,
                                               title: "Уточнение реквизитов",
                                               text: "Прошу уточнить рекизиты для перевода",
                                               isRead: true),
                                        Letter(id: UUID().uuidString,
                                               title: "Режим работы в праздники",
                                               text: "Уточните пожалуйста Режим работы в праздничные дни",
                                               isRead: true)]
   
}
