//
//  LetterView.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import SwiftUI

struct LetterView: View {
    @StateObject var lettersStorage = LettersStorage()
    
    @State private var searchText = ""
    
    var filteredLetters: [Letter] {
        if searchText.isEmpty {
            return lettersStorage.letters
        } else {
            return  lettersStorage.letters.filter { $0.title.localizedStandardContains(searchText) ||  $0.text.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredLetters) { letter in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(letter.title)
                            .font(letter.isRead ? .title2 : .title)
                            .foregroundColor(letter.isRead ? .gray : .black)
                        Text(letter.text)
                            .font(letter.isRead ? .subheadline : .headline)
                            .foregroundColor(letter.isRead ? .gray : .black)
                    }
                }
                .onDelete(perform: removeLetters)
            }
            .searchable(text: $searchText, prompt: "Найти письмо")
            
            Button("Добавить тестовое письмо") {
                let titles = ["Срочно", "Перевод", "Платежи"]
                let bodies = ["Прошу сообщить ...",
                              "Подскажите пожалуйста ...",
                              "Была информация что ..."]
                let letter = Letter(id: UUID().uuidString,
                                    title: titles.randomElement() ?? "Тема",
                                    text: bodies.randomElement() ?? "Lorem ipsum ...",
                                    isRead: Bool.random())
                lettersStorage.letters.append(letter)
            }
            
            
            .navigationTitle("Переписка с банком")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeLetters(at offsets: IndexSet) {
        lettersStorage.letters.remove(atOffsets: offsets)
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
    }
}
