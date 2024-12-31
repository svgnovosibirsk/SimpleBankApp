//
//  AccountsListView.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import SwiftUI

struct AccountsListView: View {
    let accountsStorage = AccountsStorage()
    
    var body: some View {
        NavigationStack {
            List(accountsStorage.accounts) { account in
                VStack(alignment: .leading, spacing: 10) {
                    Text(account.description)
                        .font(.title2)
                    Text(account.corAccount)
                    Text(account.sum, format: .currency(code: ""))
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Счета")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountsListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsListView()
    }
}
