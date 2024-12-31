//
//  AccountView.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import SwiftUI

struct AccountView: View {
    let account: Account
    
    var body: some View {
        Form {
            Section("Юр. лицо") {
                Text(account.description)
                    .font(.largeTitle)
            }
            
            Section("ИНН") {
                Text(account.inn)
            }
            
            Section("КПП") {
                Text(account.kpp)
            }
            
            Section("Сумма") {
                Text(account.sum, format: .currency(code: ""))
                    .font(.title)
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: .example)
    }
}
