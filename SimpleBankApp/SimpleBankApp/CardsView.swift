//
//  CardsView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI

struct CardsView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            Spacer()
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
                    
                    Text("1234 4321 1234 4321")
                        .padding(5)
                }
            }
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
            Spacer()
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
