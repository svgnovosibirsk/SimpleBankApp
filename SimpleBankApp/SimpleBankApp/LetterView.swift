//
//  LetterView.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import SwiftUI

struct LetterView: View {
    let lettersStorage = LettersStorage()
    
    var body: some View {
        NavigationStack {
            List(lettersStorage.letters) { letter in
                VStack(alignment: .leading, spacing: 10) {
                    Text(letter.title)
                        .font(letter.isRead ? .title2 : .title)
                        .foregroundColor(letter.isRead ? .gray : .black)
                    Text(letter.text)
                        .font(letter.isRead ? .subheadline : .headline)
                        .foregroundColor(letter.isRead ? .gray : .black)
                }
                // TODO: alignment leading
            }
            .navigationTitle("Переписка с банком")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
    }
}
