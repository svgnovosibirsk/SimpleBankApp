//
//  CreateLetterView.swift
//  SimpleBankApp
//
//  Created by Sergey on 01.01.2025.
//

import SwiftUI

struct CcreateLetterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text("Тема")
                .font(.title2)
                .padding(.top, 50)
            TextField("Тема", text: $title)
                .fontWeight(.semibold)
            
            Text("Введите текст")
                .font(.title2)
            TextEditor(text: $text)
                .overlay(
                    Rectangle()
                        .stroke(.black))
                .padding(15)
            
            Button("Send") {
                showingAlert = true
            }
            .alert("Письмо успешно отправлено", isPresented: $showingAlert) {
                Button("OK") { dismiss() }
            } message: {
                Text("")
            }
            
            Button("Cancel") {
                dismiss()
            }
            .padding(20)
        }
        .padding(20)
    }
}
