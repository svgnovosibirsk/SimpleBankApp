//
//  ContactsView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI

struct ContactsView: View {
    @Environment(\.openURL) var openURL
    
    let letters = Array("СОВКОМБАНК")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Звонки по россии")
                Text("8 800 100 006")
                    .font(.title2)
            }
            .padding(.top, 50)
            
            VStack {
                Text("e-mail")
                Text("smi@sovcombank.ru")
                    .font(.title2)
            }
            .padding(20)
            
            Spacer()
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
            
            Spacer()
            
            VStack {
                Button("Написать в банк") {
                    showingSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding(20)
                .sheet(isPresented: $showingSheet) {
                    CcreateLetterView()
                }
                
                Button("Посетить сайт") {
                    if let url = URL(string: "https://sovcombank.ru") {
                        openURL(url)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.bottom, 50)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
