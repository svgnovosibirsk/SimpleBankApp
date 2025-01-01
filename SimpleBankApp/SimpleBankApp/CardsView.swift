//
//  CardsView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI

struct CardsView: View {
    @State private var showingCardorderAlert = false
    @State private var dragAmount = CGSize.zero
    @State private var card: Card = Card()
    
    var body: some View {
        VStack {
            Spacer()
            
            // MARK: Card
            
            ZStack{
                LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                
                VStack{
                    HStack{
                        Text("СОВКОМ")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("БАНК")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
            }
            .cardNumbered(with: "1234 4321 1234 4321")
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.default) {
                            dragAmount = .zero
                        }
                    }
            )
            
            Spacer()
            
            // MARK: Order form
            
            VStack {
                Picker("Тип карты", selection: $card.type) {
                    ForEach(Card.types, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.inline)
                
                TextField("Имя", text: $card.name)
                    .padding(10)
                TextField("Фамилия", text: $card.lastName)
                    .padding(10)
                TextField("Адрес", text: $card.adress)
                    .padding(10)
            }

            Spacer()
            
            Button("Заказать карту") {
                showingCardorderAlert = true
            }
                .buttonStyle(.borderedProminent)
                .disabled(card.isValidOrder == false)
            
            Spacer()
        }
        .alert("Карта успешно заказана", isPresented: $showingCardorderAlert) {
            Button("OK") { }
        } message: {
            Text("")
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
