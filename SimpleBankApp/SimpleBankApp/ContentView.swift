//
//  ContentView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AccountsView()
                .tabItem {
                    Label("Счета", systemImage: "dollarsign.circle")
                }
            CardsView()
                .tabItem {
                    Label("Карты", systemImage: "creditcard")
                }
            ContactsView()
                .tabItem {
                    Label("Контакты", systemImage: "phone")
                }
            BranchesView()
                .tabItem {
                    Label("Отделения", systemImage: "map")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
