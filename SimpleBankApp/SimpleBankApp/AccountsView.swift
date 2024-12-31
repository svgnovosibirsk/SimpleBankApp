//
//  AccountsView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI

struct AccountsView: View {
    @StateObject var accountsStorage = AccountsStorage()
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        NavigationStack {
            
            // MARK: Top views
            
            HStack {
                Spacer()
                NavigationLink() {
                    LetterView()
                } label: {
                    Image(systemName: "mail")
                        .padding(15)
                        .foregroundStyle(.black)
                        .clipShape(Circle())
                        .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
                    )
                    .onAppear {
                        animationAmount = 2
                    }
                }
                
                NavigationLink() {
                    ContactsView()
                } label: {
                    Image(systemName: "info")
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.black))
                        .padding(15)
                }
            }
            
            // MARK: Acccounts carusel
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(accountsStorage.accounts) { account in
                        NavigationLink {
                            AccountView(account: account)
                        } label: {
                            HStack {
                                Image(systemName: "dollarsign")
                                    .foregroundColor(.blue)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.blue, lineWidth: 1)
                                    )
                                VStack(alignment: .leading) {
                                    Text(account.description)
                                        .foregroundStyle(.black)
                                        .font(.headline)
                                    Text(account.sum, format: .currency(code: ""))
                                        .foregroundStyle(.black.opacity(0.5))
                                }
                            }
                            .padding(20)
                            .overlay(
                                Rectangle()
                                    .strokeBorder(.blue, lineWidth: 1)
                            )
                        }
                    }
                }
               
                
            }
            .padding(20)
            
            // MARK: List of actions
            
            Form {
                NavigationLink() {
                    DepositView()
                } label: {
                    HStack {
                        Image(systemName: "percent")
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .strokeBorder(.blue, lineWidth: 1)
                            )
                        Text("Дерпозиты")
                            .padding(10)
                    }
                }
                
            
                .navigationTitle("Счета")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
